EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:switches
LIBS:relays
LIBS:motors
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
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
LIBS:Dummy_load-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
Title "Digitally Controlled Electronic Load"
Date "2018-01-01"
Rev "1"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L 74HC595 U1
U 1 1 5A4D07AC
P 3400 2000
AR Path="/5A4D076B/5A4D07AC" Ref="U1"  Part="1" 
AR Path="/5A4E7286/5A4D07AC" Ref="U5"  Part="1" 
F 0 "U5" H 3550 2600 50  0000 C CNN
F 1 "74HC595" H 3400 1400 50  0000 C CNN
F 2 "Housings_DIP:DIP-16_W7.62mm_Socket_LongPads" H 3400 2000 50  0001 C CNN
F 3 "" H 3400 2000 50  0001 C CNN
	1    3400 2000
	1    0    0    -1  
$EndComp
$Comp
L 74HC595 U2
U 1 1 5A4D0807
P 3400 3500
AR Path="/5A4D076B/5A4D0807" Ref="U2"  Part="1" 
AR Path="/5A4E7286/5A4D0807" Ref="U6"  Part="1" 
F 0 "U6" H 3550 4100 50  0000 C CNN
F 1 "74HC595" H 3400 2900 50  0000 C CNN
F 2 "Housings_DIP:DIP-16_W7.62mm_Socket_LongPads" H 3400 3500 50  0001 C CNN
F 3 "" H 3400 3500 50  0001 C CNN
	1    3400 3500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5A4D09DA
P 2700 2150
AR Path="/5A4D076B/5A4D09DA" Ref="#PWR?"  Part="1" 
AR Path="/5A4E7286/5A4D09DA" Ref="#PWR034"  Part="1" 
F 0 "#PWR034" H 2700 1900 50  0001 C CNN
F 1 "GND" H 2700 2000 50  0000 C CNN
F 2 "" H 2700 2150 50  0001 C CNN
F 3 "" H 2700 2150 50  0001 C CNN
	1    2700 2150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5A4D09F2
P 2700 3650
AR Path="/5A4D076B/5A4D09F2" Ref="#PWR?"  Part="1" 
AR Path="/5A4E7286/5A4D09F2" Ref="#PWR035"  Part="1" 
F 0 "#PWR035" H 2700 3400 50  0001 C CNN
F 1 "GND" H 2700 3500 50  0000 C CNN
F 2 "" H 2700 3650 50  0001 C CNN
F 3 "" H 2700 3650 50  0001 C CNN
	1    2700 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 2450 4100 2750
Wire Wire Line
	4100 2750 2700 2750
Wire Wire Line
	2700 2750 2700 3050
Wire Wire Line
	2700 3250 2400 3250
Wire Wire Line
	2400 3250 2400 1750
Wire Wire Line
	2400 1750 2700 1750
Text HLabel 2400 1750 0    60   Input ~ 0
SR_CLK
Wire Wire Line
	2250 2050 2700 2050
Wire Wire Line
	2500 2050 2500 3550
Wire Wire Line
	2500 3550 2700 3550
Text HLabel 2250 2050 0    60   Input ~ 0
SR_LATCH
Connection ~ 2500 2050
Text HLabel 2700 1550 0    60   Input ~ 0
SR_SERIAL
$Comp
L R R1
U 1 1 5A4D303A
P 4500 4450
AR Path="/5A4D076B/5A4D303A" Ref="R1"  Part="1" 
AR Path="/5A4E7286/5A4D303A" Ref="R6"  Part="1" 
F 0 "R6" V 4580 4450 50  0000 C CNN
F 1 "2K" V 4500 4450 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 4430 4450 50  0001 C CNN
F 3 "" H 4500 4450 50  0001 C CNN
	1    4500 4450
	1    0    0    -1  
$EndComp
$Comp
L R R33
U 1 1 5A4D305A
P 9000 4750
AR Path="/5A4D076B/5A4D305A" Ref="R33"  Part="1" 
AR Path="/5A4E7286/5A4D305A" Ref="R37"  Part="1" 
F 0 "R37" V 9080 4750 50  0000 C CNN
F 1 "2K" V 9000 4750 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 8930 4750 50  0001 C CNN
F 3 "" H 9000 4750 50  0001 C CNN
	1    9000 4750
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 5A4D30AD
P 4650 4600
AR Path="/5A4D076B/5A4D30AD" Ref="R3"  Part="1" 
AR Path="/5A4E7286/5A4D30AD" Ref="R7"  Part="1" 
F 0 "R7" V 4730 4600 50  0000 C CNN
F 1 "1K" V 4650 4600 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 4580 4600 50  0001 C CNN
F 3 "" H 4650 4600 50  0001 C CNN
	1    4650 4600
	0    1    1    0   
$EndComp
$Comp
L R R4
U 1 1 5A4D30F7
P 4800 4450
AR Path="/5A4D076B/5A4D30F7" Ref="R4"  Part="1" 
AR Path="/5A4E7286/5A4D30F7" Ref="R8"  Part="1" 
F 0 "R8" V 4880 4450 50  0000 C CNN
F 1 "2K" V 4800 4450 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 4730 4450 50  0001 C CNN
F 3 "" H 4800 4450 50  0001 C CNN
	1    4800 4450
	1    0    0    -1  
$EndComp
$Comp
L R R5
U 1 1 5A4D3840
P 4950 4600
AR Path="/5A4D076B/5A4D3840" Ref="R5"  Part="1" 
AR Path="/5A4E7286/5A4D3840" Ref="R9"  Part="1" 
F 0 "R9" V 5030 4600 50  0000 C CNN
F 1 "1K" V 4950 4600 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 4880 4600 50  0001 C CNN
F 3 "" H 4950 4600 50  0001 C CNN
	1    4950 4600
	0    1    1    0   
$EndComp
$Comp
L R R6
U 1 1 5A4D3846
P 5100 4450
AR Path="/5A4D076B/5A4D3846" Ref="R6"  Part="1" 
AR Path="/5A4E7286/5A4D3846" Ref="R10"  Part="1" 
F 0 "R10" V 5180 4450 50  0000 C CNN
F 1 "2K" V 5100 4450 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 5030 4450 50  0001 C CNN
F 3 "" H 5100 4450 50  0001 C CNN
	1    5100 4450
	1    0    0    -1  
$EndComp
$Comp
L R R7
U 1 1 5A4D38F4
P 5250 4600
AR Path="/5A4D076B/5A4D38F4" Ref="R7"  Part="1" 
AR Path="/5A4E7286/5A4D38F4" Ref="R11"  Part="1" 
F 0 "R11" V 5330 4600 50  0000 C CNN
F 1 "1K" V 5250 4600 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 5180 4600 50  0001 C CNN
F 3 "" H 5250 4600 50  0001 C CNN
	1    5250 4600
	0    1    1    0   
$EndComp
$Comp
L R R8
U 1 1 5A4D38FA
P 5400 4450
AR Path="/5A4D076B/5A4D38FA" Ref="R8"  Part="1" 
AR Path="/5A4E7286/5A4D38FA" Ref="R12"  Part="1" 
F 0 "R12" V 5480 4450 50  0000 C CNN
F 1 "2K" V 5400 4450 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 5330 4450 50  0001 C CNN
F 3 "" H 5400 4450 50  0001 C CNN
	1    5400 4450
	1    0    0    -1  
$EndComp
$Comp
L R R9
U 1 1 5A4D3900
P 5550 4600
AR Path="/5A4D076B/5A4D3900" Ref="R9"  Part="1" 
AR Path="/5A4E7286/5A4D3900" Ref="R13"  Part="1" 
F 0 "R13" V 5630 4600 50  0000 C CNN
F 1 "1K" V 5550 4600 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 5480 4600 50  0001 C CNN
F 3 "" H 5550 4600 50  0001 C CNN
	1    5550 4600
	0    1    1    0   
$EndComp
$Comp
L R R10
U 1 1 5A4D3906
P 5700 4450
AR Path="/5A4D076B/5A4D3906" Ref="R10"  Part="1" 
AR Path="/5A4E7286/5A4D3906" Ref="R14"  Part="1" 
F 0 "R14" V 5780 4450 50  0000 C CNN
F 1 "2K" V 5700 4450 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 5630 4450 50  0001 C CNN
F 3 "" H 5700 4450 50  0001 C CNN
	1    5700 4450
	1    0    0    -1  
$EndComp
$Comp
L R R11
U 1 1 5A4D3F08
P 5850 4600
AR Path="/5A4D076B/5A4D3F08" Ref="R11"  Part="1" 
AR Path="/5A4E7286/5A4D3F08" Ref="R15"  Part="1" 
F 0 "R15" V 5930 4600 50  0000 C CNN
F 1 "1K" V 5850 4600 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 5780 4600 50  0001 C CNN
F 3 "" H 5850 4600 50  0001 C CNN
	1    5850 4600
	0    1    1    0   
$EndComp
$Comp
L R R12
U 1 1 5A4D3F0E
P 6000 4450
AR Path="/5A4D076B/5A4D3F0E" Ref="R12"  Part="1" 
AR Path="/5A4E7286/5A4D3F0E" Ref="R16"  Part="1" 
F 0 "R16" V 6080 4450 50  0000 C CNN
F 1 "2K" V 6000 4450 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 5930 4450 50  0001 C CNN
F 3 "" H 6000 4450 50  0001 C CNN
	1    6000 4450
	1    0    0    -1  
$EndComp
$Comp
L R R13
U 1 1 5A4D3F14
P 6150 4600
AR Path="/5A4D076B/5A4D3F14" Ref="R13"  Part="1" 
AR Path="/5A4E7286/5A4D3F14" Ref="R17"  Part="1" 
F 0 "R17" V 6230 4600 50  0000 C CNN
F 1 "1K" V 6150 4600 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 6080 4600 50  0001 C CNN
F 3 "" H 6150 4600 50  0001 C CNN
	1    6150 4600
	0    1    1    0   
$EndComp
$Comp
L R R14
U 1 1 5A4D3F1A
P 6300 4450
AR Path="/5A4D076B/5A4D3F1A" Ref="R14"  Part="1" 
AR Path="/5A4E7286/5A4D3F1A" Ref="R18"  Part="1" 
F 0 "R18" V 6380 4450 50  0000 C CNN
F 1 "2K" V 6300 4450 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 6230 4450 50  0001 C CNN
F 3 "" H 6300 4450 50  0001 C CNN
	1    6300 4450
	1    0    0    -1  
$EndComp
$Comp
L R R15
U 1 1 5A4D3F20
P 6450 4600
AR Path="/5A4D076B/5A4D3F20" Ref="R15"  Part="1" 
AR Path="/5A4E7286/5A4D3F20" Ref="R19"  Part="1" 
F 0 "R19" V 6530 4600 50  0000 C CNN
F 1 "1K" V 6450 4600 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 6380 4600 50  0001 C CNN
F 3 "" H 6450 4600 50  0001 C CNN
	1    6450 4600
	0    1    1    0   
$EndComp
$Comp
L R R16
U 1 1 5A4D3F26
P 6600 4450
AR Path="/5A4D076B/5A4D3F26" Ref="R16"  Part="1" 
AR Path="/5A4E7286/5A4D3F26" Ref="R20"  Part="1" 
F 0 "R20" V 6680 4450 50  0000 C CNN
F 1 "2K" V 6600 4450 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 6530 4450 50  0001 C CNN
F 3 "" H 6600 4450 50  0001 C CNN
	1    6600 4450
	1    0    0    -1  
$EndComp
$Comp
L R R17
U 1 1 5A4D3F2C
P 6750 4600
AR Path="/5A4D076B/5A4D3F2C" Ref="R17"  Part="1" 
AR Path="/5A4E7286/5A4D3F2C" Ref="R21"  Part="1" 
F 0 "R21" V 6830 4600 50  0000 C CNN
F 1 "1K" V 6750 4600 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 6680 4600 50  0001 C CNN
F 3 "" H 6750 4600 50  0001 C CNN
	1    6750 4600
	0    1    1    0   
$EndComp
$Comp
L R R18
U 1 1 5A4D3F32
P 6900 4450
AR Path="/5A4D076B/5A4D3F32" Ref="R18"  Part="1" 
AR Path="/5A4E7286/5A4D3F32" Ref="R22"  Part="1" 
F 0 "R22" V 6980 4450 50  0000 C CNN
F 1 "2K" V 6900 4450 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 6830 4450 50  0001 C CNN
F 3 "" H 6900 4450 50  0001 C CNN
	1    6900 4450
	1    0    0    -1  
$EndComp
$Comp
L R R19
U 1 1 5A4D43E8
P 7050 4600
AR Path="/5A4D076B/5A4D43E8" Ref="R19"  Part="1" 
AR Path="/5A4E7286/5A4D43E8" Ref="R23"  Part="1" 
F 0 "R23" V 7130 4600 50  0000 C CNN
F 1 "1K" V 7050 4600 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 6980 4600 50  0001 C CNN
F 3 "" H 7050 4600 50  0001 C CNN
	1    7050 4600
	0    1    1    0   
$EndComp
$Comp
L R R20
U 1 1 5A4D43EE
P 7200 4450
AR Path="/5A4D076B/5A4D43EE" Ref="R20"  Part="1" 
AR Path="/5A4E7286/5A4D43EE" Ref="R24"  Part="1" 
F 0 "R24" V 7280 4450 50  0000 C CNN
F 1 "2K" V 7200 4450 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7130 4450 50  0001 C CNN
F 3 "" H 7200 4450 50  0001 C CNN
	1    7200 4450
	1    0    0    -1  
$EndComp
$Comp
L R R21
U 1 1 5A4D43F4
P 7350 4600
AR Path="/5A4D076B/5A4D43F4" Ref="R21"  Part="1" 
AR Path="/5A4E7286/5A4D43F4" Ref="R25"  Part="1" 
F 0 "R25" V 7430 4600 50  0000 C CNN
F 1 "1K" V 7350 4600 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7280 4600 50  0001 C CNN
F 3 "" H 7350 4600 50  0001 C CNN
	1    7350 4600
	0    1    1    0   
$EndComp
$Comp
L R R22
U 1 1 5A4D43FA
P 7500 4450
AR Path="/5A4D076B/5A4D43FA" Ref="R22"  Part="1" 
AR Path="/5A4E7286/5A4D43FA" Ref="R26"  Part="1" 
F 0 "R26" V 7580 4450 50  0000 C CNN
F 1 "2K" V 7500 4450 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7430 4450 50  0001 C CNN
F 3 "" H 7500 4450 50  0001 C CNN
	1    7500 4450
	1    0    0    -1  
$EndComp
$Comp
L R R23
U 1 1 5A4D4400
P 7650 4600
AR Path="/5A4D076B/5A4D4400" Ref="R23"  Part="1" 
AR Path="/5A4E7286/5A4D4400" Ref="R27"  Part="1" 
F 0 "R27" V 7730 4600 50  0000 C CNN
F 1 "1K" V 7650 4600 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7580 4600 50  0001 C CNN
F 3 "" H 7650 4600 50  0001 C CNN
	1    7650 4600
	0    1    1    0   
$EndComp
$Comp
L R R24
U 1 1 5A4D4406
P 7800 4450
AR Path="/5A4D076B/5A4D4406" Ref="R24"  Part="1" 
AR Path="/5A4E7286/5A4D4406" Ref="R28"  Part="1" 
F 0 "R28" V 7880 4450 50  0000 C CNN
F 1 "2K" V 7800 4450 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7730 4450 50  0001 C CNN
F 3 "" H 7800 4450 50  0001 C CNN
	1    7800 4450
	1    0    0    -1  
$EndComp
$Comp
L R R25
U 1 1 5A4D440C
P 7950 4600
AR Path="/5A4D076B/5A4D440C" Ref="R25"  Part="1" 
AR Path="/5A4E7286/5A4D440C" Ref="R29"  Part="1" 
F 0 "R29" V 8030 4600 50  0000 C CNN
F 1 "1K" V 7950 4600 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7880 4600 50  0001 C CNN
F 3 "" H 7950 4600 50  0001 C CNN
	1    7950 4600
	0    1    1    0   
$EndComp
$Comp
L R R26
U 1 1 5A4D4412
P 8100 4450
AR Path="/5A4D076B/5A4D4412" Ref="R26"  Part="1" 
AR Path="/5A4E7286/5A4D4412" Ref="R30"  Part="1" 
F 0 "R30" V 8180 4450 50  0000 C CNN
F 1 "2K" V 8100 4450 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 8030 4450 50  0001 C CNN
F 3 "" H 8100 4450 50  0001 C CNN
	1    8100 4450
	1    0    0    -1  
$EndComp
$Comp
L R R27
U 1 1 5A4D4418
P 8250 4600
AR Path="/5A4D076B/5A4D4418" Ref="R27"  Part="1" 
AR Path="/5A4E7286/5A4D4418" Ref="R31"  Part="1" 
F 0 "R31" V 8330 4600 50  0000 C CNN
F 1 "1K" V 8250 4600 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 8180 4600 50  0001 C CNN
F 3 "" H 8250 4600 50  0001 C CNN
	1    8250 4600
	0    1    1    0   
$EndComp
$Comp
L R R28
U 1 1 5A4D441E
P 8400 4450
AR Path="/5A4D076B/5A4D441E" Ref="R28"  Part="1" 
AR Path="/5A4E7286/5A4D441E" Ref="R32"  Part="1" 
F 0 "R32" V 8480 4450 50  0000 C CNN
F 1 "2K" V 8400 4450 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 8330 4450 50  0001 C CNN
F 3 "" H 8400 4450 50  0001 C CNN
	1    8400 4450
	1    0    0    -1  
$EndComp
$Comp
L R R29
U 1 1 5A4D4424
P 8550 4600
AR Path="/5A4D076B/5A4D4424" Ref="R29"  Part="1" 
AR Path="/5A4E7286/5A4D4424" Ref="R33"  Part="1" 
F 0 "R33" V 8630 4600 50  0000 C CNN
F 1 "1K" V 8550 4600 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 8480 4600 50  0001 C CNN
F 3 "" H 8550 4600 50  0001 C CNN
	1    8550 4600
	0    1    1    0   
$EndComp
$Comp
L R R30
U 1 1 5A4D442A
P 8700 4450
AR Path="/5A4D076B/5A4D442A" Ref="R30"  Part="1" 
AR Path="/5A4E7286/5A4D442A" Ref="R34"  Part="1" 
F 0 "R34" V 8780 4450 50  0000 C CNN
F 1 "2K" V 8700 4450 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 8630 4450 50  0001 C CNN
F 3 "" H 8700 4450 50  0001 C CNN
	1    8700 4450
	1    0    0    -1  
$EndComp
$Comp
L R R31
U 1 1 5A4D4430
P 8850 4600
AR Path="/5A4D076B/5A4D4430" Ref="R31"  Part="1" 
AR Path="/5A4E7286/5A4D4430" Ref="R35"  Part="1" 
F 0 "R35" V 8930 4600 50  0000 C CNN
F 1 "1K" V 8850 4600 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 8780 4600 50  0001 C CNN
F 3 "" H 8850 4600 50  0001 C CNN
	1    8850 4600
	0    1    1    0   
$EndComp
$Comp
L R R32
U 1 1 5A4D4436
P 9000 4450
AR Path="/5A4D076B/5A4D4436" Ref="R32"  Part="1" 
AR Path="/5A4E7286/5A4D4436" Ref="R36"  Part="1" 
F 0 "R36" V 9080 4450 50  0000 C CNN
F 1 "2K" V 9000 4450 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 8930 4450 50  0001 C CNN
F 3 "" H 9000 4450 50  0001 C CNN
	1    9000 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 3750 4500 3750
Wire Wire Line
	4500 3750 4500 4300
Wire Wire Line
	4100 3650 4800 3650
Wire Wire Line
	4800 3650 4800 4300
Wire Wire Line
	4100 3550 5100 3550
Wire Wire Line
	5100 3550 5100 4300
Wire Wire Line
	4100 3450 5400 3450
Wire Wire Line
	5400 3450 5400 4300
Wire Wire Line
	4100 3350 5700 3350
Wire Wire Line
	5700 3350 5700 4300
Wire Wire Line
	4100 3250 6000 3250
Wire Wire Line
	6000 3250 6000 4300
Wire Wire Line
	4100 3150 6300 3150
Wire Wire Line
	6300 3150 6300 4300
Wire Wire Line
	4100 3050 6600 3050
Wire Wire Line
	6600 3050 6600 4300
Wire Wire Line
	4100 2250 6900 2250
Wire Wire Line
	6900 2250 6900 4300
Wire Wire Line
	4100 2150 7200 2150
Wire Wire Line
	7200 2150 7200 4300
Wire Wire Line
	4100 2050 7500 2050
Wire Wire Line
	7500 2050 7500 4300
Wire Wire Line
	4100 1950 7800 1950
Wire Wire Line
	7800 1950 7800 4300
Wire Wire Line
	4100 1850 8100 1850
Wire Wire Line
	8100 1850 8100 4300
Wire Wire Line
	4100 1750 8400 1750
Wire Wire Line
	8400 1750 8400 4300
Wire Wire Line
	4100 1650 8700 1650
Wire Wire Line
	8700 1650 8700 4300
Wire Wire Line
	4100 1550 9000 1550
Wire Wire Line
	9000 1550 9000 4300
$Comp
L GND #PWR?
U 1 1 5A4D6CBE
P 9000 4900
AR Path="/5A4D076B/5A4D6CBE" Ref="#PWR?"  Part="1" 
AR Path="/5A4E7286/5A4D6CBE" Ref="#PWR036"  Part="1" 
F 0 "#PWR036" H 9000 4650 50  0001 C CNN
F 1 "GND" H 9000 4750 50  0000 C CNN
F 2 "" H 9000 4900 50  0001 C CNN
F 3 "" H 9000 4900 50  0001 C CNN
	1    9000 4900
	1    0    0    -1  
$EndComp
Text HLabel 4500 4600 0    60   Output ~ 0
DAC_OUT
$Comp
L VCC #PWR037
U 1 1 5A5049B3
P 2700 1850
F 0 "#PWR037" H 2700 1700 50  0001 C CNN
F 1 "VCC" H 2700 2000 50  0000 C CNN
F 2 "" H 2700 1850 50  0001 C CNN
F 3 "" H 2700 1850 50  0001 C CNN
	1    2700 1850
	0    -1   -1   0   
$EndComp
$Comp
L VCC #PWR038
U 1 1 5A504A30
P 2700 3350
F 0 "#PWR038" H 2700 3200 50  0001 C CNN
F 1 "VCC" H 2700 3500 50  0000 C CNN
F 2 "" H 2700 3350 50  0001 C CNN
F 3 "" H 2700 3350 50  0001 C CNN
	1    2700 3350
	0    -1   -1   0   
$EndComp
$EndSCHEMATC
