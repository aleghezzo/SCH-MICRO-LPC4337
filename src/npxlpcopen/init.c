/* Initialization code for TP4 */
#include "clock_18xx_43xx.h"
#include "board.h"
#include "dualcore_common.h"
#include "chip_lpc43xx.h"
#include "spi_18xx_43xx.h"

void main() {
    // Inicializacion de CLK
    Chip_Clock_EnableCrystal();
    Chip_Clock_Enable(CLK_MX_EMC); // EMC - SDRAM CLK Init
    Chip_Clock_Enable(CLK_SPIFI); // SPIFI - ROM CLK Init

    /* --------- EMC - SDRAM Initialization ---------- */
    static IP_EMC_DYN_CONFIG_T EMC_DYN_CONFIG;     //TODO: Complete EMC DYN CONFIG ;
    Chip_EMC_Dynamic_Init((IP_EMC_DYN_CONFIG_T *) &EMC_DYN_CONFIG);
    
    /* --------- SPIFI - ROM Initialization ---------- */
    static LPC_SPIFI_T LPC_SPIFI_CONFIG;


    spifi_HW_SetStat((LPC_SPIFI_T * ) &LPC_SPIFI_CONFIG, ); // Write SPIFI controller status register -> Set mode 0?
    
    spifi_HW_SetAddr((LPC_SPIFI_T *) &LPC_SPIFI_CONFIG, 00000000); // Set First Address of SPIF
    for (uint32_t i = 0; i < 16000; i++) {
        spifi_HW_SetAddr(LPC_SPIFI_CONFIG, i+1);
        *((uint32_t *)SPIFI_BASE_ADDR+i) = spifi_HW_GetData32(LPC_SPIFI_CONFIG);
    }

    while(true) {
        //TODO ?
    }

}
