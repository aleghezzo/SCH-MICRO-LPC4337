EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 6
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Alessandro_Custom:16MB-FLASH-M29F160FB5AN6F2 NOR_Flash?
U 1 1 5F645E93
P 5250 1950
AR Path="/5F64163B/5F642903/5F645E93" Ref="NOR_Flash?"  Part="1" 
AR Path="/5F64163B/5F66A484/5F645E93" Ref="NOR_Flash?"  Part="1" 
AR Path="/5F64163B/5F66F904/5F645E93" Ref="NOR_Flash?"  Part="1" 
AR Path="/5F64163B/5F6713C4/5F645E93" Ref="NOR_Flash?"  Part="1" 
F 0 "NOR_Flash?" H 6000 700 50  0000 C CNN
F 1 "16MB-FLASH-M29F160FB5AN6F2" H 6000 1874 50  0000 C CNN
F 2 "" H 5250 1950 50  0001 C CNN
F 3 "" H 5250 1950 50  0001 C CNN
	1    5250 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 2200 4900 2200
Text HLabel 4900 2200 0    50   Input ~ 0
A15
Text HLabel 4900 2300 0    50   Input ~ 0
A14
Wire Wire Line
	5400 2400 4900 2400
Text HLabel 4900 2400 0    50   Input ~ 0
A13
Wire Wire Line
	5400 2500 4900 2500
Text HLabel 4900 2500 0    50   Input ~ 0
A12
Wire Wire Line
	5400 2600 4900 2600
Text HLabel 4900 2600 0    50   Input ~ 0
A11
Wire Wire Line
	5400 2700 4900 2700
Text HLabel 4900 2700 0    50   Input ~ 0
A10
Wire Wire Line
	5400 2800 4900 2800
Text HLabel 4900 2800 0    50   Input ~ 0
A9
Wire Wire Line
	5400 2900 4900 2900
Text HLabel 4900 2900 0    50   Input ~ 0
A8
Wire Wire Line
	5400 3000 4900 3000
Text HLabel 4900 3000 0    50   Input ~ 0
A9
Wire Wire Line
	5400 3700 4900 3700
Text HLabel 4900 3700 0    50   Input ~ 0
A18
Wire Wire Line
	5400 3800 4900 3800
Text HLabel 4900 3800 0    50   Input ~ 0
A17
Wire Wire Line
	5400 3900 4900 3900
Text HLabel 4900 3900 0    50   Input ~ 0
A7
Wire Wire Line
	5400 4000 4900 4000
Text HLabel 4900 4000 0    50   Input ~ 0
A6
Wire Wire Line
	5400 4100 4900 4100
Text HLabel 4900 4100 0    50   Input ~ 0
A5
Wire Wire Line
	5400 4200 4900 4200
Text HLabel 4900 4200 0    50   Input ~ 0
A4
Wire Wire Line
	5400 4300 4900 4300
Text HLabel 4900 4300 0    50   Input ~ 0
A3
Wire Wire Line
	5400 4400 4900 4400
Text HLabel 4900 4400 0    50   Input ~ 0
A2
Wire Wire Line
	5400 4500 4900 4500
Text HLabel 4900 4500 0    50   Input ~ 0
A1
Wire Wire Line
	6600 2200 7100 2200
Text HLabel 7100 2200 2    50   Input ~ 0
A16
Wire Wire Line
	6600 4500 7100 4500
Text HLabel 7100 4500 2    50   Input ~ 0
A0
Wire Wire Line
	5400 2300 4900 2300
NoConn ~ 5400 3100
NoConn ~ 5400 3400
NoConn ~ 5400 3500
Wire Wire Line
	6600 2400 7100 2400
$Comp
L power:GND #PWR?
U 1 1 5F64F9BB
P 7100 2400
AR Path="/5F64163B/5F642903/5F64F9BB" Ref="#PWR?"  Part="1" 
AR Path="/5F64163B/5F66A484/5F64F9BB" Ref="#PWR?"  Part="1" 
AR Path="/5F64163B/5F66F904/5F64F9BB" Ref="#PWR?"  Part="1" 
AR Path="/5F64163B/5F6713C4/5F64F9BB" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7100 2150 50  0001 C CNN
F 1 "GND" V 7105 2272 50  0000 R CNN
F 2 "" H 7100 2400 50  0001 C CNN
F 3 "" H 7100 2400 50  0001 C CNN
	1    7100 2400
	0    -1   -1   0   
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 5F6512E5
P 7100 3300
AR Path="/5F64163B/5F642903/5F6512E5" Ref="#PWR?"  Part="1" 
AR Path="/5F64163B/5F66A484/5F6512E5" Ref="#PWR?"  Part="1" 
AR Path="/5F64163B/5F66F904/5F6512E5" Ref="#PWR?"  Part="1" 
AR Path="/5F64163B/5F6713C4/5F6512E5" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7100 3150 50  0001 C CNN
F 1 "+3V3" V 7115 3428 50  0000 L CNN
F 2 "" H 7100 3300 50  0001 C CNN
F 3 "" H 7100 3300 50  0001 C CNN
	1    7100 3300
	0    1    1    0   
$EndComp
Wire Wire Line
	6600 3300 7100 3300
Wire Wire Line
	6600 4300 7100 4300
$Comp
L power:GND #PWR?
U 1 1 5F652461
P 7100 4300
AR Path="/5F64163B/5F642903/5F652461" Ref="#PWR?"  Part="1" 
AR Path="/5F64163B/5F66A484/5F652461" Ref="#PWR?"  Part="1" 
AR Path="/5F64163B/5F66F904/5F652461" Ref="#PWR?"  Part="1" 
AR Path="/5F64163B/5F6713C4/5F652461" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7100 4050 50  0001 C CNN
F 1 "GND" V 7105 4172 50  0000 R CNN
F 2 "" H 7100 4300 50  0001 C CNN
F 3 "" H 7100 4300 50  0001 C CNN
	1    7100 4300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6600 4200 7100 4200
Text HLabel 7100 4200 2    50   Input ~ 0
OUTPUT_ENABLE
Text HLabel 7100 3200 2    50   Input ~ 0
DQ4
Wire Wire Line
	6600 3100 7100 3100
Text HLabel 7100 3100 2    50   Input ~ 0
DQ12
Wire Wire Line
	6600 3000 7100 3000
Text HLabel 7100 3000 2    50   Input ~ 0
DQ5
Wire Wire Line
	6600 2900 7100 2900
Text HLabel 7100 2900 2    50   Input ~ 0
DQ13
Wire Wire Line
	6600 2800 7100 2800
Text HLabel 7100 2800 2    50   Input ~ 0
DQ6
Wire Wire Line
	6600 2700 7100 2700
Text HLabel 7100 2700 2    50   Input ~ 0
DQ14
Wire Wire Line
	6600 2600 7100 2600
Text HLabel 7100 2600 2    50   Input ~ 0
DQ7
Wire Wire Line
	6600 2500 7100 2500
Text HLabel 7100 2500 2    50   Input ~ 0
DQ15A-1
Wire Wire Line
	6600 3200 7100 3200
Text HLabel 7100 4400 2    50   Input ~ 0
CLOCK_ENABLE
Wire Wire Line
	6600 4000 7100 4000
Text HLabel 7100 4000 2    50   Input ~ 0
DQ8
Wire Wire Line
	6600 3900 7100 3900
Text HLabel 7100 3900 2    50   Input ~ 0
DQ1
Wire Wire Line
	6600 3800 7100 3800
Text HLabel 7100 3800 2    50   Input ~ 0
DQ9
Wire Wire Line
	6600 3700 7100 3700
Text HLabel 7100 3700 2    50   Input ~ 0
DQ2
Wire Wire Line
	6600 3600 7100 3600
Text HLabel 7100 3600 2    50   Input ~ 0
DQ10
Wire Wire Line
	6600 3500 7100 3500
Text HLabel 7100 3500 2    50   Input ~ 0
DQ3
Wire Wire Line
	6600 3400 7100 3400
Text HLabel 7100 3400 2    50   Input ~ 0
DQ11
Wire Wire Line
	6600 4400 7100 4400
Wire Wire Line
	6600 4100 7100 4100
Text HLabel 7100 4100 2    50   Input ~ 0
DQ0
Wire Wire Line
	5400 3200 4900 3200
Text HLabel 4900 3200 0    50   Input ~ 0
WE#
Wire Wire Line
	4900 3300 5400 3300
Text HLabel 4900 3300 0    50   Input ~ 0
RP#
Wire Wire Line
	5400 3600 4900 3600
Text HLabel 4900 3600 0    50   Input ~ 0
R_B#
Wire Wire Line
	6600 2300 7100 2300
Text HLabel 7100 2300 2    50   Input ~ 0
BYTE#
$EndSCHEMATC