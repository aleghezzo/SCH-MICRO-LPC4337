/*
 * @brief LPC18xx/43xx EMC driver
 *
 * @note
 * Copyright(C) NXP Semiconductors, 2012
 * All rights reserved.
 *
 * @par
 * Software that is described herein is for illustrative purposes only
 * which provides customers with programming information regarding the
 * LPC products.  This software is supplied "AS IS" without any warranties of
 * any kind, and NXP Semiconductors and its licensor disclaim any and
 * all warranties, express or implied, including all implied warranties of
 * merchantability, fitness for a particular purpose and non-infringement of
 * intellectual property rights.  NXP Semiconductors assumes no responsibility
 * or liability for the use of the software, conveys no license or rights under any
 * patent, copyright, mask work right, or any other intellectual property rights in
 * or to any products. NXP Semiconductors reserves the right to make changes
 * in the software without notification. NXP Semiconductors also makes no
 * representation or warranty that such application will be suitable for the
 * specified use without further testing or modification.
 *
 * @par
 * Permission to use, copy, modify, and distribute this software and its
 * documentation is hereby granted, under NXP Semiconductors' and its
 * licensor's relevant copyrights in the software, without fee, provided that it
 * is used in conjunction with NXP Semiconductors microcontrollers.  This
 * copyright, permission, and disclaimer notice must appear in all copies of
 * this code.
 */

#include "emc.h"

/*****************************************************************************
 * Public functions
 ****************************************************************************/
#define LPC_EMC_BASE              0x40005000
#define LPC_EMC                   ((LPC_EMC_T              *) LPC_EMC_BASE)

/* Dyanmic memory setup */
void Chip_EMC_Dynamic_Init(IP_EMC_DYN_CONFIG_T *Dynamic_Config)
{
	uint32_t ClkFreq;

	/* Note clocks must be enabled prior to this call */
	ClkFreq = Chip_Clock_GetEMCRate();

	initDynMem(LPC_EMC, Dynamic_Config, ClkFreq);
}

/* Enable Dynamic Memory Controller */
void Chip_EMC_Dynamic_Enable(uint8_t Enable)
{
	if (Enable) {
		LPC_EMC->DYNAMICCONTROL |= EMC_DYN_CONTROL_ENABLE;
	}
	else {
		LPC_EMC->DYNAMICCONTROL &= ~EMC_DYN_CONTROL_ENABLE;
	}
}

#define CUSTOM_MAX_CHIPS 2
/* Initializes the Dynamic Controller according to the specified parameters
   in the IP_EMC_DYN_CONFIG_T */
void initDynMem(LPC_EMC_T *pEMC, IP_EMC_DYN_CONFIG_T *Dynamic_Config, uint32_t EMC_Clock)
{
	uint32_t ChipSelect, tmpclk;
	volatile int i;

	for (ChipSelect = 0; ChipSelect < CUSTOM_MAX_CHIPS; ChipSelect++) {
		LPC_EMC_T *EMC_Reg_add = (LPC_EMC_T *) ((uint32_t) pEMC + (ChipSelect << 5));

		EMC_Reg_add->DYNAMICRASCAS0    = Dynamic_Config->DevConfig[ChipSelect].RAS |
										 ((Dynamic_Config->DevConfig[ChipSelect].ModeRegister <<
										   (8 - EMC_DYN_MODE_CAS_BIT)) & 0xF00);
		EMC_Reg_add->DYNAMICCONFIG0    = Dynamic_Config->DevConfig[ChipSelect].DynConfig;
	}
	pEMC->DYNAMICREADCONFIG = Dynamic_Config->ReadConfig;	/* Read strategy */

	pEMC->DYNAMICRP         = convertTimmingParam(EMC_Clock, Dynamic_Config->tRP, 1);
	pEMC->DYNAMICRAS        = convertTimmingParam(EMC_Clock, Dynamic_Config->tRAS, 1);
	pEMC->DYNAMICSREX       = convertTimmingParam(EMC_Clock, Dynamic_Config->tSREX, 1);
	pEMC->DYNAMICAPR        = convertTimmingParam(EMC_Clock, Dynamic_Config->tAPR, 1);
	pEMC->DYNAMICDAL        = convertTimmingParam(EMC_Clock, Dynamic_Config->tDAL, 0);
	pEMC->DYNAMICWR         = convertTimmingParam(EMC_Clock, Dynamic_Config->tWR, 1);
	pEMC->DYNAMICRC         = convertTimmingParam(EMC_Clock, Dynamic_Config->tRC, 1);
	pEMC->DYNAMICRFC        = convertTimmingParam(EMC_Clock, Dynamic_Config->tRFC, 1);
	pEMC->DYNAMICXSR        = convertTimmingParam(EMC_Clock, Dynamic_Config->tXSR, 1);
	pEMC->DYNAMICRRD        = convertTimmingParam(EMC_Clock, Dynamic_Config->tRRD, 1);
	pEMC->DYNAMICMRD        = convertTimmingParam(EMC_Clock, Dynamic_Config->tMRD, 1);

	for (i = 0; i < 1000; i++) {	/* wait 100us */
	}
	pEMC->DYNAMICCONTROL    = 0x00000183;	/* Issue NOP command */

	for (i = 0; i < 1000; i++) {}
	pEMC->DYNAMICCONTROL    = 0x00000103;	/* Issue PALL command */

	pEMC->DYNAMICREFRESH = 2;	/* ( 2 * 16 ) -> 32 clock cycles */

	for (i = 0; i < 80; i++) {}

	tmpclk = EMC_DIV_ROUND_UP(convertTimmingParam(EMC_Clock, Dynamic_Config->RefreshPeriod, 0), 16);
	pEMC->DYNAMICREFRESH    = tmpclk;

	pEMC->DYNAMICCONTROL    = 0x00000083;	/* Issue MODE command */

	for (ChipSelect = 0; ChipSelect < CUSTOM_MAX_CHIPS; ChipSelect++) {
		/*uint32_t burst_length;*/
		uint32_t DynAddr;
		uint8_t Col_len;

		Col_len = getColsLen(Dynamic_Config->DevConfig[ChipSelect].DynConfig);
		/* get bus wide: if 32bit, len is 4 else if 16bit len is 2 */
		/* burst_length = 1 << ((((Dynamic_Config->DynConfig[ChipSelect] >> 14) & 1)^1) +1); */
		if (Dynamic_Config->DevConfig[ChipSelect].DynConfig & (1 << EMC_DYN_CONFIG_DATA_BUS_WIDTH_BIT)) {
			/*32bit bus */
			/*burst_length = 2;*/
			Col_len += 2;
		}
		else {
			/*burst_length = 4;*/
			Col_len += 1;
		}

		/* Check for RBC mode */
		if (!(Dynamic_Config->DevConfig[ChipSelect].DynConfig & EMC_DYN_CONFIG_LPSDRAM)) {
			if (!(Dynamic_Config->DevConfig[ChipSelect].DynConfig & (0x7 << EMC_DYN_CONFIG_DEV_SIZE_BIT))) {
				/* 2 banks => 1 bank select bit */
				Col_len += 1;
			}
			else {
				/* 4 banks => 2 bank select bits */
				Col_len += 2;
			}
		}

		DynAddr = Dynamic_Config->DevConfig[ChipSelect].BaseAddr;


		if (DynAddr != 0) {
			uint32_t temp;
			uint32_t ModeRegister;
			ModeRegister = Dynamic_Config->DevConfig[ChipSelect].ModeRegister;
			temp = *((volatile uint32_t *) (DynAddr | (ModeRegister << Col_len)));
			temp = temp;
		}
	}
	pEMC->DYNAMICCONTROL    = 0x00000000;	/* Issue NORMAL command */

	/* enable buffers */
	pEMC->DYNAMICCONFIG0    |= 1 << 19;
	pEMC->DYNAMICCONFIG1    |= 1 << 19;
	pEMC->DYNAMICCONFIG2    |= 1 << 19;
	pEMC->DYNAMICCONFIG3    |= 1 << 19;
}
