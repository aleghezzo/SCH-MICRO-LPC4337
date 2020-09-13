EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 5
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 1850 1350 0    50   Input ~ 0
IN_PWR_SUPPLY
$Comp
L Regulator_Switching:LM2576HVS-5 U?
U 1 1 5F10E5BA
P 3350 1450
F 0 "U?" H 3350 1817 50  0000 C CNN
F 1 "LM2576HVS-5" H 3350 1726 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TO-263-5_TabPin3" H 3350 1200 50  0001 L CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm2576.pdf" H 3350 1450 50  0001 C CNN
	1    3350 1450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F10F4A6
P 2850 1750
F 0 "#PWR?" H 2850 1500 50  0001 C CNN
F 1 "GND" H 2855 1577 50  0000 C CNN
F 2 "" H 2850 1750 50  0001 C CNN
F 3 "" H 2850 1750 50  0001 C CNN
	1    2850 1750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F10F901
P 3350 1750
F 0 "#PWR?" H 3350 1500 50  0001 C CNN
F 1 "GND" H 3355 1577 50  0000 C CNN
F 2 "" H 3350 1750 50  0001 C CNN
F 3 "" H 3350 1750 50  0001 C CNN
	1    3350 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C?
U 1 1 5F10FE25
P 5250 1700
F 0 "C?" H 5368 1746 50  0000 L CNN
F 1 "1000u" H 5368 1655 50  0000 L CNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-1608-08_AVX-J" H 5288 1550 50  0001 C CNN
F 3 "~" H 5250 1700 50  0001 C CNN
	1    5250 1700
	1    0    0    -1  
$EndComp
$Comp
L pspice:INDUCTOR L?
U 1 1 5F112663
P 4650 1550
F 0 "L?" H 4650 1450 50  0000 C CNN
F 1 "100uH" H 4650 1674 50  0000 C CNN
F 2 "Inductor_SMD:L_12x12mm_H6mm" H 4650 1550 50  0001 C CNN
F 3 "~" H 4650 1550 50  0001 C CNN
	1    4650 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 1550 5250 1550
$Comp
L power:GND #PWR?
U 1 1 5F11485F
P 4100 1850
F 0 "#PWR?" H 4100 1600 50  0001 C CNN
F 1 "GND" H 4105 1677 50  0000 C CNN
F 2 "" H 4100 1850 50  0001 C CNN
F 3 "" H 4100 1850 50  0001 C CNN
	1    4100 1850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F114BCD
P 5250 1850
F 0 "#PWR?" H 5250 1600 50  0001 C CNN
F 1 "GND" H 5255 1677 50  0000 C CNN
F 2 "" H 5250 1850 50  0001 C CNN
F 3 "" H 5250 1850 50  0001 C CNN
	1    5250 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 1350 2850 1350
$Comp
L power:GND #PWR?
U 1 1 5F117364
P 2450 1750
F 0 "#PWR?" H 2450 1500 50  0001 C CNN
F 1 "GND" H 2455 1577 50  0000 C CNN
F 2 "" H 2450 1750 50  0001 C CNN
F 3 "" H 2450 1750 50  0001 C CNN
	1    2450 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 1350 2100 1350
Connection ~ 2450 1350
Wire Wire Line
	5250 1350 5250 1550
Wire Wire Line
	3850 1350 5250 1350
Connection ~ 5250 1550
Wire Wire Line
	2850 1550 2850 1750
Wire Wire Line
	2450 1650 2450 1750
Wire Wire Line
	3850 1550 4100 1550
$Comp
L Device:D_Schottky D?
U 1 1 5F129415
P 4100 1700
F 0 "D?" V 4054 1780 50  0000 L CNN
F 1 "D_Schottky" V 4145 1780 50  0000 L CNN
F 2 "Diode_SMD:D_SMC" H 4100 1700 50  0001 C CNN
F 3 "~" H 4100 1700 50  0001 C CNN
	1    4100 1700
	0    1    1    0   
$EndComp
Connection ~ 4100 1550
Wire Wire Line
	4100 1550 4400 1550
$Comp
L Device:CP C?
U 1 1 5F11735B
P 2450 1500
F 0 "C?" H 2568 1546 50  0000 L CNN
F 1 "100uF" H 2568 1455 50  0000 L CNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-1608-08_AVX-J" H 2488 1350 50  0001 C CNN
F 3 "~" H 2450 1500 50  0001 C CNN
	1    2450 1500
	1    0    0    -1  
$EndComp
Text Label 2450 1350 0    50   ~ 0
Vin
Text Label 5250 1350 0    50   ~ 0
Vout
Wire Wire Line
	5250 1350 5800 1350
Connection ~ 5250 1350
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5F12E9B1
P 2100 1350
F 0 "#FLG?" H 2100 1425 50  0001 C CNN
F 1 "PWR_FLAG" H 2100 1523 50  0000 C CNN
F 2 "" H 2100 1350 50  0001 C CNN
F 3 "~" H 2100 1350 50  0001 C CNN
	1    2100 1350
	1    0    0    -1  
$EndComp
Connection ~ 2100 1350
Wire Wire Line
	2100 1350 1850 1350
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5F12F184
P 2100 1800
F 0 "#FLG?" H 2100 1875 50  0001 C CNN
F 1 "PWR_FLAG" H 2100 1973 50  0000 C CNN
F 2 "" H 2100 1800 50  0001 C CNN
F 3 "~" H 2100 1800 50  0001 C CNN
	1    2100 1800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F131C10
P 2100 1800
F 0 "#PWR?" H 2100 1550 50  0001 C CNN
F 1 "GND" H 2105 1627 50  0000 C CNN
F 2 "" H 2100 1800 50  0001 C CNN
F 3 "" H 2100 1800 50  0001 C CNN
	1    2100 1800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F1CB9C0
P 5800 1350
F 0 "#PWR?" H 5800 1200 50  0001 C CNN
F 1 "+5V" H 5815 1523 50  0000 C CNN
F 2 "" H 5800 1350 50  0001 C CNN
F 3 "" H 5800 1350 50  0001 C CNN
	1    5800 1350
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:LM117_TO3 U?
U 1 1 5F1CC8F8
P 3100 3200
F 0 "U?" H 3100 3442 50  0000 C CNN
F 1 "LM117_TO3" H 3100 3351 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 3100 3400 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm317.pdf" H 3100 3200 50  0001 C CNN
	1    3100 3200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F1CCE6F
P 2800 3200
F 0 "#PWR?" H 2800 3050 50  0001 C CNN
F 1 "+5V" H 2815 3373 50  0000 C CNN
F 2 "" H 2800 3200 50  0001 C CNN
F 3 "" H 2800 3200 50  0001 C CNN
	1    2800 3200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F1CD19C
P 3100 3500
F 0 "#PWR?" H 3100 3250 50  0001 C CNN
F 1 "GND" H 3105 3327 50  0000 C CNN
F 2 "" H 3100 3500 50  0001 C CNN
F 3 "" H 3100 3500 50  0001 C CNN
	1    3100 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 3200 3650 3200
Wire Wire Line
	3650 3200 3650 3350
$Comp
L Device:CP C?
U 1 1 5F1CDFCB
P 3650 3500
F 0 "C?" H 3768 3546 50  0000 L CNN
F 1 "100u" H 3768 3455 50  0000 L CNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-1608-08_AVX-J" H 3688 3350 50  0001 C CNN
F 3 "~" H 3650 3500 50  0001 C CNN
	1    3650 3500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F1CE4A9
P 3650 3650
F 0 "#PWR?" H 3650 3400 50  0001 C CNN
F 1 "GND" H 3655 3477 50  0000 C CNN
F 2 "" H 3650 3650 50  0001 C CNN
F 3 "" H 3650 3650 50  0001 C CNN
	1    3650 3650
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5F1CEA2F
P 3650 3200
F 0 "#PWR?" H 3650 3050 50  0001 C CNN
F 1 "+3.3V" H 3665 3373 50  0000 C CNN
F 2 "" H 3650 3200 50  0001 C CNN
F 3 "" H 3650 3200 50  0001 C CNN
	1    3650 3200
	1    0    0    -1  
$EndComp
Connection ~ 3650 3200
Wire Notes Line
	1050 950  1050 2300
Wire Notes Line
	1050 2300 6350 2300
Wire Notes Line
	6350 2300 6350 950 
Wire Notes Line
	1100 2900 1100 3950
Wire Notes Line
	1100 3950 6350 3950
Wire Notes Line
	6350 3950 6350 2800
Text Notes 5900 2250 0    50   ~ 0
O: 5V 1 A
Text Notes 6000 3900 0    50   ~ 0
O: 3V 
$EndSCHEMATC