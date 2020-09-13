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

