#ifndef _SPIFI_H_
#define _SPIFI_H_

/*==================[inclusions]=============================================*/

#include <stdint.h>

/*==================[cplusplus]==============================================*/

#ifdef __c
extern "C"
{
#endif

/* ================ ENUMS ================ */
enum _status_t {
  Status_SPIFI_Idle = MAKE_STATUS(kStatusGroup_SPIFI, 0),
  Status_SPIFI_Busy = MAKE_STATUS(kStatusGroup_SPIFI, 1),
  Status_SPIFI_Error = MAKE_STATUS(kStatusGroup_SPIFI, 2)
};

enum spifi_interrupt_enable_t {
    SPIFI_CommandFinishInterruptEnable = SPIFI_CTRL_INTEN_MASK
};

enum spifi_spi_mode_t {
  SPIFI_SPISckLow = 0x0U,
  SPIFI_SPISckHigh = 0x1U
}

enum spifi_data_direction_t {
  SPIFI_DataInput = 0x0U,
  SPIFI_DataOutput = 0x1U
}

enum spifi_command_format_t {
  SPIFI_CommandAllSerial = 0x0,
  SPIFI_CommandDataQuad = 0x1U,
  SPIFI_CommandOpcodeSerial = 0x2U,
  SPIFI_CommandAllQuad = 0x3U
}

enum spifi_command_type_t {
  SPIFI_CommandOpcodeOnly = 0x1U,
  SPIFI_CommandOpcodeAddrOneByte = 0x2U,
  SPIFI_CommandOpcodeAddrTwoBytes = 0x3U,
  SPIFI_CommandOpcodeAddrThreeBytes = 0x4U,
  SPIFI_CommandOpcodeAddrFourBytes = 0x5U,
  SPIFI_CommandNoOpcodeAddrThreeBytes = 0x6U,
  SPIFI_CommandNoOpcodeAddrFourBytes = 0x7U
}

enum spifi_status_flags {
  SPIFI_MemoryCommandWriteFinished = SPIFI_STAT_MCINIT_MASK,
  SPIFI_CommandWriteFinished = SPIFI_STAT_CMD_MASK,
  SPIFI_InterruptRequest = SPIFI_STAT_INTRQ_MASK
}

/* ================ METHODS ================ */
static void SPIFI_EnableDMA (SPIFI_Type *base, bool enable)
static uint32_t SPIFI_GetDataRegisterAddress(SPIFI_Type *base)
static void SPIFI_WriteData (SPIFI_Type *base, uint32_t data)
static void SPIFI_WriteDataByte (SPIFI_Type *base, uint8_t data)
void SPIFI_WriteDataHalfword (SPIFI_Type *base, uint16_t data)
static uint32_t SPIFI_ReadData (SPIFI_Type *base)
static uint8_t SPIFI_ReadDataByte (SPIFI_Type *base)
uint16_t SPIFI_ReadDataHalfword (SPIFI_Type *base)

void SPIFI_Init (SPIFI_Type *base, const spifi_config_t *config)
void SPIFI_GetDefaultConfig (spifi_config_t *config)
void SPIFI_Deinit (SPIFI_Type *base)

void SPIFI_SetCommand (SPIFI_Type *base, spifi_command_t *cmd)
static void SPIFI_SetCommandAddress (SPIFI_Type *base, uint32_t addr)
static void SPIFI_SetCacheLimit (SPIFI_Type *base, uint32_t val)
static void SPIFI_ResetCommand (SPIFI_Type *base)
void SPIFI_SetMemoryCommand (SPIFI_Type *base, spifi_command_t *cmd)
static void SPIFI_EnableInterrupt (SPIFI_Type *base, uint32_t mask)
static void SPIFI_DisableInterrupt (SPIFI_Type *base, uint32_t mask)

static uint32_t SPIFI_GetStatusFlag (SPIFI_Type *base)

/*==================[cplusplus]==============================================*/

#ifdef __c
}
#endif

/** @} doxygen end group definition */
/*==================[end of file]============================================*/
#endif /* #ifndef _SPIFI_H_ */