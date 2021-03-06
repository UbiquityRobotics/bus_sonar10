EESchema Schematic File Version 2
LIBS:bus_sonar10
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:bus_sonar10-cache
EELAYER 24 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 1 1
Title "Sonar 10"
Date "17 Aug 2014"
Rev "A"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L 3MM_HOLE H1
U 1 1 53AA33AA
P 5500 6600
F 0 "H1" H 5450 6750 50  0000 C CNN
F 1 "3MM_HOLE" H 5500 6450 50  0000 C CNN
F 2 "" H 5500 6600 60  0000 C CNN
F 3 "" H 5500 6600 60  0000 C CNN
	1    5500 6600
	1    0    0    -1  
$EndComp
Text Label 4625 3500 0    50   ~ 0
D13
Text Label 4625 3600 0    50   ~ 0
D12
Text Label 4625 3700 0    50   ~ 0
D11
Text Label 4625 3800 0    50   ~ 0
D10
Text Label 2775 3900 2    50   ~ 0
D8
Text Label 2775 3800 2    50   ~ 0
D7
Text Label 2775 3700 2    50   ~ 0
D6
Text Label 2775 3600 2    50   ~ 0
D5
Text Label 2775 3100 2    50   ~ 0
D4
Text Label 2775 2900 2    50   ~ 0
D2
$Comp
L OSHW_LOGO G1
U 1 1 53AA4798
P 4750 5600
F 0 "G1" H 4750 5800 60  0000 C CNN
F 1 "OSHW_LOGO" H 4750 5425 60  0000 C CNN
F 2 "" H 4750 5600 60  0000 C CNN
F 3 "" H 4750 5600 60  0000 C CNN
	1    4750 5600
	1    0    0    -1  
$EndComp
$Comp
L ATMEGA328_DIP28 U4
U 1 1 53E952D0
P 3700 3250
F 0 "U4" H 3675 4050 50  0000 C CNN
F 1 "ATMEGA328_DIP28" H 3700 2425 50  0000 C CNN
F 2 "" H 3700 3250 60  0000 C CNN
F 3 "" H 3700 3250 60  0000 C CNN
	1    3700 3250
	1    0    0    -1  
$EndComp
$Comp
L BUS_SLAVE_HEADER N1
U 1 1 53E9683A
P 900 1150
F 0 "N1" H 725 600 50  0000 C CNN
F 1 "BUS_SLAVE_HEADER" H 900 1700 50  0000 C CNN
F 2 "" H 900 1150 60  0000 C CNN
F 3 "" H 900 1150 60  0000 C CNN
	1    900  1150
	1    0    0    1   
$EndComp
$Comp
L MCP2562 U3
U 1 1 53E968BB
P 2500 2000
F 0 "U3" H 2250 2300 50  0000 C CNN
F 1 "MCP2562" H 2475 1800 50  0000 C CNN
F 2 "" H 2550 2000 60  0000 C CNN
F 3 "" H 2550 2000 60  0000 C CNN
	1    2500 2000
	1    0    0    -1  
$EndComp
$Comp
L SCHOTTKY_DIODE_VERT D1
U 1 1 53E96A4D
P 4500 6600
F 0 "D1" H 4600 6450 50  0000 C CNN
F 1 "SD101C-TR" H 4775 6725 50  0000 C CNN
F 2 "" H 4500 6600 60  0000 C CNN
F 3 "" H 4500 6600 60  0000 C CNN
	1    4500 6600
	-1   0    0    1   
$EndComp
$Comp
L TERMINATE_JUMPER J1
U 1 1 53E96A70
P 3000 1300
F 0 "J1" H 3050 1500 50  0000 C CNN
F 1 "TERMINATE_JUMPER" H 3000 1100 50  0000 C CNN
F 2 "" H 3000 1300 60  0000 C CNN
F 3 "" H 3000 1300 60  0000 C CNN
	1    3000 1300
	-1   0    0    -1  
$EndComp
$Comp
L FTDI_HEADER N2
U 1 1 53E96ADF
P 1150 7500
F 0 "N2" H 1050 8100 50  0000 C CNN
F 1 "FTDI_HEADER" H 1150 7275 50  0000 C CNN
F 2 "" H 1150 7500 60  0000 C CNN
F 3 "" H 1150 7500 60  0000 C CNN
	1    1150 7500
	1    0    0    -1  
$EndComp
$Comp
L R_HORIZ R6
U 1 1 53E99224
P 2400 1300
F 0 "R6" H 2400 1400 50  0000 C CNN
F 1 ".47" H 2400 1200 50  0000 C CNN
F 2 "" H 2425 1300 60  0000 C CNN
F 3 "" H 2425 1300 60  0000 C CNN
	1    2400 1300
	1    0    0    -1  
$EndComp
NoConn ~ 2700 1400
$Comp
L 74X08 U1
U 1 2 53EA309B
P 1350 2400
F 0 "U1" H 1350 2650 50  0000 C CNN
F 1 "74HCT08" H 1225 2150 50  0000 C CNN
F 2 "" H 1350 2400 60  0000 C CNN
F 3 "" H 1350 2400 60  0000 C CNN
	1    1350 2400
	1    0    0    -1  
$EndComp
$Comp
L VOLTAGE_REGULATOR U2
U 1 1 53EA3E06
P 1550 5500
F 0 "U2" H 1350 5650 50  0000 C CNN
F 1 "LM2940" H 1575 5350 50  0000 L CNN
F 2 "" H 1550 5550 60  0000 C CNN
F 3 "" H 1550 5550 60  0000 C CNN
	1    1550 5500
	1    0    0    -1  
$EndComp
$Comp
L C_VERT C2
U 1 1 53EA3E9D
P 1000 5750
F 0 "C2" H 1020 5840 50  0000 L CNN
F 1 "22uF" H 1020 5660 50  0000 L CNN
F 2 "" H 1038 5600 30  0000 C CNN
F 3 "" H 1000 5750 60  0000 C CNN
	1    1000 5750
	1    0    0    -1  
$EndComp
$Comp
L R_HORIZ R1
U 1 1 53EA42CF
P 1800 6050
F 0 "R1" H 1800 6150 50  0000 C CNN
F 1 ".47" H 1800 5950 50  0000 C CNN
F 2 "" H 1825 6050 60  0000 C CNN
F 3 "" H 1825 6050 60  0000 C CNN
	1    1800 6050
	1    0    0    -1  
$EndComp
$Comp
L C_VERT C4
U 1 1 53EA479D
P 2100 5750
F 0 "C4" H 2120 5840 50  0000 L CNN
F 1 ".1uF" H 2120 5660 50  0000 L CNN
F 2 "" H 2138 5600 30  0000 C CNN
F 3 "" H 2100 5750 60  0000 C CNN
	1    2100 5750
	1    0    0    -1  
$EndComp
$Comp
L C_VERT C5
U 1 1 53EA4CB4
P 2400 5750
F 0 "C5" H 2420 5840 50  0000 L CNN
F 1 "22uF" H 2420 5660 50  0000 L CNN
F 2 "" H 2438 5600 30  0000 C CNN
F 3 "" H 2400 5750 60  0000 C CNN
	1    2400 5750
	1    0    0    -1  
$EndComp
$Comp
L CRYSTAL X1
U 1 1 53EA6D8D
P 1300 4450
F 0 "X1" H 1300 4600 50  0000 C CNN
F 1 "16MHz" H 1300 4300 50  0000 C CNN
F 2 "" H 1300 4450 60  0000 C CNN
F 3 "" H 1300 4450 60  0000 C CNN
	1    1300 4450
	1    0    0    -1  
$EndComp
$Comp
L C_VERT C1
U 1 1 53EA7619
P 900 4750
F 0 "C1" H 920 4840 50  0000 L CNN
F 1 "18pF" H 920 4660 50  0000 L CNN
F 2 "" H 938 4600 30  0000 C CNN
F 3 "" H 900 4750 60  0000 C CNN
	1    900  4750
	1    0    0    -1  
$EndComp
$Comp
L C_VERT C3
U 1 1 53EA7713
P 1700 4750
F 0 "C3" H 1720 4840 50  0000 L CNN
F 1 "18pF" H 1720 4660 50  0000 L CNN
F 2 "" H 1738 4600 30  0000 C CNN
F 3 "" H 1700 4750 60  0000 C CNN
	1    1700 4750
	1    0    0    -1  
$EndComp
$Comp
L R_VERT R2
U 1 1 53EAC63C
P 1800 6750
F 0 "R2" H 1870 6800 50  0000 L CNN
F 1 "22K" H 1870 6700 50  0000 L CNN
F 2 "" H 1800 6800 60  0000 C CNN
F 3 "" H 1800 6800 60  0000 C CNN
	1    1800 6750
	1    0    0    -1  
$EndComp
$Comp
L R_VERT R4
U 1 1 53EACA5C
P 2100 6750
F 0 "R4" H 2170 6800 50  0000 L CNN
F 1 "100K" H 2170 6700 50  0000 L CNN
F 2 "" H 2100 6800 60  0000 C CNN
F 3 "" H 2100 6800 60  0000 C CNN
	1    2100 6750
	1    0    0    -1  
$EndComp
$Comp
L R_VERT R5
U 1 1 53EACAD9
P 2400 6750
F 0 "R5" H 2470 6800 50  0000 L CNN
F 1 "100K" H 2470 6700 50  0000 L CNN
F 2 "" H 2400 6800 60  0000 C CNN
F 3 "" H 2400 6800 60  0000 C CNN
	1    2400 6750
	1    0    0    -1  
$EndComp
NoConn ~ 1500 7350
NoConn ~ 1500 7450
$Comp
L 74X08 U1
U 2 1 53EAE540
P 3400 6950
F 0 "U1" H 3400 7200 50  0000 C CNN
F 1 "74HCT08" H 3275 6700 50  0000 C CNN
F 2 "" H 3400 6950 60  0000 C CNN
F 3 "" H 3400 6950 60  0000 C CNN
	2    3400 6950
	1    0    0    -1  
$EndComp
$Comp
L C_HORIZ C10
U 1 1 53E996AB
P 4200 6950
F 0 "C10" H 4260 7010 50  0000 L CNN
F 1 "1uF" H 4260 6880 50  0000 L CNN
F 2 "" H 4238 6800 30  0000 C CNN
F 3 "" H 4200 6950 60  0000 C CNN
	1    4200 6950
	1    0    0    -1  
$EndComp
$Comp
L R_VERT R7
U 1 1 53E99988
P 4800 6650
F 0 "R7" H 4870 6700 50  0000 L CNN
F 1 "10K" H 4870 6600 50  0000 L CNN
F 2 "" H 4800 6700 60  0000 C CNN
F 3 "" H 4800 6700 60  0000 C CNN
	1    4800 6650
	1    0    0    -1  
$EndComp
$Comp
L 2_LEAD_PUSH_BUTTON SW1
U 1 1 53E9A9CA
P 4700 7400
F 0 "SW1" H 4700 7650 50  0000 C CNN
F 1 "MJTP1243" H 4700 7350 50  0000 C CNN
F 2 "" H 4700 7400 60  0000 C CNN
F 3 "" H 4700 7400 60  0000 C CNN
	1    4700 7400
	1    0    0    -1  
$EndComp
$Comp
L 3MM_HOLE H2
U 1 1 53E9AFD9
P 5500 7000
F 0 "H2" H 5450 7150 50  0000 C CNN
F 1 "3MM_HOLE" H 5500 6850 50  0000 C CNN
F 2 "" H 5500 7000 60  0000 C CNN
F 3 "" H 5500 7000 60  0000 C CNN
	1    5500 7000
	1    0    0    -1  
$EndComp
$Comp
L 3MM_HOLE H3
U 1 1 53E9B07B
P 5500 7400
F 0 "H3" H 5450 7550 50  0000 C CNN
F 1 "3MM_HOLE" H 5500 7250 50  0000 C CNN
F 2 "" H 5500 7400 60  0000 C CNN
F 3 "" H 5500 7400 60  0000 C CNN
	1    5500 7400
	1    0    0    -1  
$EndComp
$Comp
L 3MM_HOLE H4
U 1 1 53E9B0DD
P 5500 7800
F 0 "H4" H 5450 7950 50  0000 C CNN
F 1 "3MM_HOLE" H 5500 7650 50  0000 C CNN
F 2 "" H 5500 7800 60  0000 C CNN
F 3 "" H 5500 7800 60  0000 C CNN
	1    5500 7800
	1    0    0    -1  
$EndComp
Text Label 2175 5450 0    50   ~ 0
VCC
$Comp
L +5V #PWR01
U 1 1 53EA1139
P 2100 5350
F 0 "#PWR01" H 2100 5440 20  0001 C CNN
F 1 "+5V" H 2100 5455 50  0000 C CNN
F 2 "" H 2100 5350 60  0000 C CNN
F 3 "" H 2100 5350 60  0000 C CNN
	1    2100 5350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 53EA1339
P 1550 6350
F 0 "#PWR02" H 1550 6350 30  0001 C CNN
F 1 "GND" H 1550 6280 30  0001 C CNN
F 2 "" H 1550 6350 60  0000 C CNN
F 3 "" H 1550 6350 60  0000 C CNN
	1    1550 6350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 53EA1FD3
P 1500 1500
F 0 "#PWR03" H 1500 1500 30  0001 C CNN
F 1 "GND" H 1500 1430 30  0001 C CNN
F 2 "" H 1500 1500 60  0000 C CNN
F 3 "" H 1500 1500 60  0000 C CNN
	1    1500 1500
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR04
U 1 1 53EA3202
P 4500 6050
F 0 "#PWR04" H 4500 6140 20  0001 C CNN
F 1 "+5V" H 4500 6155 50  0000 C CNN
F 2 "" H 4500 6050 60  0000 C CNN
F 3 "" H 4500 6050 60  0000 C CNN
	1    4500 6050
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR05
U 1 1 53EA3587
P 2800 6350
F 0 "#PWR05" H 2800 6440 20  0001 C CNN
F 1 "+5V" H 2800 6455 50  0000 C CNN
F 2 "" H 2800 6350 60  0000 C CNN
F 3 "" H 2800 6350 60  0000 C CNN
	1    2800 6350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR06
U 1 1 53EA46AE
P 4000 7900
F 0 "#PWR06" H 4000 7900 30  0001 C CNN
F 1 "GND" H 4000 7830 30  0001 C CNN
F 2 "" H 4000 7900 60  0000 C CNN
F 3 "" H 4000 7900 60  0000 C CNN
	1    4000 7900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 53EA4CCF
P 1700 5050
F 0 "#PWR07" H 1700 5050 30  0001 C CNN
F 1 "GND" H 1700 4980 30  0001 C CNN
F 2 "" H 1700 5050 60  0000 C CNN
F 3 "" H 1700 5050 60  0000 C CNN
	1    1700 5050
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR08
U 1 1 53EA5AAF
P 4725 2425
F 0 "#PWR08" H 4725 2515 20  0001 C CNN
F 1 "+5V" H 4725 2530 50  0000 C CNN
F 2 "" H 4725 2425 60  0000 C CNN
F 3 "" H 4725 2425 60  0000 C CNN
	1    4725 2425
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR09
U 1 1 53EA5DF1
P 4900 4000
F 0 "#PWR09" H 4900 4000 30  0001 C CNN
F 1 "GND" H 4900 3930 30  0001 C CNN
F 2 "" H 4900 4000 60  0000 C CNN
F 3 "" H 4900 4000 60  0000 C CNN
	1    4900 4000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR010
U 1 1 53EA6BB5
P 900 5050
F 0 "#PWR010" H 900 5050 30  0001 C CNN
F 1 "GND" H 900 4980 30  0001 C CNN
F 2 "" H 900 5050 60  0000 C CNN
F 3 "" H 900 5050 60  0000 C CNN
	1    900  5050
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR011
U 1 1 53EA8781
P 2600 2500
F 0 "#PWR011" H 2600 2590 20  0001 C CNN
F 1 "+5V" H 2600 2605 50  0000 C CNN
F 2 "" H 2600 2500 60  0000 C CNN
F 3 "" H 2600 2500 60  0000 C CNN
	1    2600 2500
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR012
U 1 1 53EA8C88
P 3300 1900
F 0 "#PWR012" H 3300 1990 20  0001 C CNN
F 1 "+5V" H 3300 2005 50  0000 C CNN
F 2 "" H 3300 1900 60  0000 C CNN
F 3 "" H 3300 1900 60  0000 C CNN
	1    3300 1900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR013
U 1 1 53EA917D
P 3200 2100
F 0 "#PWR013" H 3200 2100 30  0001 C CNN
F 1 "GND" H 3200 2030 30  0001 C CNN
F 2 "" H 3200 2100 60  0000 C CNN
F 3 "" H 3200 2100 60  0000 C CNN
	1    3200 2100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR014
U 1 1 53EA924F
P 1800 2100
F 0 "#PWR014" H 1800 2100 30  0001 C CNN
F 1 "GND" H 1800 2030 30  0001 C CNN
F 2 "" H 1800 2100 60  0000 C CNN
F 3 "" H 1800 2100 60  0000 C CNN
	1    1800 2100
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR015
U 1 1 53EA96B5
P 1900 1500
F 0 "#PWR015" H 1900 1590 20  0001 C CNN
F 1 "+5V" H 1900 1605 50  0000 C CNN
F 2 "" H 1900 1500 60  0000 C CNN
F 3 "" H 1900 1500 60  0000 C CNN
	1    1900 1500
	1    0    0    -1  
$EndComp
Text Label 2975 5150 0    50   ~ 0
~RESET
Text Label 3000 7800 0    50   ~ 0
GND
Text Label 2775 2700 2    50   ~ 0
RXD
Text Label 2775 2800 2    50   ~ 0
TXD
$Comp
L C_VERT C6
U 1 1 53EA3930
P 3000 5750
F 0 "C6" H 3020 5840 50  0000 L CNN
F 1 ".1uF" H 3020 5660 50  0000 L CNN
F 2 "" H 3038 5600 30  0000 C CNN
F 3 "" H 3000 5750 60  0000 C CNN
	1    3000 5750
	1    0    0    -1  
$EndComp
$Comp
L C_VERT C7
U 1 1 53EA3BB3
P 3300 5750
F 0 "C7" H 3320 5840 50  0000 L CNN
F 1 ".1uF" H 3320 5660 50  0000 L CNN
F 2 "" H 3338 5600 30  0000 C CNN
F 3 "" H 3300 5750 60  0000 C CNN
	1    3300 5750
	1    0    0    -1  
$EndComp
$Comp
L C_VERT C8
U 1 1 53EA3C1E
P 3600 5750
F 0 "C8" H 3620 5840 50  0000 L CNN
F 1 ".1uF" H 3620 5660 50  0000 L CNN
F 2 "" H 3638 5600 30  0000 C CNN
F 3 "" H 3600 5750 60  0000 C CNN
	1    3600 5750
	1    0    0    -1  
$EndComp
$Comp
L C_VERT C9
U 1 1 53EA3C8A
P 3900 5750
F 0 "C9" H 3920 5840 50  0000 L CNN
F 1 ".1uF" H 3920 5660 50  0000 L CNN
F 2 "" H 3938 5600 30  0000 C CNN
F 3 "" H 3900 5750 60  0000 C CNN
	1    3900 5750
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR016
U 1 1 53EA3CF1
P 3000 5350
F 0 "#PWR016" H 3000 5440 20  0001 C CNN
F 1 "+5V" H 3000 5455 50  0000 C CNN
F 2 "" H 3000 5350 60  0000 C CNN
F 3 "" H 3000 5350 60  0000 C CNN
	1    3000 5350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR017
U 1 1 53EA3DE7
P 3000 6150
F 0 "#PWR017" H 3000 6150 30  0001 C CNN
F 1 "GND" H 3000 6080 30  0001 C CNN
F 2 "" H 3000 6150 60  0000 C CNN
F 3 "" H 3000 6150 60  0000 C CNN
	1    3000 6150
	1    0    0    -1  
$EndComp
Text Notes 3125 6150 0    50   ~ 0
Filter Capacitors
Text Notes 3250 7450 0    50   ~ 0
Reset Circuitry
Text Notes 925  7850 0    50   ~ 0
Programmer
Text Label 800  5450 0    50   ~ 0
LPWR
Text Label 2775 3000 2    50   ~ 0
D3
$Comp
L GND #PWR018
U 1 1 53F16EE0
P 1500 3600
F 0 "#PWR018" H 1500 3600 30  0001 C CNN
F 1 "GND" H 1500 3530 30  0001 C CNN
F 2 "" H 1500 3600 60  0000 C CNN
F 3 "" H 1500 3600 60  0000 C CNN
	1    1500 3600
	1    0    0    -1  
$EndComp
Text Label 4625 3900 0    50   ~ 0
D9
$Comp
L SONAR_40_CONNECTOR N3
U 1 1 53F184B0
P 8400 3850
F 0 "N3" H 8250 5900 50  0000 C CNN
F 1 "302-S401" H 8400 1775 50  0000 C CNN
F 2 "" H 8350 4250 60  0000 C CNN
F 3 "" H 8350 4250 60  0000 C CNN
	1    8400 3850
	1    0    0    -1  
$EndComp
$Comp
L SONAR_40_CONNECTOR N4
U 1 1 53F18627
P 10000 3850
F 0 "N4" H 9850 5900 50  0000 C CNN
F 1 "302-S401" H 10000 1775 50  0000 C CNN
F 2 "" H 9950 4250 60  0000 C CNN
F 3 "" H 9950 4250 60  0000 C CNN
	1    10000 3850
	1    0    0    -1  
$EndComp
$Comp
L 74LS32 U5
U 3 1 53F1893A
P 8400 6450
F 0 "U5" H 8400 6500 60  0000 C CNN
F 1 "74HCT32" H 8400 6400 60  0000 C CNN
F 2 "" H 8400 6450 60  0000 C CNN
F 3 "" H 8400 6450 60  0000 C CNN
	3    8400 6450
	-1   0    0    -1  
$EndComp
$Comp
L 74LS32 U5
U 1 1 53F18CDA
P 6800 2200
F 0 "U5" H 6800 2250 60  0000 C CNN
F 1 "74HCT32" H 6800 2150 60  0000 C CNN
F 2 "" H 6800 2200 60  0000 C CNN
F 3 "" H 6800 2200 60  0000 C CNN
	1    6800 2200
	-1   0    0    -1  
$EndComp
$Comp
L 74LS32 U5
U 2 1 53F18ED5
P 6900 4600
F 0 "U5" H 6900 4650 60  0000 C CNN
F 1 "74HCT32" H 6900 4550 60  0000 C CNN
F 2 "" H 6900 4600 60  0000 C CNN
F 3 "" H 6900 4600 60  0000 C CNN
	2    6900 4600
	-1   0    0    -1  
$EndComp
$Comp
L 74LS32 U5
U 4 1 53F1905D
P 8500 1300
F 0 "U5" H 8500 1350 60  0000 C CNN
F 1 "74HCT32" H 8500 1250 60  0000 C CNN
F 2 "" H 8500 1300 60  0000 C CNN
F 3 "" H 8500 1300 60  0000 C CNN
	4    8500 1300
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR019
U 1 1 53F21AB4
P 9500 5900
F 0 "#PWR019" H 9500 5900 30  0001 C CNN
F 1 "GND" H 9500 5830 30  0001 C CNN
F 2 "" H 9500 5900 60  0000 C CNN
F 3 "" H 9500 5900 60  0000 C CNN
	1    9500 5900
	1    0    0    -1  
$EndComp
Connection ~ 1000 5450
Wire Wire Line
	650  5450 1100 5450
Wire Wire Line
	1000 5550 1000 5450
Wire Wire Line
	1000 6250 1000 5950
Connection ~ 1550 6050
Wire Wire Line
	2400 6250 2400 5950
Wire Wire Line
	1550 5800 1550 6350
Wire Wire Line
	1550 6050 1600 6050
Wire Wire Line
	2100 6050 2100 5950
Wire Wire Line
	2000 6050 2100 6050
Connection ~ 2100 5450
Wire Wire Line
	2400 5450 2400 5550
Wire Wire Line
	2000 2400 1850 2400
Wire Wire Line
	2000 2700 2000 2400
Wire Wire Line
	2800 2700 2000 2700
Wire Wire Line
	750  2300 850  2300
Wire Wire Line
	750  1975 750  2300
Wire Wire Line
	1500 1975 750  1975
Wire Wire Line
	1500 1600 1500 1975
Wire Wire Line
	2200 3000 2800 3000
Wire Wire Line
	2200 4650 2200 3000
Wire Wire Line
	7600 3000 4600 3000
Wire Wire Line
	2600 3800 2600 4250
Wire Wire Line
	2800 3800 2600 3800
Wire Wire Line
	1500 1600 3100 1600
Wire Wire Line
	3100 1600 3100 1800
Wire Wire Line
	3100 1800 3000 1800
Wire Wire Line
	2000 2800 2800 2800
Wire Wire Line
	2400 2300 2400 2800
Wire Wire Line
	3100 2300 2400 2300
Wire Wire Line
	3100 2100 3100 2300
Wire Wire Line
	3000 2100 3100 2100
Connection ~ 1400 1600
Wire Wire Line
	650  1800 650  5450
Wire Wire Line
	1400 1800 650  1800
Wire Wire Line
	2700 3900 2800 3900
Wire Wire Line
	2700 4150 2700 3900
Wire Wire Line
	2700 4150 6100 4150
Wire Wire Line
	4600 3500 7700 3500
Connection ~ 1500 1400
Wire Wire Line
	2000 2100 1900 2100
Wire Wire Line
	3300 2000 3000 2000
Wire Wire Line
	3300 1900 3300 2000
Wire Wire Line
	3200 1900 3000 1900
Connection ~ 1600 1100
Wire Wire Line
	1600 2000 1600 1100
Wire Wire Line
	2000 2000 1600 2000
Connection ~ 1700 1200
Wire Wire Line
	1700 1200 1700 1900
Wire Wire Line
	1700 1900 2000 1900
Wire Wire Line
	1300 1200 2100 1200
Wire Wire Line
	2100 1200 2100 1300
Wire Wire Line
	2100 1300 2200 1300
Wire Wire Line
	2700 1300 2600 1300
Wire Wire Line
	2600 1200 2700 1200
Wire Wire Line
	2600 1100 2600 1200
Wire Wire Line
	1300 1100 2600 1100
Wire Wire Line
	1500 1300 1300 1300
Wire Wire Line
	1300 1400 1500 1400
Wire Wire Line
	1400 1500 1300 1500
Wire Wire Line
	1400 1500 1400 1800
Wire Wire Line
	1300 1600 1400 1600
Wire Wire Line
	2800 3500 1700 3500
Wire Wire Line
	1700 3500 1700 4550
Wire Wire Line
	1700 4450 1600 4450
Wire Wire Line
	1000 4450 900  4450
Wire Wire Line
	900  3400 900  4550
Wire Wire Line
	900  3400 2800 3400
Connection ~ 900  4450
Connection ~ 1700 4450
Wire Wire Line
	900  4950 900  5050
Wire Wire Line
	1700 4950 1700 5050
Wire Wire Line
	4600 3200 4900 3200
Wire Wire Line
	4600 3400 4725 3400
Wire Wire Line
	2600 3200 2800 3200
Wire Wire Line
	1600 7250 1600 6550
Wire Wire Line
	1600 6550 750  6550
Wire Wire Line
	750  6550 750  2500
Wire Wire Line
	750  2500 850  2500
Wire Wire Line
	2100 6550 2100 6450
Wire Wire Line
	2400 6550 2400 6450
Connection ~ 2400 6450
Wire Wire Line
	1800 6950 1800 7350
Wire Wire Line
	1600 7800 5300 7800
Wire Wire Line
	1800 7750 1800 7800
Connection ~ 1800 7800
Wire Wire Line
	1500 7550 1600 7550
Wire Wire Line
	1600 7550 1600 7800
Wire Wire Line
	1500 7050 2900 7050
Connection ~ 2400 7050
Wire Wire Line
	2800 6850 2900 6850
Wire Wire Line
	2800 2600 1900 2600
Wire Wire Line
	1900 2600 1900 5150
Wire Wire Line
	1900 5150 5100 5150
Wire Wire Line
	2000 2800 2000 5050
Wire Wire Line
	2000 5050 2700 5050
Wire Wire Line
	2700 5050 2700 6350
Wire Wire Line
	2700 6350 1800 6350
Connection ~ 2400 2800
Wire Wire Line
	1800 6350 1800 6550
Wire Wire Line
	1500 7250 2100 7250
Wire Wire Line
	1500 7150 1800 7150
Connection ~ 1800 7150
Connection ~ 1600 7250
Wire Wire Line
	4500 6050 4500 6350
Wire Wire Line
	4400 6950 5100 6950
Wire Wire Line
	4500 6950 4500 6850
Wire Wire Line
	4800 6950 4800 6850
Connection ~ 4500 6950
Wire Wire Line
	4800 6150 4800 6450
Connection ~ 4500 6150
Wire Wire Line
	3900 6950 4000 6950
Wire Wire Line
	5100 5150 5100 7400
Connection ~ 4800 6950
Wire Wire Line
	5100 7400 5000 7400
Connection ~ 5100 6950
Wire Wire Line
	5200 6600 5200 7800
Wire Wire Line
	5200 6600 5300 6600
Wire Wire Line
	5300 7000 5200 7000
Connection ~ 5200 7000
Wire Wire Line
	5300 7400 5200 7400
Connection ~ 5200 7400
Connection ~ 5200 7800
Wire Wire Line
	4400 7400 4000 7400
Connection ~ 1550 6250
Wire Wire Line
	1500 1300 1500 1500
Wire Wire Line
	2100 5350 2100 5550
Wire Wire Line
	2000 5450 2400 5450
Wire Wire Line
	1000 6250 2400 6250
Wire Wire Line
	4500 6150 4800 6150
Wire Wire Line
	2800 6350 2800 6850
Wire Wire Line
	2100 6450 2800 6450
Connection ~ 2800 6450
Wire Wire Line
	4000 7400 4000 7900
Connection ~ 4000 7800
Wire Wire Line
	4725 3400 4725 2425
Wire Wire Line
	4900 3200 4900 4000
Wire Wire Line
	2600 3200 2600 2500
Wire Wire Line
	1900 2100 1900 1500
Wire Wire Line
	3200 2100 3200 1900
Wire Wire Line
	2000 1800 1800 1800
Wire Wire Line
	1800 1800 1800 2100
Wire Wire Line
	3000 5350 3000 5550
Wire Wire Line
	3000 5450 4200 5450
Wire Wire Line
	3900 5450 3900 5550
Connection ~ 3000 5450
Wire Wire Line
	3600 5550 3600 5450
Connection ~ 3600 5450
Wire Wire Line
	3300 5550 3300 5450
Connection ~ 3300 5450
Wire Wire Line
	3000 5950 3000 6150
Wire Wire Line
	3000 6050 4200 6050
Wire Wire Line
	3900 6050 3900 5950
Connection ~ 3000 6050
Wire Wire Line
	3600 5950 3600 6050
Connection ~ 3600 6050
Wire Wire Line
	3300 5950 3300 6050
Connection ~ 3300 6050
Wire Wire Line
	2800 2900 2100 2900
Wire Wire Line
	2100 2900 2100 4750
Wire Wire Line
	2100 4750 5700 4750
Wire Wire Line
	2800 3100 2300 3100
Wire Wire Line
	2300 3100 2300 4550
Wire Wire Line
	2300 4550 5900 4550
Wire Wire Line
	2200 4650 5800 4650
Wire Wire Line
	2800 3700 2500 3700
Wire Wire Line
	2500 3700 2500 4350
Wire Wire Line
	2500 4350 7500 4350
Wire Wire Line
	2800 3600 2400 3600
Wire Wire Line
	2400 3600 2400 4450
Wire Wire Line
	2400 4450 6200 4450
Wire Wire Line
	2800 3300 1500 3300
Wire Wire Line
	1500 3300 1500 3600
Wire Wire Line
	9600 5300 9200 5300
Wire Wire Line
	9200 5300 9200 6550
Wire Wire Line
	9200 6550 9000 6550
Wire Wire Line
	9600 4500 9100 4500
Wire Wire Line
	9100 4500 9100 6350
Wire Wire Line
	9100 6350 9000 6350
Wire Wire Line
	9600 2100 9300 2100
Wire Wire Line
	9300 2100 9300 1200
Wire Wire Line
	9300 1200 9100 1200
Wire Wire Line
	9600 2900 9200 2900
Wire Wire Line
	9200 2900 9200 1400
Wire Wire Line
	9200 1400 9100 1400
Wire Wire Line
	9600 1900 9500 1900
Wire Wire Line
	9500 1900 9500 5900
Wire Wire Line
	9500 5800 9600 5800
Wire Wire Line
	9600 2000 9500 2000
Connection ~ 9500 2000
Wire Wire Line
	9600 2200 9500 2200
Connection ~ 9500 2200
Wire Wire Line
	9500 2400 9600 2400
Connection ~ 9500 2400
Wire Wire Line
	9600 2600 9500 2600
Connection ~ 9500 2600
Wire Wire Line
	9600 2700 9500 2700
Connection ~ 9500 2700
Wire Wire Line
	9600 2800 9500 2800
Connection ~ 9500 2800
Wire Wire Line
	9600 3000 9500 3000
Connection ~ 9500 3000
Wire Wire Line
	9600 3200 9500 3200
Connection ~ 9500 3200
Wire Wire Line
	9600 3400 9500 3400
Connection ~ 9500 3400
Wire Wire Line
	9600 3500 9500 3500
Connection ~ 9500 3500
Wire Wire Line
	9600 3600 9500 3600
Connection ~ 9500 3600
Wire Wire Line
	9600 3800 9500 3800
Connection ~ 9500 3800
Wire Wire Line
	9600 4000 9500 4000
Connection ~ 9500 4000
Wire Wire Line
	9600 4200 9500 4200
Connection ~ 9500 4200
Wire Wire Line
	9600 4300 9500 4300
Connection ~ 9500 4300
Wire Wire Line
	9600 4600 9500 4600
Connection ~ 9500 4600
Wire Wire Line
	9600 4800 9500 4800
Connection ~ 9500 4800
Wire Wire Line
	9600 5000 9500 5000
Connection ~ 9500 5000
Wire Wire Line
	9600 5100 9500 5100
Connection ~ 9500 5100
Wire Wire Line
	9600 5200 9500 5200
Connection ~ 9500 5200
Wire Wire Line
	9600 5400 9500 5400
Connection ~ 9500 5400
Wire Wire Line
	9600 5600 9500 5600
Connection ~ 9500 5600
Wire Wire Line
	9400 5700 9600 5700
Wire Wire Line
	9400 2500 9400 5700
Wire Wire Line
	9300 2500 9600 2500
Wire Wire Line
	9600 3300 9400 3300
Connection ~ 9400 3300
Wire Wire Line
	9600 4100 9400 4100
Connection ~ 9400 4100
Wire Wire Line
	9600 4900 9400 4900
Connection ~ 9400 4900
Wire Wire Line
	9600 2300 9400 2300
Wire Wire Line
	9400 2300 9400 1000
Wire Wire Line
	9400 1000 5700 1000
Wire Wire Line
	9600 3100 9100 3100
Wire Wire Line
	9100 3100 9100 1600
Wire Wire Line
	9100 1600 5900 1600
Wire Wire Line
	9600 3700 9000 3700
Wire Wire Line
	9000 3700 9000 1700
Wire Wire Line
	9600 5500 9325 5500
Wire Wire Line
	9325 5500 9325 6700
Wire Wire Line
	9325 6700 5700 6700
Wire Wire Line
	9600 4700 9000 4700
Wire Wire Line
	9000 4700 9000 6150
Wire Wire Line
	9000 6150 5900 6150
Wire Wire Line
	9600 3900 8900 3900
Wire Wire Line
	8900 3900 8900 6050
Wire Wire Line
	8900 6050 6000 6050
Connection ~ 9500 5800
Wire Wire Line
	7900 5800 8000 5800
Wire Wire Line
	7900 1900 7900 5900
Wire Wire Line
	7900 1900 8000 1900
Wire Wire Line
	8000 2000 7900 2000
Connection ~ 7900 2000
Wire Wire Line
	8000 2200 7900 2200
Connection ~ 7900 2200
Wire Wire Line
	8000 2400 7900 2400
Connection ~ 7900 2400
Wire Wire Line
	8000 2600 7900 2600
Connection ~ 7900 2600
Wire Wire Line
	8000 2700 7900 2700
Connection ~ 7900 2700
Wire Wire Line
	8000 2800 7900 2800
Connection ~ 7900 2800
Wire Wire Line
	8000 3000 7900 3000
Connection ~ 7900 3000
Wire Wire Line
	8000 3200 7900 3200
Connection ~ 7900 3200
Wire Wire Line
	8000 3400 7900 3400
Connection ~ 7900 3400
Wire Wire Line
	8000 3500 7900 3500
Connection ~ 7900 3500
Wire Wire Line
	8000 3600 7900 3600
Connection ~ 7900 3600
Wire Wire Line
	8000 3800 7900 3800
Connection ~ 7900 3800
Wire Wire Line
	8000 4000 7900 4000
Connection ~ 7900 4000
Wire Wire Line
	8000 4200 7900 4200
Connection ~ 7900 4200
Wire Wire Line
	8000 4300 7900 4300
Connection ~ 7900 4300
Wire Wire Line
	8000 4400 7900 4400
Connection ~ 7900 4400
Wire Wire Line
	8000 4600 7900 4600
Connection ~ 7900 4600
Wire Wire Line
	8000 4800 7900 4800
Connection ~ 7900 4800
Wire Wire Line
	8000 5000 7900 5000
Connection ~ 7900 5000
Wire Wire Line
	8000 5100 7900 5100
Connection ~ 7900 5100
Wire Wire Line
	8000 5200 7900 5200
Connection ~ 7900 5200
Wire Wire Line
	8000 5400 7900 5400
Connection ~ 7900 5400
Wire Wire Line
	8000 5600 7900 5600
Connection ~ 7900 5600
Wire Wire Line
	7800 5700 8000 5700
Wire Wire Line
	7800 2000 7800 5700
Wire Wire Line
	7800 2500 8000 2500
Wire Wire Line
	8000 3300 7800 3300
Connection ~ 7800 3300
Wire Wire Line
	8000 4100 7800 4100
Connection ~ 7800 4100
Wire Wire Line
	8000 4900 7800 4900
Connection ~ 7800 4900
$Comp
L GND #PWR020
U 1 1 53F25B86
P 7900 5900
F 0 "#PWR020" H 7900 5900 30  0001 C CNN
F 1 "GND" H 7900 5830 30  0001 C CNN
F 2 "" H 7900 5900 60  0000 C CNN
F 3 "" H 7900 5900 60  0000 C CNN
	1    7900 5900
	1    0    0    -1  
$EndComp
Connection ~ 7900 5800
Wire Wire Line
	7900 1300 5800 1300
Wire Wire Line
	6200 3600 4600 3600
Wire Wire Line
	9000 1700 6000 1700
Wire Wire Line
	5800 6450 7800 6450
Wire Wire Line
	5800 4650 5800 6450
Wire Wire Line
	8000 2900 7500 2900
Wire Wire Line
	7500 2900 7500 2300
Wire Wire Line
	7500 2300 7400 2300
Wire Wire Line
	8000 2100 7400 2100
Wire Wire Line
	6200 2200 6100 2200
Wire Wire Line
	6100 2200 6100 3900
Wire Wire Line
	8000 4500 7500 4500
Wire Wire Line
	7500 4700 7600 4700
Wire Wire Line
	7600 4700 7600 5300
Wire Wire Line
	7600 5300 8000 5300
Wire Wire Line
	6300 4600 6200 4600
Wire Wire Line
	6200 4600 6200 4450
Wire Wire Line
	7500 4350 7500 3700
Wire Wire Line
	7500 3700 8000 3700
Wire Wire Line
	5700 6700 5700 4750
Wire Wire Line
	5900 6150 5900 4550
Wire Wire Line
	8000 5500 6100 5500
Wire Wire Line
	6100 5500 6100 4150
Wire Wire Line
	8000 4700 7700 4700
Wire Wire Line
	8000 3100 7700 3100
Wire Wire Line
	7700 3100 7700 3500
Wire Wire Line
	8000 2300 7600 2300
Wire Wire Line
	7600 2300 7600 3000
Wire Wire Line
	4600 2900 5900 2900
NoConn ~ 4600 2600
NoConn ~ 4600 2700
NoConn ~ 4600 3300
$Comp
L +5V #PWR021
U 1 1 53F2C131
P 7800 2000
F 0 "#PWR021" H 7800 2090 20  0001 C CNN
F 1 "+5V" H 7800 2105 50  0000 C CNN
F 2 "" H 7800 2000 60  0000 C CNN
F 3 "" H 7800 2000 60  0000 C CNN
	1    7800 2000
	1    0    0    -1  
$EndComp
Connection ~ 7800 2500
$Comp
L +5V #PWR022
U 1 1 53F2C459
P 9300 2400
F 0 "#PWR022" H 9300 2490 20  0001 C CNN
F 1 "+5V" H 9300 2505 50  0000 C CNN
F 2 "" H 9300 2400 60  0000 C CNN
F 3 "" H 9300 2400 60  0000 C CNN
	1    9300 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 2500 9300 2400
Connection ~ 9400 2500
Wire Wire Line
	9600 4400 9500 4400
Connection ~ 9500 4400
Wire Wire Line
	7700 4700 7700 4250
Wire Wire Line
	7700 4250 6200 4250
Wire Wire Line
	6200 4250 6200 3600
Wire Wire Line
	6100 3900 4600 3900
Wire Wire Line
	6000 1700 6000 3800
Wire Wire Line
	6000 3800 4600 3800
Wire Wire Line
	5800 1300 5800 3700
Wire Wire Line
	5800 3700 4600 3700
Wire Wire Line
	6000 6050 6000 4250
Wire Wire Line
	6000 4250 2600 4250
Wire Wire Line
	8000 3900 6300 3900
Wire Wire Line
	6300 3900 6300 3100
Wire Wire Line
	6300 3100 4600 3100
Wire Wire Line
	5900 2900 5900 1600
Wire Wire Line
	5700 1000 5700 2800
Wire Wire Line
	5700 2800 4600 2800
Wire Wire Line
	1300 1000 1400 1000
Wire Wire Line
	1400 1000 1400 900 
Wire Wire Line
	1400 900  1300 900 
Wire Wire Line
	1300 800  1400 800 
Wire Wire Line
	1400 800  1400 700 
Wire Wire Line
	1400 700  1300 700 
$Comp
L R_VERT R3
U 1 1 53EAC7FD
P 1800 7550
F 0 "R3" H 1870 7600 50  0000 L CNN
F 1 "33K" H 1870 7500 50  0000 L CNN
F 2 "" H 1800 7600 60  0000 C CNN
F 3 "" H 1800 7600 60  0000 C CNN
	1    1800 7550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 7050 2400 6950
Wire Wire Line
	2100 7250 2100 6950
$Comp
L C_VERT C11
U 1 1 53F15832
P 4200 5750
F 0 "C11" H 4220 5840 50  0000 L CNN
F 1 ".1uF" H 4220 5660 50  0000 L CNN
F 2 "" H 4238 5600 30  0000 C CNN
F 3 "" H 4200 5750 60  0000 C CNN
	1    4200 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 5450 4200 5550
Connection ~ 3900 5450
Wire Wire Line
	4200 6050 4200 5950
Connection ~ 3900 6050
$EndSCHEMATC
