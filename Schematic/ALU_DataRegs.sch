EESchema Schematic File Version 4
LIBS:Schematic-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 6
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
L 74LS593:M27C322-100F1-RESCUE-Schematic IC6
U 1 1 5C985237
P 6900 3200
F 0 "IC6" H 7450 3500 50  0000 L CNN
F 1 "M27C322-100F1" H 7200 3400 50  0000 L CNN
F 2 "Housings_DIP:DIP-42_W15.24mm_Socket" H 7950 3300 50  0001 L CNN
F 3 "https://componentsearchengine.com/Datasheets/1/M27C322-100F1.pdf" H 7950 3200 50  0001 L CNN
F 4 "EPROM 32M (2Mx16) 100ns" H 7950 3100 50  0001 L CNN "Description"
F 5 "5.71" H 7950 3000 50  0001 L CNN "Height"
F 6 "STMicroelectronics" H 7950 2900 50  0001 L CNN "Manufacturer_Name"
F 7 "M27C322-100F1" H 7950 2800 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "511-M27C322-10F" H 7950 2700 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=511-M27C322-10F" H 7950 2600 50  0001 L CNN "Mouser Price/Stock"
F 10 "4151455" H 7950 2500 50  0001 L CNN "RS Part Number"
F 11 "http://uk.rs-online.com/web/p/products/4151455" H 7950 2400 50  0001 L CNN "RS Price/Stock"
	1    6900 3200
	1    0    0    -1  
$EndComp
Text Notes 7400 4200 0    60   ~ 0
ALU
$Comp
L 74LS593:74LS574-RESCUE-Schematic IC5
U 1 1 5C986B56
P 3800 5000
F 0 "IC5" H 3800 5700 50  0000 C CNN
F 1 "74HCT574" H 3800 5600 50  0000 C CNN
F 2 "Housings_DIP:DIP-20_W7.62mm_Socket" H 3800 5000 50  0001 C CNN
F 3 "" H 3800 5000 50  0001 C CNN
	1    3800 5000
	1    0    0    -1  
$EndComp
$Comp
L 74LS593:74LS574-RESCUE-Schematic IC4
U 1 1 5C987475
P 3800 3400
F 0 "IC4" H 3800 4100 50  0000 C CNN
F 1 "74HCT574" H 3800 4000 50  0000 C CNN
F 2 "Housings_DIP:DIP-20_W7.62mm_Socket" H 3800 3400 50  0001 C CNN
F 3 "" H 3800 3400 50  0001 C CNN
	1    3800 3400
	1    0    0    -1  
$EndComp
Text Notes 3700 3350 0    60   ~ 0
Areg
Text Notes 3700 5000 0    60   ~ 0
Breg
Entry Wire Line
	2750 3000 2850 2900
Entry Wire Line
	2750 3100 2850 3000
Entry Wire Line
	2750 3200 2850 3100
Entry Wire Line
	2750 3300 2850 3200
Entry Wire Line
	2750 3400 2850 3300
Entry Wire Line
	2750 3500 2850 3400
Entry Wire Line
	2750 3600 2850 3500
Entry Wire Line
	2750 3700 2850 3600
Entry Wire Line
	2750 4600 2850 4500
Entry Wire Line
	2750 4700 2850 4600
Entry Wire Line
	2750 4800 2850 4700
Entry Wire Line
	2750 4900 2850 4800
Entry Wire Line
	2750 5000 2850 4900
Entry Wire Line
	2750 5100 2850 5000
Entry Wire Line
	2750 5200 2850 5100
Entry Wire Line
	2750 5300 2850 5200
Text Label 2900 5200 0    60   ~ 0
d0
Text Label 2900 5100 0    60   ~ 0
d1
Text Label 2900 5000 0    60   ~ 0
d2
Text Label 2900 4900 0    60   ~ 0
d3
Text Label 2900 4800 0    60   ~ 0
d4
Text Label 2900 4700 0    60   ~ 0
d5
Text Label 2900 4600 0    60   ~ 0
d6
Text Label 2900 4500 0    60   ~ 0
d7
Text Label 2900 3600 0    60   ~ 0
d0
Text Label 2900 3500 0    60   ~ 0
d1
Text Label 2900 3400 0    60   ~ 0
d2
Text Label 2900 3300 0    60   ~ 0
d3
Text Label 2900 3200 0    60   ~ 0
d4
Text Label 2900 3100 0    60   ~ 0
d5
Text Label 2900 3000 0    60   ~ 0
d6
Text Label 2900 2900 0    60   ~ 0
d7
Entry Wire Line
	9200 5200 9300 5100
Entry Wire Line
	9200 5100 9300 5000
Entry Wire Line
	9200 5000 9300 4900
Entry Wire Line
	9200 4900 9300 4800
Entry Wire Line
	9200 4800 9300 4700
Entry Wire Line
	9200 4700 9300 4600
Entry Wire Line
	9200 4600 9300 4500
Entry Wire Line
	9200 4500 9300 4400
Text GLabel 9550 4100 2    60   Output ~ 0
d[0..7]
Entry Wire Line
	6650 3100 6750 3200
Entry Wire Line
	6650 3200 6750 3300
Entry Wire Line
	6650 3300 6750 3400
Entry Wire Line
	6650 3400 6750 3500
Entry Wire Line
	6650 3500 6750 3600
Text Label 6750 3600 0    60   ~ 0
Op0
Text Label 6750 3500 0    60   ~ 0
Op1
Text Label 6750 3400 0    60   ~ 0
Op2
Text Label 6750 3300 0    60   ~ 0
Op3
Text Label 6750 3200 0    60   ~ 0
Op4
Text GLabel 6100 2350 0    60   Input ~ 0
Op[0..4]
Text GLabel 9550 3950 2    60   Output ~ 0
Carry
Text GLabel 9500 3650 2    60   Output ~ 0
Zero
Text GLabel 9500 3500 2    60   Output ~ 0
Negative
NoConn ~ 8100 3700
NoConn ~ 8100 3800
NoConn ~ 8100 3900
$Comp
L power:VCC #PWR08
U 1 1 5C99BBA6
P 8300 3200
F 0 "#PWR08" H 8300 3050 50  0001 C CNN
F 1 "VCC" H 8300 3350 50  0000 C CNN
F 2 "" H 8300 3200 50  0001 C CNN
F 3 "" H 8300 3200 50  0001 C CNN
	1    8300 3200
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR09
U 1 1 5C99BBC1
P 4900 3800
F 0 "#PWR09" H 4900 3650 50  0001 C CNN
F 1 "VCC" H 4900 3950 50  0000 C CNN
F 2 "" H 4900 3800 50  0001 C CNN
F 3 "" H 4900 3800 50  0001 C CNN
	1    4900 3800
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR010
U 1 1 5C99BC3B
P 4450 5400
F 0 "#PWR010" H 4450 5250 50  0001 C CNN
F 1 "VCC" H 4450 5550 50  0000 C CNN
F 2 "" H 4450 5400 50  0001 C CNN
F 3 "" H 4450 5400 50  0001 C CNN
	1    4450 5400
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR011
U 1 1 5C99BDAD
P 4900 3900
F 0 "#PWR011" H 4900 3650 50  0001 C CNN
F 1 "GNDREF" H 4900 3750 50  0000 C CNN
F 2 "" H 4900 3900 50  0001 C CNN
F 3 "" H 4900 3900 50  0001 C CNN
	1    4900 3900
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR012
U 1 1 5C99BDC8
P 4450 5500
F 0 "#PWR012" H 4450 5250 50  0001 C CNN
F 1 "GNDREF" H 4450 5350 50  0000 C CNN
F 2 "" H 4450 5500 50  0001 C CNN
F 3 "" H 4450 5500 50  0001 C CNN
	1    4450 5500
	1    0    0    -1  
$EndComp
Text GLabel 2250 3800 0    60   Input ~ 0
Aload
Text GLabel 2300 5400 0    60   Input ~ 0
Bload
Text GLabel 9500 3150 2    60   Input ~ 0
~ALUresult
$Comp
L power:GNDREF #PWR013
U 1 1 5C99887D
P 8650 3300
F 0 "#PWR013" H 8650 3050 50  0001 C CNN
F 1 "GNDREF" H 8650 3150 50  0000 C CNN
F 2 "" H 8650 3300 50  0001 C CNN
F 3 "" H 8650 3300 50  0001 C CNN
	1    8650 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 4500 5850 4500
Wire Wire Line
	4500 4600 5750 4600
Wire Wire Line
	4500 4700 5650 4700
Wire Wire Line
	4500 4800 5550 4800
Wire Wire Line
	6150 3700 6900 3700
Wire Wire Line
	6100 3800 6900 3800
Wire Wire Line
	6050 3900 6900 3900
Wire Wire Line
	6000 4000 6900 4000
Wire Wire Line
	5950 4100 6900 4100
Wire Wire Line
	5900 4200 6900 4200
Wire Wire Line
	5850 4300 6900 4300
Wire Wire Line
	5800 4400 6900 4400
Wire Wire Line
	5800 3600 5800 4400
Wire Wire Line
	5850 3500 5850 4300
Wire Wire Line
	5900 3400 5900 4200
Wire Wire Line
	5950 3300 5950 4100
Wire Wire Line
	6000 3200 6000 4000
Wire Wire Line
	6050 3100 6050 3900
Wire Wire Line
	6100 3000 6100 3800
Wire Wire Line
	6150 2900 6150 3700
Wire Bus Line
	2750 5300 1950 5300
Wire Wire Line
	2850 2900 3100 2900
Wire Wire Line
	2850 3000 3100 3000
Wire Wire Line
	2850 3100 3100 3100
Wire Wire Line
	2850 3200 3100 3200
Wire Wire Line
	2850 3300 3100 3300
Wire Wire Line
	2850 3400 3100 3400
Wire Wire Line
	2850 3500 3100 3500
Wire Wire Line
	2850 3600 3100 3600
Wire Wire Line
	2850 4500 3100 4500
Wire Wire Line
	2850 4600 3100 4600
Wire Wire Line
	2850 4700 3100 4700
Wire Wire Line
	2850 4800 3100 4800
Wire Wire Line
	2850 4900 3100 4900
Wire Wire Line
	2850 5000 3100 5000
Wire Wire Line
	2850 5100 3100 5100
Wire Wire Line
	2850 5200 3100 5200
Wire Bus Line
	9300 4100 9550 4100
Wire Wire Line
	8100 4500 9200 4500
Wire Wire Line
	8100 4600 9200 4600
Wire Wire Line
	8100 4700 9200 4700
Wire Wire Line
	8100 4800 9200 4800
Wire Wire Line
	8100 4900 9200 4900
Wire Wire Line
	8100 5000 9200 5000
Wire Wire Line
	8100 5100 9200 5100
Wire Wire Line
	8100 5200 9200 5200
Wire Wire Line
	6900 3200 6750 3200
Wire Wire Line
	6900 3300 6750 3300
Wire Wire Line
	6900 3400 6750 3400
Wire Wire Line
	6900 3500 6750 3500
Wire Wire Line
	6900 3600 6750 3600
Wire Bus Line
	6650 2350 6100 2350
Wire Wire Line
	8100 3200 8300 3200
Wire Wire Line
	4400 3800 4900 3800
Wire Wire Line
	4400 3900 4900 3900
Wire Wire Line
	4400 5400 4450 5400
Wire Wire Line
	4400 5500 4450 5500
Wire Wire Line
	2250 3800 3100 3800
Wire Wire Line
	2300 5400 3100 5400
Text GLabel 1950 5300 0    60   Input ~ 0
d[0..7]
Text Notes 2200 5250 0    60   ~ 0
DataBus
Text Notes 6250 2300 0    60   ~ 0
ALUop
Text Notes 9350 4300 0    60   ~ 0
DataBus
Text Label 8250 5200 0    60   ~ 0
d0
Text Label 8250 5100 0    60   ~ 0
d1
Text Label 8250 5000 0    60   ~ 0
d2
Text Label 8250 4900 0    60   ~ 0
d3
Text Label 8250 4800 0    60   ~ 0
d4
Text Label 8250 4700 0    60   ~ 0
d5
Text Label 8250 4600 0    60   ~ 0
d6
Text Label 8250 4500 0    60   ~ 0
d7
Text GLabel 9500 3350 2    60   Output ~ 0
DivByZero
Text GLabel 9550 3800 2    60   Output ~ 0
Overflow
Wire Wire Line
	9550 3950 9200 3950
Wire Wire Line
	9200 3950 9200 4400
Wire Wire Line
	9200 4400 8100 4400
Wire Wire Line
	9550 3800 9150 3800
Wire Wire Line
	9150 3800 9150 4300
Wire Wire Line
	9150 4300 8100 4300
Wire Wire Line
	9500 3650 9100 3650
Wire Wire Line
	8100 4200 9100 4200
Wire Wire Line
	9500 3500 9050 3500
Wire Wire Line
	8100 4100 9050 4100
Wire Wire Line
	9100 4200 9100 3650
Wire Wire Line
	9050 4100 9050 3500
Wire Wire Line
	9500 3350 9000 3350
Wire Wire Line
	9000 3350 9000 4000
Wire Wire Line
	9000 4000 8100 4000
Wire Wire Line
	9500 3150 8900 3150
Wire Wire Line
	8100 3300 8300 3300
Wire Wire Line
	8100 3500 8900 3500
Connection ~ 8300 3300
Wire Wire Line
	8100 3400 8300 3400
Text GLabel 3050 3900 0    60   Input ~ 0
Lo
Text GLabel 3050 5500 0    60   Input ~ 0
Lo
Wire Wire Line
	3050 3900 3100 3900
Wire Wire Line
	3050 5500 3100 5500
Wire Wire Line
	8300 3400 8300 3300
Text GLabel 8300 3600 2    60   Input ~ 0
Lo
Text Notes 850  2300 0    60   ~ 0
The A and B registers can load\nfrom the data bus. Their outputs\nare directly connected to the ALU.\n\nThe ALU also receives the 5-bit ALU\noperation from the instruction\ndecoder logic.\n\nThe ALU outputs the 8-bit\nresult plus five flags that\ndescribe the type of output.\n\nThe ALUresult control line\nenables the ALU output onto\nthe data bus.
Wire Wire Line
	8900 3500 8900 3150
Wire Wire Line
	8100 3600 8300 3600
Wire Wire Line
	8300 3300 8650 3300
$Comp
L Connector:Conn_01x10_Female J7
U 1 1 5CD2E273
P 5450 5950
F 0 "J7" V 5523 5880 50  0000 C CNN
F 1 "Breg Pin Header" V 5614 5880 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x10_P2.54mm_Vertical" H 5450 5950 50  0001 C CNN
F 3 "~" H 5450 5950 50  0001 C CNN
	1    5450 5950
	0    1    1    0   
$EndComp
Wire Wire Line
	5850 5750 5850 4500
Connection ~ 5850 4500
Wire Wire Line
	5850 4500 6900 4500
Wire Wire Line
	5750 5750 5750 4600
Connection ~ 5750 4600
Wire Wire Line
	5750 4600 6900 4600
Wire Wire Line
	5650 5750 5650 4700
Connection ~ 5650 4700
Wire Wire Line
	5650 4700 6900 4700
Wire Wire Line
	4500 5200 5150 5200
Wire Wire Line
	4500 5100 5250 5100
Wire Wire Line
	4500 5000 5350 5000
Wire Wire Line
	4500 4900 5450 4900
Wire Wire Line
	5550 5750 5550 4800
Connection ~ 5550 4800
Wire Wire Line
	5550 4800 6900 4800
Wire Wire Line
	5450 5750 5450 4900
Connection ~ 5450 4900
Wire Wire Line
	5450 4900 6900 4900
Wire Wire Line
	5350 5750 5350 5000
Connection ~ 5350 5000
Wire Wire Line
	5350 5000 6900 5000
Wire Wire Line
	5250 5750 5250 5100
Connection ~ 5250 5100
Wire Wire Line
	5250 5100 6900 5100
Wire Wire Line
	5150 5750 5150 5200
Connection ~ 5150 5200
Wire Wire Line
	5150 5200 6900 5200
NoConn ~ 5050 5750
Wire Wire Line
	4450 5500 4950 5500
Wire Wire Line
	4950 5500 4950 5750
Connection ~ 4450 5500
$Comp
L Connector:Conn_01x10_Female J6
U 1 1 5CD78577
P 4950 2300
F 0 "J6" V 5115 2230 50  0000 C CNN
F 1 "Areg Pin Header" V 5024 2230 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x10_P2.54mm_Vertical" H 4950 2300 50  0001 C CNN
F 3 "~" H 4950 2300 50  0001 C CNN
	1    4950 2300
	0    -1   -1   0   
$EndComp
NoConn ~ 5350 2500
$Comp
L power:GNDREF #PWR0103
U 1 1 5CDA8761
P 5450 2600
F 0 "#PWR0103" H 5450 2350 50  0001 C CNN
F 1 "GNDREF" H 5450 2450 50  0000 C CNN
F 2 "" H 5450 2600 50  0001 C CNN
F 3 "" H 5450 2600 50  0001 C CNN
	1    5450 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 2500 5450 2600
Wire Wire Line
	4500 3600 5250 3600
Wire Wire Line
	4500 3500 5150 3500
Wire Wire Line
	4500 3400 5050 3400
Wire Wire Line
	4500 3300 4950 3300
Wire Wire Line
	4500 3200 4850 3200
Wire Wire Line
	4500 3100 4750 3100
Wire Wire Line
	4500 3000 4650 3000
Wire Wire Line
	4500 2900 4550 2900
Wire Wire Line
	4550 2500 4550 2900
Connection ~ 4550 2900
Wire Wire Line
	4550 2900 6150 2900
Wire Wire Line
	4650 2500 4650 3000
Connection ~ 4650 3000
Wire Wire Line
	4650 3000 6100 3000
Wire Wire Line
	4750 2500 4750 3100
Connection ~ 4750 3100
Wire Wire Line
	4750 3100 6050 3100
Wire Wire Line
	4850 2500 4850 3200
Connection ~ 4850 3200
Wire Wire Line
	4850 3200 6000 3200
Wire Wire Line
	4950 2500 4950 3300
Connection ~ 4950 3300
Wire Wire Line
	4950 3300 5950 3300
Wire Wire Line
	5050 2500 5050 3400
Connection ~ 5050 3400
Wire Wire Line
	5050 3400 5900 3400
Wire Wire Line
	5150 2500 5150 3500
Connection ~ 5150 3500
Wire Wire Line
	5150 3500 5850 3500
Wire Wire Line
	5250 2500 5250 3600
Connection ~ 5250 3600
Wire Wire Line
	5250 3600 5800 3600
Wire Bus Line
	6650 2350 6650 3500
Wire Bus Line
	9300 4100 9300 5100
Wire Bus Line
	2750 3000 2750 5300
$EndSCHEMATC
