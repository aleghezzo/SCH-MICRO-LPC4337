SPIFI Pins:
SPIFI_SCK: Serial clock for the flash memory, switched only during active bits on the MOSI/IO0,
MISO/IO1, and IO3:2 lines.
PIN: P3_3 (Output only)

* SPIFI_CS: Chip select for the flash memory, driven LOW while a command is in progress, and
high between commands. 
PIN: P3_8 (I/O)

SPIFI_MOSI or IO0: This is an output except in quad/dual input data fields. After a quad/dual input data field,
it becomes an output again one serial clock period after CS goes high
PIN: P3_7

SPIFI_MISO or IO1: This is an output in quad/dual opcode, address, intermediate, and output data fields,
and an input in SPI mode and in quad/dual input data fields. After an input data field in
quad/dual mode, it becomes an output again one serial clock period after CS goes
high
PIN: P3_6


SPIFI_SIO[3:2]: These are outputs in quad opcode, address, intermediate, and output data fields, and
inputs in quad input data fields. These pins (or any other GPIO pins) may be used,
when not in quad mode, as software controlled Hold and/or WPn controls for flash
memories that support those functions.

PIN: 
SPIFI_SIO2 => P3_5
SPIFI_SIO3 => P3_4


0000 0000 -- 007F FFFFh (64Mb => 8MB)

En el LPC arranca en 0x1400 0000

---------------------------------------------------------------
LQFP144 ==> EMC de 16 bits de bus
EMC_A[15:0]
EMC_D[15:0]
* EMC_BLS[1:0]
* EMC_CS[1:0]
* EMC_OE
EMC_WE
EMC_CKEOUT[1:0]
EMC_CLK0,
EMC_CLK3;
EMC_CLK01,
EMC_CLK23
EMC_DQMOUT[1:0]
* EMC_DYCS[1:0]
* EMC_CAS
* EMC_RAS
* => Active when low
---------------------------------------

EMC_A0 => P2_9
EMC_A1 => P2_10
EMC_A2 => P2_11
EMC_A3 => P2_12
EMC_A4 => P2_13
EMC_A5 => P1_0
EMC_A6 => P1_1
EMC_A7 => P1_2
EMC_A8 => P2_8
EMC_A9 => P2_7
EMC_A10 => P2_6
EMC_A11 => P2_2
EMC_A12 => P2_1
EMC_A13 => P2_0
EMC_A14 => P6_8
EMC_A15 => P6_7

EMC_OE => P1_3
EMC_BLS0 => P1_4

EMC_D0 => P1_7
EMC_D1 => P1_8
EMC_D2 => P1_9
EMC_D3 => P1_10
EMC_D4 => P1_11
EMC_D5 => P1_12
EMC_D6 => P1_13
EMC_D7 => P1_14
EMC_D8 => P1_15
EMC_D9 => P1_16
EMC_D10 => P1_18
EMC_D11 => P1_20


EMC_D15 => P1_4


CHIP SELECTS
P1_5 => EMC_CS0
P6_3 => EMC_CS1

-------------------------------------

CLK_DELAY EMC_CLKn SDRAM clock output delay. 0
R/W
-
-
0x0 = no delay
0x1111  0.5 ns delay
0x2222  1.0 ns delay
0x3333  1.5 ns delay
0x4444  2.0 ns delay
0x5555  2.5 ns delay
0x6666  3.0 ns delay
0x7777  3.5 ns delay

Program the SDRAM Delay value for the EMC_CLKn lines in the EMCDELAYCLK
register in the SCU block. (See Section 17.4.9.). Add the SDRAM delay for most
SDRAM devices running at frequencies above 96 MHz under typical conditions. Add
the SDRAM delay at any frequency to compensate for variations over temperature.
For details, see the LPC435x data sheets.

---------------------------------------------------------------------------------------------
Lower priority requests are only serviced when no higher priority requests are active.
Same priority requests are serviced in turn (round-robin arbitration).

Static memories are mapped below 0x2000 0000. This memory area is addressed by the M4 I/D-bus.

Dynamic memories are mapped above 0x1FFF FFFF. This memory area is addressed by
the M4 S-bus. When the M4 core is executing from SDRAM not much bandwidth is
remaining for lower priority bus masters (M0 and other bus masters except for the LCD
controller). Also see Section 3.6 “AHB Multilayer matrix configuration”.

Eight independently-configurable memory chip selects are supported:
• Pins EMC_CS3 to EMC_CS0 are used to select static memory devices.
• Pins EMC_DYCS3 to EMC_DYCS0 are used to select dynamic memory devices.

Static memory chip select ranges are each 16 MB in size, while dynamic memory chip
selects cover a range of 256 MB each.

23.8.5 Using the EMC with SDRAM

SDRAM burst length: 4
"For 32-bit wide chip selects data is transferred to and from dynamic memory in SDRAM
bursts of four."


-----------------------------------------------------------------------------------------------------------------------
^ --- Burst: acelerar la transferencia - Te pone el dato + los 4 siguientes (consecutivos)
	
	CPU: Poner una dirección - Exitar al bus de address (1 clock)
	CPU: Control ¿Qué voy a hacer? Read o write			(1 clock)
	(2 lineas de control - mem read y mem write)

	MEM: Obedece - en el menor tiempo posible. Puede implicar muchos cycles de clock
	Logica de decodificación - Selecciono el chip de ram indicado

		Caso ej: 
		4 areas de 256 MBytes

		2 espacios de 256
			[1F000000] 1F hasta 3D es un chip, 3D hasta 5D es otro
			[3E000000]


000111111
01F000000 03DFFFFFF   - CS1 (Chip select)
03E000000 05CFFFFFF   - CS2
001111110

------------------------------------------------------------------

Una vez que le llega el chip select, el chip deja de estar en alta impedancia.
Se habilita
Pone el dato en el bus de datos (para lectura)
En el cyclo de bus siguiente le pones el dato (para escritura) y esperas a que el chip lo lea y lo grabe.


Si cada vez que tengo que leer gasto 2 cycles en transferir el dato

----------------------------------------------------------------------------------------------------------------------------


Chapter 24: LPC43xx/LPC43Sxx SPI Flash Interface (SPIFI)

64 MB SPIFI data   ----- 0x1400 0000


128 MB dynamic external memory DYCS0 ---------- 0x2800 0000

----------------------------------------------------------------------------------------------------------------------------



"The only hardware you have to add to the standard AHB transport infrastructure
is the multiplexor block to connect the multiple masters to the peripherals."

----------------------------------------------------------------------------------------------------------------------------

