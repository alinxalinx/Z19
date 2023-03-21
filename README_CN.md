# Xilinx Zynq Ultrascale+ MPSoC 系列开发板 Z19
## 开发板介绍
### 开发板简介
开发板主要由 ZU19EG + 4 个 DDR4+DDR4 SODIMM + eMMC +2 个 QSPI FLASH
构成。主芯片采用 Xilinx 公司的 Zynq UltraScale+ MPSoCs 系列的芯片，型号为 XCZU19EG-
-2FFVC1760I。在 ZU19EG 芯片的 PS 端和 PL 端分别挂了 4 片 DDR4
和 1 个 260 脚 DDR4 SODIMM 卡槽，PS 端的每片 DDR4 容量高达 2GB，使得 ARM 系统和
FPGA 系统能独立处理和存储的数据的功能。PS 端的 32GB eMMC FLASH 存储芯片和 2 片
512Mb 的 QSPI FLASH 用来静态存储 MPSoCs 的操作系统、文件系统及用户数据。
开发板扩展了丰富的外围接口，其中包含 2 个 FMC 双宽度接口、1 路 M.2 SSD 接口、1
路 PCIE 主模式插槽、4 路 SATA 接口、3 对差分 SMA 接口、1 路 mini_DP 接口、4 路 QSFP28
光纤接口、4 个 USB3.0 接口、2 路千兆以太网接口、3 路 UART 接口、1 路 TF 卡槽、2 路
CAN 总线接口、2 路 RS485 接口和 1 路 MIPI 摄像头接口和一些按键 LED。
### 关键特性
1. 4 片Micron DDR4芯片(ps)，容量为1Gx16bit,型号MT40A1G16KD-062E
2. 1 个260脚DDR4 SODIMM插槽，位于pl端
3. 2 片512MBit的Quad-SPI flash,容量为512M bit，型号MT25QU512ABB1EW9-0SIT
4. 1 片32GB的eMMC FLASH 芯片，型号为Micron的MTFC32GAPALBH-IT
5. 1 路 M.2 接口，PCIEx1(ps),速率6Gbps 
6. 1 路DP输出接口，mini DP(ps)，最高支持4kx2k@30fps输出 
7. 4 路USB3.0接口，usb(ps),速率5.0Gbps,扁型 USB 接口(USB Type A)
8. 2 路千兆以太网接口，jl2121,一路ps，一路pl,rgmii接口 
9. 3 个 uart接口，其中两个通过uart转usb芯片引出，分别连到pl和ps，剩下一路通过1mm间距，10pin的fpc连接器引出
10. 1 个Micro SD 卡座(ps) 
11. 4 路QSFP28光纤接口，速率25Gbps
12. 2 路 CAN 通信接口(ps) 
13. 2 路 485 通信接口(pl) 
14. 1 路mipi接口（pl）,15PIN的FPC连接器，2个lane数据，1对时钟 
15. 2 个FMC HPC扩展口
16. 1 个主模式PCIEx8插槽
17. 4 路SATA接口
18. 3 对差分线，6个SMA接口输出
19. 1 个RTC实时时钟，32.768KHz无源时钟(ps)
20. EEPROM和温度传感器，1片 EEROM 4Kbit(2x256x8bit)(ps)，一片LM75温度芯片(ps)，精度为0.5度 
21. 4 个led灯，1个done指示灯，1个电源，1个pl控制，1个ps控制
22. 3 个按键，1个复位按键 RESET 和 2 个用户按键
23. 1 个四位的拨码开关，板卡支持四种启动模式
24. 尺寸 250mm x 170mm
25. 电源12v/3A

# Z19 例程
## 例程描述
此项目为开发板出厂例程，支持板卡上的大部分外设。
## 开发环境及需求
* Vivado 2020.1
* Z19开发板
## 创建Vivado工程
* 下载最新的ZIP包。
* 创建新的工程文件夹.
* 解压下载的ZIP包到此工程文件夹中。

有两种方法创建Vivado工程，如下所示：
### 利用Vivado tcl console创建Vivado工程
1. 打开Vivado软件并且利用**cd**命令进入"**auto_create_project**"目录，并回车
```
cd \<archive extracted location\>/vivado/auto_create_project
```
2. 输入 **source ./create_project.tcl** 并且回车
```
source ./create_project.tcl
```

### 利用bat创建Vivado工程
1. 在 "**auto_create_project**" 文件夹, 有个 "**create_project.bat**"文件, 右键以编辑模式打开，并且修改vivado路径为本主机vivado安装路径，保存并关闭。
```
CALL E:\XilinxVitis\Vivado\2020.1\bin\vivado.bat -mode batch -source create_project.tcl
PAUSE
```
2. 在Windows下双击bat文件即可。


更多信息, 请访问[ALINX网站] (https://www.alinx.com)
