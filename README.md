# Xilinx Zynq Ultrascale+ MPSoC Series Development Board Z19\
## Introduction to Development Board
The development board mainly consists of ZU19EG+4 DDR4+DDR4 SODIMMs+eMMC+2 QSPI FLASH
Composition. The main chip is a Zynq UltraScale+MPSoCs series chip from Xilinx Company, with a model of XCZU19EG-
-2FFVC1760I。 Four DDR4 chips are attached to the PS terminal and the PL terminal of the ZU19EG chip
And a 260 pin DDR4 SODIMM card slot, with a PS side DDR4 capacity of up to 2GB per chip, enabling the ARM system and
The ability of an FPGA system to independently process and store data. 32GB eMMC FLASH memory chip and 2 chips on the PS side
The 512Mb QSPI FLASH is used to statically store the operating system, file system, and user data of MPSoCs.
The development board has extended a variety of peripheral interfaces, including two FMC dual width interfaces, one M.2 SSD interface, and one
PCIE main mode slot, 4-way SATA interface, 3-pair differential SMA interface, 1-way mini_ DP interface, 4-way QSFP28
Optical fiber interface, 4 USB 3.0 interfaces, 2 Gigabit Ethernet interfaces, 3 UART interfaces, 1 TF card slot, 2 channels
CAN bus interface, 2-way RS485 interface, 1-way MIPI camera interface, and some key LEDs.
## Key Features
1. Four Micron DDR4 chips (ps) with a capacity of 1Gx16bit and a model of MT40A1G16KD-062E
2. One 260 pin DDR4 SODIMM slot on the pl end
3. Two 512Mbit Quad-SPI flash drives with a capacity of 512Mbit and a model of MT25QU512ABB1EW9-0SIT
4. One 32GB eMMC FLASH chip with the model of Micron's MTFC32GAPALBH-IT
5. 1-way M.2 interface, PCIEx1 (ps), speed 6Gbps
6. 1-channel DP output interface, mini DP (ps), maximum support 4kx2k@30fps Output
7. 4-way USB 3.0 interface, USB (ps), speed 5.0Gbps, flat USB interface (USB Type A)
8. 2-way Gigabit Ethernet interface, jl2121, 1-way ps, 1-way pl, rgmii interface
9. Three uart interfaces, two of which are led out through uart to usb chips, respectively connected to pl and ps, and the remaining one is led out through a 1 mm spacing, 10 pin fpc connector
10. 1 Micro SD card holder (ps)
11. 4-way QSFP28 optical fiber interface with a speed of 25Gbps
12. 2-way CAN communication interface (ps)
13. 2-way 485 communication interface (PL)
14. 1-way mipi interface (pl), 15PIN FPC connector, 2 lane data, 1 pair of clocks
15. Two FMC HPC expansion ports
16. 1 main mode PCIEx8 slot
17. 4-way SATA interface
18. 3 pairs of differential lines, 6 SMA interface outputs
19. 1 RTC real-time clock, 32.768KHz passive clock (ps)
20. EEPROM and temperature sensor, one EEROM 4Kbit (2x256x8bit) (ps), one LM75 temperature chip (ps), with an accuracy of 0.5 degrees
21. Four LED lights, one Done indicator light, one power supply, one PL control, and one PS control
22. Three buttons, one reset button RESET, and two user buttons
23. One 4-bit dial switch, and the board supports four startup modes
24. Size 250mm x 170mm
25. Power supply 12v/3A
# Z19 Demo Project
## Description
This is vivado factory demo project for ALINX board.
## Requirement
* Vivado 2020.1
* Z19 Development Board
## Create Vivado Project
* Download recent release ZIP archive.
* Create new project folder.
* Extract the download ZIP to the new project folder.

There are two methods to create vivado project as below:
### Create Vivado Project in Vivado tcl console
1. Open Vivado software and switch to "**auto_create_project**" path with **cd** command and **Enter**
```
cd \<archive extracted location\>/vivado/auto_create_project
```
2. Type **source ./create_project.tcl** and **Enter**
```
source ./create_project.tcl
```

### Create Vivado Project using bat
1. In "**auto_create_project**" folder, there is "**create_project.bat**", open it in edit mode, and change to your own vivado software installation path. Save and close.
```
CALL E:\XilinxVitis\Vivado\2020.1\bin\vivado.bat -mode batch -source create_project.tcl
PAUSE
```
2. Double click bat file in Windows environment


For more information, please post on the [ALINX Website] (https://www.alinx.com/en).
