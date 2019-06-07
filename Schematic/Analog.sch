EESchema Schematic File Version 4
LIBS:Schematic-cache
EELAYER 29 0
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
L QX14T50B1.843200B50TT:QX14T50B1.843200B50TT U1
U 1 1 5C9C0600
P 1550 1200
F 0 "U1" H 2100 1500 50  0000 L CNN
F 1 "ECS-100A-035" H 1850 1400 50  0000 L CNN
F 2 "QX14T50B1.843200B50TT:QX14T50B1.843200B50TT" H 2600 1300 50  0001 L CNN
F 3 "http://docs-emea.rs-online.com/webdocs/127f/0900766b8127fc57.pdf" H 2600 1200 50  0001 L CNN
F 4 "QX14T50B1.843200B50TT, Crystal Oscillator, 1.8432 MHz, +/-50ppm HCMOS 50pF, 14-pin PDIP, 20.8 x 13.2 x 5.08mm" H 2600 1100 50  0001 L CNN "Description"
F 5 "Qantek" H 2600 900 50  0001 L CNN "Manufacturer_Name"
F 6 "QX14T50B1.843200B50TT" H 2600 800 50  0001 L CNN "Manufacturer_Part_Number"
F 7 "1735868" H 2600 500 50  0001 L CNN "RS Part Number"
F 8 "http://uk.rs-online.com/web/p/products/1735868" H 2600 400 50  0001 L CNN "RS Price/Stock"
F 9 "70418025" H 2600 300 50  0001 L CNN "Allied_Number"
F 10 "http://www.alliedelec.com/qantek-qx14t50b18-43200b50tt/70418025/" H 2600 200 50  0001 L CNN "Allied Price/Stock"
	1    1550 1200
	1    0    0    -1  
$EndComp
NoConn ~ 1550 1200
$Comp
L power:GNDREF #PWR034
U 1 1 5C9C0702
P 1300 1400
F 0 "#PWR034" H 1300 1150 50  0001 C CNN
F 1 "GNDREF" H 1300 1250 50  0000 C CNN
F 2 "" H 1300 1400 50  0001 C CNN
F 3 "" H 1300 1400 50  0001 C CNN
	1    1300 1400
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR035
U 1 1 5C9C0719
P 2900 900
F 0 "#PWR035" H 2900 750 50  0001 C CNN
F 1 "VCC" H 2900 1050 50  0000 C CNN
F 2 "" H 2900 900 50  0001 C CNN
F 3 "" H 2900 900 50  0001 C CNN
	1    2900 900 
	1    0    0    -1  
$EndComp
Text GLabel 10650 1550 2    60   Output ~ 0
~Reset
$Comp
L Device:R R1
U 1 1 5C9C0777
P 9750 1350
F 0 "R1" V 9830 1350 50  0000 C CNN
F 1 "20K" V 9750 1350 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P1.90mm_Vertical" V 9680 1350 50  0001 C CNN
F 3 "" H 9750 1350 50  0001 C CNN
	1    9750 1350
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR036
U 1 1 5C9C087D
P 9750 2100
F 0 "#PWR036" H 9750 1850 50  0001 C CNN
F 1 "GNDREF" H 9750 1950 50  0000 C CNN
F 2 "" H 9750 2100 50  0001 C CNN
F 3 "" H 9750 2100 50  0001 C CNN
	1    9750 2100
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR037
U 1 1 5C9C0891
P 9750 1100
F 0 "#PWR037" H 9750 950 50  0001 C CNN
F 1 "VCC" H 9750 1250 50  0000 C CNN
F 2 "" H 9750 1100 50  0001 C CNN
F 3 "" H 9750 1100 50  0001 C CNN
	1    9750 1100
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_Dual SW1
U 1 1 5C9C08DB
P 8750 1750
F 0 "SW1" V 9150 1650 50  0000 L CNN
F 1 "SW_Push_Dual" V 9050 1700 50  0000 C CNN
F 2 "Buttons_Switches_THT:Push_E-Switch_KS01Q01" H 8750 1950 50  0001 C CNN
F 3 "" H 8750 1950 50  0001 C CNN
	1    8750 1750
	0    -1   -1   0   
$EndComp
$Comp
L Switch:SW_Push_Dual SW2
U 1 1 5C9C0B05
P 950 2900
F 0 "SW2" V 1300 2900 50  0000 L CNN
F 1 "SW_Push_Dual" V 600 3050 50  0000 C CNN
F 2 "Buttons_Switches_THT:Push_E-Switch_KS01Q01" H 950 3100 50  0001 C CNN
F 3 "" H 950 3100 50  0001 C CNN
	1    950  2900
	0    -1   -1   0   
$EndComp
Text GLabel 4300 1450 2    60   Output ~ 0
Clk
$Comp
L Device:C C12
U 1 1 5C9C14F2
P 8500 3150
F 0 "C12" H 8525 3250 50  0000 L CNN
F 1 "0.1uF" H 8525 3050 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 8538 3000 50  0001 C CNN
F 3 "" H 8500 3150 50  0001 C CNN
	1    8500 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C3
U 1 1 5C9C159C
P 5900 3150
F 0 "C3" H 5925 3250 50  0000 L CNN
F 1 "220uF" H 5925 3050 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D8.0mm_P5.00mm" H 5938 3000 50  0001 C CNN
F 3 "" H 5900 3150 50  0001 C CNN
	1    5900 3150
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR038
U 1 1 5C9C1BA4
P 5650 2800
F 0 "#PWR038" H 5650 2650 50  0001 C CNN
F 1 "VCC" H 5650 2950 50  0000 C CNN
F 2 "" H 5650 2800 50  0001 C CNN
F 3 "" H 5650 2800 50  0001 C CNN
	1    5650 2800
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR039
U 1 1 5C9C1C55
P 5650 3500
F 0 "#PWR039" H 5650 3250 50  0001 C CNN
F 1 "GNDREF" H 5650 3350 50  0000 C CNN
F 2 "" H 5650 3500 50  0001 C CNN
F 3 "" H 5650 3500 50  0001 C CNN
	1    5650 3500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C13
U 1 1 5C9C1F04
P 8800 3150
F 0 "C13" H 8825 3250 50  0000 L CNN
F 1 "0.1uF" H 8825 3050 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 8838 3000 50  0001 C CNN
F 3 "" H 8800 3150 50  0001 C CNN
	1    8800 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C14
U 1 1 5C9C1F87
P 9050 3150
F 0 "C14" H 9075 3250 50  0000 L CNN
F 1 "0.1uF" H 9075 3050 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 9088 3000 50  0001 C CNN
F 3 "" H 9050 3150 50  0001 C CNN
	1    9050 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C15
U 1 1 5C9C1F8D
P 9350 3150
F 0 "C15" H 9375 3250 50  0000 L CNN
F 1 "0.1uF" H 9375 3050 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 9388 3000 50  0001 C CNN
F 3 "" H 9350 3150 50  0001 C CNN
	1    9350 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C16
U 1 1 5C9C208F
P 9650 3150
F 0 "C16" H 9675 3250 50  0000 L CNN
F 1 "0.1uF" H 9675 3050 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 9688 3000 50  0001 C CNN
F 3 "" H 9650 3150 50  0001 C CNN
	1    9650 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C17
U 1 1 5C9C2095
P 9950 3150
F 0 "C17" H 9975 3250 50  0000 L CNN
F 1 "0.1uF" H 9975 3050 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 9988 3000 50  0001 C CNN
F 3 "" H 9950 3150 50  0001 C CNN
	1    9950 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C18
U 1 1 5C9C209B
P 10200 3150
F 0 "C18" H 10225 3250 50  0000 L CNN
F 1 "0.1uF" H 10225 3050 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 10238 3000 50  0001 C CNN
F 3 "" H 10200 3150 50  0001 C CNN
	1    10200 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C19
U 1 1 5C9C20A1
P 10500 3150
F 0 "C19" H 10525 3250 50  0000 L CNN
F 1 "0.1uF" H 10525 3050 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 10538 3000 50  0001 C CNN
F 3 "" H 10500 3150 50  0001 C CNN
	1    10500 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 5C9C255C
P 6250 3150
F 0 "C4" H 6275 3250 50  0000 L CNN
F 1 "0.1uF" H 6275 3050 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 6288 3000 50  0001 C CNN
F 3 "" H 6250 3150 50  0001 C CNN
	1    6250 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 5C9C2562
P 6550 3150
F 0 "C5" H 6575 3250 50  0000 L CNN
F 1 "0.1uF" H 6575 3050 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 6588 3000 50  0001 C CNN
F 3 "" H 6550 3150 50  0001 C CNN
	1    6550 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C6
U 1 1 5C9C2568
P 6800 3150
F 0 "C6" H 6825 3250 50  0000 L CNN
F 1 "0.1uF" H 6825 3050 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 6838 3000 50  0001 C CNN
F 3 "" H 6800 3150 50  0001 C CNN
	1    6800 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C7
U 1 1 5C9C256E
P 7100 3150
F 0 "C7" H 7125 3250 50  0000 L CNN
F 1 "0.1uF" H 7125 3050 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 7138 3000 50  0001 C CNN
F 3 "" H 7100 3150 50  0001 C CNN
	1    7100 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C8
U 1 1 5C9C2574
P 7400 3150
F 0 "C8" H 7425 3250 50  0000 L CNN
F 1 "0.1uF" H 7425 3050 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 7438 3000 50  0001 C CNN
F 3 "" H 7400 3150 50  0001 C CNN
	1    7400 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C9
U 1 1 5C9C257A
P 7700 3150
F 0 "C9" H 7725 3250 50  0000 L CNN
F 1 "0.1uF" H 7725 3050 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 7738 3000 50  0001 C CNN
F 3 "" H 7700 3150 50  0001 C CNN
	1    7700 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C10
U 1 1 5C9C2580
P 7950 3150
F 0 "C10" H 7975 3250 50  0000 L CNN
F 1 "0.1uF" H 7975 3050 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 7988 3000 50  0001 C CNN
F 3 "" H 7950 3150 50  0001 C CNN
	1    7950 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C11
U 1 1 5C9C2586
P 8250 3150
F 0 "C11" H 8275 3250 50  0000 L CNN
F 1 "0.1uF" H 8275 3050 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 8288 3000 50  0001 C CNN
F 3 "" H 8250 3150 50  0001 C CNN
	1    8250 3150
	1    0    0    -1  
$EndComp
Text Notes 4150 1300 0    60   ~ 0
By moving the jumper, the CPU can operate in\nfree-running mode or in single-step mode.\nBy removing the jumper, an external clock\nsignal can be applied to jumper pin 2.
Text Notes 1750 1550 0    60   ~ 0
3.5MHz oscillator
$Comp
L Device:CP C1
U 1 1 5C9C52F6
P 9750 1750
F 0 "C1" H 9775 1850 50  0000 L CNN
F 1 "10uF" H 9775 1650 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D5.0mm_P2.00mm" H 9788 1600 50  0001 C CNN
F 3 "" H 9750 1750 50  0001 C CNN
	1    9750 1750
	1    0    0    -1  
$EndComp
Text Notes 7700 3650 0    60   ~ 0
Bypass capacitors
Text Notes 9200 2550 0    60   ~ 0
Reset generation
Text Notes 950  700  0    60   ~ 0
Clock generation
Text GLabel 7500 1500 2    60   Output ~ 0
Hi
Text GLabel 7500 1750 2    60   Output ~ 0
Lo
$Comp
L power:GNDREF #PWR040
U 1 1 5CA2A0BA
P 7250 1850
F 0 "#PWR040" H 7250 1600 50  0001 C CNN
F 1 "GNDREF" H 7250 1700 50  0000 C CNN
F 2 "" H 7250 1850 50  0001 C CNN
F 3 "" H 7250 1850 50  0001 C CNN
	1    7250 1850
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR041
U 1 1 5CA2A100
P 7250 1400
F 0 "#PWR041" H 7250 1250 50  0001 C CNN
F 1 "VCC" H 7250 1550 50  0000 C CNN
F 2 "" H 7250 1400 50  0001 C CNN
F 3 "" H 7250 1400 50  0001 C CNN
	1    7250 1400
	1    0    0    -1  
$EndComp
Text Notes 7200 2250 0    60   ~ 0
Logic levels
Entry Wire Line
	2400 5250 2500 5150
Entry Wire Line
	2400 5350 2500 5250
Entry Wire Line
	2400 5450 2500 5350
Entry Wire Line
	2400 5550 2500 5450
Entry Wire Line
	2400 5650 2500 5550
Entry Wire Line
	2400 5750 2500 5650
Entry Wire Line
	2400 5850 2500 5750
Entry Wire Line
	2400 5950 2500 5850
Text GLabel 2050 4800 0    60   Input ~ 0
d[0..7]
Text Notes 2150 4750 0    60   ~ 0
DataBus
Text Label 2100 5250 0    60   ~ 0
d0
Text Label 2100 5350 0    60   ~ 0
d1
Text Label 2100 5450 0    60   ~ 0
d2
Text Label 2100 5550 0    60   ~ 0
d3
Text Label 2100 5650 0    60   ~ 0
d4
Text Label 2100 5750 0    60   ~ 0
d5
Text Label 2100 5850 0    60   ~ 0
d6
Text Label 2100 5950 0    60   ~ 0
d7
Entry Wire Line
	4250 5250 4350 5150
Entry Wire Line
	4250 5350 4350 5250
Entry Wire Line
	4250 5450 4350 5350
Entry Wire Line
	4250 5550 4350 5450
Entry Wire Line
	4250 5650 4350 5550
Entry Wire Line
	4250 5750 4350 5650
Entry Wire Line
	4250 5850 4350 5750
Entry Wire Line
	4250 5950 4350 5850
Entry Wire Line
	4250 6050 4350 5950
Entry Wire Line
	4250 6150 4350 6050
Entry Wire Line
	4250 6250 4350 6150
Entry Wire Line
	4250 6350 4350 6250
Entry Wire Line
	4250 6450 4350 6350
Entry Wire Line
	4250 6550 4350 6450
Entry Wire Line
	4250 6650 4350 6550
Entry Wire Line
	4250 6750 4350 6650
Text GLabel 3750 4800 0    60   Input ~ 0
adr[0..15]
Text Notes 3850 4750 0    60   ~ 0
AddressBus
Text Label 3950 5250 0    60   ~ 0
adr0
Text Label 3950 5350 0    60   ~ 0
adr1
Text Label 3950 5450 0    60   ~ 0
adr2
Text Label 3950 5550 0    60   ~ 0
adr3
Text Label 3950 5650 0    60   ~ 0
adr4
Text Label 3950 5750 0    60   ~ 0
adr5
Text Label 3950 5850 0    60   ~ 0
adr6
Text Label 3950 5950 0    60   ~ 0
adr7
Text Label 3950 6050 0    60   ~ 0
adr8
Text Label 3950 6150 0    60   ~ 0
adr9
Text Label 3950 6250 0    60   ~ 0
adr10
Text Label 3950 6350 0    60   ~ 0
adr11
Text Label 3950 6450 0    60   ~ 0
adr12
Text Label 3950 6550 0    60   ~ 0
adr13
Text Label 3950 6650 0    60   ~ 0
adr14
Text Label 3950 6750 0    60   ~ 0
adr15
NoConn ~ 2050 5150
Text GLabel 2200 5050 2    60   Input ~ 0
Lo
NoConn ~ 3900 5150
Text GLabel 4100 5050 2    60   Input ~ 0
Lo
$Comp
L Device:R R2
U 1 1 5CAD60DA
P 9350 1550
F 0 "R2" V 9430 1550 50  0000 C CNN
F 1 "1K" V 9350 1550 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P1.90mm_Vertical" V 9280 1550 50  0001 C CNN
F 3 "" H 9350 1550 50  0001 C CNN
	1    9350 1550
	0    1    1    0   
$EndComp
$Comp
L power:GNDREF #PWR042
U 1 1 5CAD631F
P 8950 2100
F 0 "#PWR042" H 8950 1850 50  0001 C CNN
F 1 "GNDREF" H 8950 1950 50  0000 C CNN
F 2 "" H 8950 2100 50  0001 C CNN
F 3 "" H 8950 2100 50  0001 C CNN
	1    8950 2100
	1    0    0    -1  
$EndComp
NoConn ~ 8750 1550
NoConn ~ 8750 1950
$Comp
L Timer:NE555 IC18
U 1 1 5CAD6D61
P 2450 2800
F 0 "IC18" H 2150 3150 50  0000 L CNN
F 1 "NE555" H 2550 3150 50  0000 L CNN
F 2 "Housings_DIP:DIP-8_W7.62mm_Socket" H 2450 2800 50  0001 C CNN
F 3 "" H 2450 2800 50  0001 C CNN
	1    2450 2800
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR043
U 1 1 5CAD6E51
P 2450 3450
F 0 "#PWR043" H 2450 3200 50  0001 C CNN
F 1 "GNDREF" H 2450 3300 50  0000 C CNN
F 2 "" H 2450 3450 50  0001 C CNN
F 3 "" H 2450 3450 50  0001 C CNN
	1    2450 3450
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR044
U 1 1 5CAD6EC8
P 2450 2050
F 0 "#PWR044" H 2450 1900 50  0001 C CNN
F 1 "VCC" H 2450 2200 50  0000 C CNN
F 2 "" H 2450 2050 50  0001 C CNN
F 3 "" H 2450 2050 50  0001 C CNN
	1    2450 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 1300 1300 1300
Wire Wire Line
	1300 1300 1300 1400
Wire Wire Line
	2750 1300 2900 1300
Wire Wire Line
	2900 1300 2900 900 
Wire Wire Line
	9750 1100 9750 1200
Wire Wire Line
	9750 1500 9750 1550
Connection ~ 9750 1550
Wire Wire Line
	9500 1550 9750 1550
Wire Wire Line
	2750 1200 4000 1200
Wire Wire Line
	10500 2900 10500 3000
Wire Wire Line
	5650 2900 5900 2900
Wire Wire Line
	5650 2900 5650 2800
Wire Wire Line
	10500 3400 10500 3300
Wire Wire Line
	5650 3400 5900 3400
Wire Wire Line
	5650 3400 5650 3500
Wire Wire Line
	5900 2900 5900 3000
Connection ~ 5900 2900
Wire Wire Line
	5900 3300 5900 3400
Connection ~ 5900 3400
Wire Wire Line
	6250 2900 6250 3000
Connection ~ 6250 2900
Wire Wire Line
	6250 3300 6250 3400
Connection ~ 6250 3400
Wire Wire Line
	6550 3300 6550 3400
Connection ~ 6550 3400
Wire Wire Line
	6550 3000 6550 2900
Connection ~ 6550 2900
Wire Wire Line
	6800 2900 6800 3000
Connection ~ 6800 2900
Wire Wire Line
	6800 3300 6800 3400
Connection ~ 6800 3400
Wire Wire Line
	7100 2900 7100 3000
Connection ~ 7100 2900
Wire Wire Line
	7100 3300 7100 3400
Connection ~ 7100 3400
Wire Wire Line
	7400 2900 7400 3000
Connection ~ 7400 2900
Wire Wire Line
	7400 3300 7400 3400
Connection ~ 7400 3400
Wire Wire Line
	7700 2900 7700 3000
Connection ~ 7700 2900
Wire Wire Line
	7700 3300 7700 3400
Connection ~ 7700 3400
Wire Wire Line
	7950 2900 7950 3000
Connection ~ 7950 2900
Wire Wire Line
	7950 3300 7950 3400
Connection ~ 7950 3400
Wire Wire Line
	8250 2900 8250 3000
Connection ~ 8250 2900
Wire Wire Line
	8250 3300 8250 3400
Connection ~ 8250 3400
Wire Wire Line
	8500 2900 8500 3000
Connection ~ 8500 2900
Wire Wire Line
	8500 3300 8500 3400
Connection ~ 8500 3400
Wire Wire Line
	8800 2900 8800 3000
Connection ~ 8800 2900
Wire Wire Line
	8800 3300 8800 3400
Connection ~ 8800 3400
Wire Wire Line
	9050 2900 9050 3000
Connection ~ 9050 2900
Wire Wire Line
	9050 3300 9050 3400
Connection ~ 9050 3400
Wire Wire Line
	9350 2900 9350 3000
Connection ~ 9350 2900
Wire Wire Line
	9350 3300 9350 3400
Connection ~ 9350 3400
Wire Wire Line
	9650 2900 9650 3000
Connection ~ 9650 2900
Wire Wire Line
	9650 3300 9650 3400
Connection ~ 9650 3400
Wire Wire Line
	9950 2900 9950 3000
Connection ~ 9950 2900
Wire Wire Line
	9950 3300 9950 3400
Connection ~ 9950 3400
Wire Wire Line
	10200 2900 10200 3000
Connection ~ 10200 2900
Wire Wire Line
	10200 3300 10200 3400
Connection ~ 10200 3400
Wire Wire Line
	7250 1400 7250 1500
Wire Wire Line
	7250 1500 7500 1500
Wire Wire Line
	7500 1750 7250 1750
Wire Wire Line
	7250 1750 7250 1850
Wire Bus Line
	2500 4800 2050 4800
Wire Wire Line
	2050 5250 2400 5250
Wire Wire Line
	2050 5350 2400 5350
Wire Wire Line
	2050 5450 2400 5450
Wire Wire Line
	2050 5550 2400 5550
Wire Wire Line
	2050 5650 2400 5650
Wire Wire Line
	2050 5750 2400 5750
Wire Wire Line
	2050 5850 2400 5850
Wire Wire Line
	2050 5950 2400 5950
Wire Bus Line
	4350 4800 3750 4800
Wire Wire Line
	3900 5250 4250 5250
Wire Wire Line
	3900 5350 4250 5350
Wire Wire Line
	3900 5450 4250 5450
Wire Wire Line
	3900 5550 4250 5550
Wire Wire Line
	3900 5650 4250 5650
Wire Wire Line
	3900 5750 4250 5750
Wire Wire Line
	3900 5850 4250 5850
Wire Wire Line
	3900 5950 4250 5950
Wire Wire Line
	3900 6050 4250 6050
Wire Wire Line
	3900 6150 4250 6150
Wire Wire Line
	3900 6250 4250 6250
Wire Wire Line
	3900 6350 4250 6350
Wire Wire Line
	3900 6450 4250 6450
Wire Wire Line
	3900 6550 4250 6550
Wire Wire Line
	3900 6650 4250 6650
Wire Wire Line
	3900 6750 4250 6750
Wire Wire Line
	2050 5050 2200 5050
Wire Wire Line
	3900 5050 4100 5050
Wire Wire Line
	8950 1550 9200 1550
Wire Wire Line
	8950 1950 8950 2100
Wire Wire Line
	2450 2050 2450 2100
Wire Wire Line
	2450 3200 2450 3350
Wire Wire Line
	3300 1700 3300 2600
Wire Wire Line
	3300 2600 2950 2600
Wire Wire Line
	2950 2800 3050 2800
Wire Wire Line
	3050 3000 2950 3000
$Comp
L Device:C_Small C20
U 1 1 5CADA2B6
P 3550 2800
F 0 "C20" H 3560 2870 50  0000 L CNN
F 1 "0.1uF" H 3560 2720 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 3550 2800 50  0001 C CNN
F 3 "" H 3550 2800 50  0001 C CNN
	1    3550 2800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5CADBD0F
P 3050 2300
F 0 "R4" V 3130 2300 50  0000 C CNN
F 1 "1M" V 3050 2300 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P1.90mm_Vertical" V 2980 2300 50  0001 C CNN
F 3 "" H 3050 2300 50  0001 C CNN
	1    3050 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 2100 1450 2100
Wire Wire Line
	3550 2100 3550 2700
Connection ~ 2450 2100
Wire Wire Line
	1150 3350 2450 3350
Wire Wire Line
	3550 3350 3550 2900
Wire Wire Line
	1950 3000 1850 3000
Wire Wire Line
	1850 3000 1850 2100
Wire Wire Line
	3050 2450 3050 2800
Wire Wire Line
	3050 2100 3050 2150
Connection ~ 3050 2100
Connection ~ 3050 2800
$Comp
L Device:C_Small C21
U 1 1 5CAD9D92
P 3050 3200
F 0 "C21" H 3060 3270 50  0000 L CNN
F 1 "0.1uF" H 3060 3120 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 3050 3200 50  0001 C CNN
F 3 "" H 3050 3200 50  0001 C CNN
	1    3050 3200
	1    0    0    -1  
$EndComp
Connection ~ 3050 3000
Wire Wire Line
	3050 3300 3050 3350
Connection ~ 3050 3350
NoConn ~ 1950 2800
$Comp
L Device:D D1
U 1 1 5CAD9FE1
P 1700 2350
F 0 "D1" H 1700 2450 50  0000 C CNN
F 1 "1N4148" H 1700 2250 50  0000 C CNN
F 2 "Diodes_THT:D_DO-35_SOD27_P2.54mm_Vertical_AnodeUp" H 1700 2350 50  0001 C CNN
F 3 "" H 1700 2350 50  0001 C CNN
	1    1700 2350
	0    1    1    0   
$EndComp
Wire Wire Line
	1450 2600 1700 2600
Wire Wire Line
	1700 2100 1700 2200
Connection ~ 1850 2100
$Comp
L Device:R R5
U 1 1 5CADA35B
P 1450 2350
F 0 "R5" V 1350 2350 50  0000 C CNN
F 1 "10K" V 1450 2350 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P1.90mm_Vertical" V 1380 2350 50  0001 C CNN
F 3 "" H 1450 2350 50  0001 C CNN
	1    1450 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 2500 1700 2600
Wire Wire Line
	1450 2100 1450 2200
Connection ~ 1700 2100
Wire Wire Line
	1450 2600 1450 2500
Connection ~ 1700 2600
$Comp
L Device:C_Small C22
U 1 1 5CADA8FE
P 1350 2600
F 0 "C22" V 1450 2550 50  0000 L CNN
F 1 "0.1uF" V 1550 2550 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 1350 2600 50  0001 C CNN
F 3 "" H 1350 2600 50  0001 C CNN
	1    1350 2600
	0    1    1    0   
$EndComp
$Comp
L Device:R R6
U 1 1 5CADAA02
P 1200 2350
F 0 "R6" V 1100 2350 50  0000 C CNN
F 1 "10K" V 1200 2350 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P1.90mm_Vertical" V 1130 2350 50  0001 C CNN
F 3 "" H 1200 2350 50  0001 C CNN
	1    1200 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 2100 1200 2200
Connection ~ 1450 2100
Wire Wire Line
	1150 2600 1200 2600
Wire Wire Line
	1200 2600 1200 2500
Wire Wire Line
	1150 2700 1150 2600
Connection ~ 1200 2600
Wire Wire Line
	1150 3100 1150 3350
Connection ~ 2450 3350
NoConn ~ 950  2700
NoConn ~ 950  3100
Text Notes 650  3850 0    60   ~ 0
555 circuit from\nhttps://electronics.stackexchange.com/questions/180716/555-timer-one-shot-trigger
$Comp
L 74xx:74LS139 IC15
U 2 1 5CC0FB47
P 9050 4800
F 0 "IC15" H 9050 5350 50  0000 C CNN
F 1 "74HCT139" H 9050 5250 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_Socket" H 9050 4800 50  0001 C CNN
F 3 "" H 9050 4800 50  0001 C CNN
	2    9050 4800
	1    0    0    -1  
$EndComp
Text GLabel 8300 4800 0    60   Input ~ 0
Clk
Text GLabel 8250 4700 0    60   Input ~ 0
Lo
Text GLabel 8250 5000 0    60   Input ~ 0
Lo
Wire Wire Line
	8250 4700 8550 4700
Wire Wire Line
	8250 5000 8550 5000
Text GLabel 9900 4800 2    60   Output ~ 0
~Clkbar
NoConn ~ 9550 4700
NoConn ~ 9550 4900
NoConn ~ 9550 5000
Text Notes 7700 5500 0    60   ~ 0
Clkbar is an inverted Clk signal, used to initiate events on the\nfalling edge of Clk. We use the spare 139 half as an inverter.
Wire Wire Line
	9750 1550 9750 1600
Wire Wire Line
	9750 1550 10650 1550
Wire Wire Line
	5900 2900 6250 2900
Wire Wire Line
	5900 3400 6250 3400
Wire Wire Line
	6250 2900 6550 2900
Wire Wire Line
	6250 3400 6550 3400
Wire Wire Line
	6550 3400 6800 3400
Wire Wire Line
	6550 2900 6800 2900
Wire Wire Line
	6800 2900 7100 2900
Wire Wire Line
	6800 3400 7100 3400
Wire Wire Line
	7100 2900 7400 2900
Wire Wire Line
	7100 3400 7400 3400
Wire Wire Line
	7400 2900 7700 2900
Wire Wire Line
	7400 3400 7700 3400
Wire Wire Line
	7700 2900 7950 2900
Wire Wire Line
	7700 3400 7950 3400
Wire Wire Line
	7950 2900 8250 2900
Wire Wire Line
	7950 3400 8250 3400
Wire Wire Line
	8250 2900 8500 2900
Wire Wire Line
	8250 3400 8500 3400
Wire Wire Line
	8500 2900 8800 2900
Wire Wire Line
	8500 3400 8800 3400
Wire Wire Line
	8800 2900 9050 2900
Wire Wire Line
	8800 3400 9050 3400
Wire Wire Line
	9050 2900 9350 2900
Wire Wire Line
	9050 3400 9350 3400
Wire Wire Line
	9350 2900 9650 2900
Wire Wire Line
	9350 3400 9650 3400
Wire Wire Line
	9650 2900 9950 2900
Wire Wire Line
	9650 3400 9950 3400
Wire Wire Line
	9950 2900 10200 2900
Wire Wire Line
	9950 3400 10200 3400
Wire Wire Line
	10200 2900 10500 2900
Wire Wire Line
	10200 3400 10500 3400
Wire Wire Line
	2450 2100 2450 2400
Wire Wire Line
	2450 2100 3050 2100
Wire Wire Line
	3050 2100 3550 2100
Wire Wire Line
	3050 2800 3050 3000
Wire Wire Line
	3050 3000 3050 3100
Wire Wire Line
	3050 3350 3550 3350
Wire Wire Line
	1850 2100 2450 2100
Wire Wire Line
	1700 2100 1850 2100
Wire Wire Line
	1700 2600 1950 2600
Wire Wire Line
	1450 2100 1700 2100
Wire Wire Line
	1200 2600 1250 2600
Wire Wire Line
	2450 3350 2450 3450
Wire Wire Line
	2450 3350 3050 3350
Wire Wire Line
	9750 1900 9750 2100
$Comp
L Jumper:Jumper_3_Bridged12 J1
U 1 1 5CED3DD3
P 4000 1450
F 0 "J1" V 4046 1517 50  0000 L CNN
F 1 "Jumper_3_Bridged12" V 3955 1517 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 4000 1450 50  0001 C CNN
F 3 "~" H 4000 1450 50  0001 C CNN
	1    4000 1450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3300 1700 4000 1700
Wire Wire Line
	4150 1450 4300 1450
$Comp
L Connector:Conn_01x10_Female J2
U 1 1 5CF640E4
P 1850 5550
F 0 "J2" H 1850 6100 50  0000 C CNN
F 1 "Data Bus Pin Header" H 1800 6200 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x10_P2.54mm_Vertical" H 1850 5550 50  0001 C CNN
F 3 "~" H 1850 5550 50  0001 C CNN
	1    1850 5550
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x18_Female J3
U 1 1 5CF660B4
P 3700 5950
F 0 "J3" H 3700 6950 50  0000 C CNN
F 1 "Address Bus Pin Header" H 3700 7050 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x18_P2.54mm_Vertical" H 3700 5950 50  0001 C CNN
F 3 "~" H 3700 5950 50  0001 C CNN
	1    3700 5950
	-1   0    0    1   
$EndComp
Wire Wire Line
	9550 4800 9900 4800
Wire Wire Line
	8300 4800 8550 4800
Wire Bus Line
	2500 4800 2500 5850
Wire Bus Line
	4350 4800 4350 6650
$EndSCHEMATC
