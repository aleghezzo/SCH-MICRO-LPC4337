/* Initialization code for TP4 */
#include "clock_18xx_43xx.h"

void main() {
    // Inicializacion de CLK
    Chip_Clock_EnableCrystal();
    // Inicializacion de Memorias
    // IP_EMC_DYN_CONFIG_T *Dynamic_Config
    IP_EMC_DYN_CONFIG_T dynConfig = {
        /*!< int32_t RefreshPeriod;							Refresh period 
        /*!< uint32_t ReadConfig;							Clock
        /*!< int32_t tRP;									Precharge Command Period 
        /*!< int32_t tRAS;									Active to Precharge Command Period 
        /*!< int32_t tSREX;									Self Refresh Exit Time 
        /*!< int32_t tAPR;									Last Data Out to Active Time 
        /*!< int32_t tDAL;									Data In to Active Command Time 
        /*!< int32_t tWR;									Write Recovery Time 
        /*!< int32_t tRC;									Active to Active Command Period 
        /*!< int32_t tRFC;									Auto-refresh Period 
        /*!< int32_t tXSR;									Exit Selt Refresh 
        /*!< int32_t tRRD;									Active Bank A to Active Bank B Time 
        /*!< int32_t tMRD;									Load Mode register command to Active Command 
        /*!< IP_EMC_DYN_DEVICE_CONFIG_T DevConfig[2];		Device Configuration array */
    }
    
    Chip_EMC_Dynamic_Init(); // EMC - SDRAM
    
}
