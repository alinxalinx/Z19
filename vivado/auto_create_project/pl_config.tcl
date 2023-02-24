  # Create interface ports
  set RS485_0_DE [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 RS485_0_DE ]

  set RS485_1_DE [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 RS485_1_DE ]

  set cam_i2c [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 cam_i2c ]

  set fan [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 fan ]

  set mdio [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:mdio_rtl:1.0 mdio ]

  set mipi_phy_if [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:mipi_phy_rtl:1.0 mipi_phy_if ]

  set pl_key [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 pl_key ]

  set pl_led [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 pl_led ]

  set rgmii [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:rgmii_rtl:1.0 rgmii ]

  set sys [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 sys ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {200000000} \
   ] $sys


  # Create ports
  set RS485_0_rxd [ create_bd_port -dir I RS485_0_rxd ]
  set RS485_0_txd [ create_bd_port -dir O RS485_0_txd ]
  set RS485_1_rxd [ create_bd_port -dir I RS485_1_rxd ]
  set RS485_1_txd [ create_bd_port -dir O RS485_1_txd ]
  set cam_gpio [ create_bd_port -dir O -from 0 -to 0 cam_gpio ]
  set phy_reset_n [ create_bd_port -dir O -from 0 -to 0 -type rst phy_reset_n ]
  set uart_rxd [ create_bd_port -dir I uart_rxd ]
  set uart_txd [ create_bd_port -dir O uart_txd ]

  # Create instance: RS458_DE0, and set properties
  set RS458_DE0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 RS458_DE0 ]
  set_property -dict [ list \
   CONFIG.C_ALL_OUTPUTS {1} \
   CONFIG.C_GPIO_WIDTH {1} \
 ] $RS458_DE0

  # Create instance: RS458_DE1, and set properties
  set RS458_DE1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 RS458_DE1 ]
  set_property -dict [ list \
   CONFIG.C_ALL_OUTPUTS {1} \
   CONFIG.C_GPIO_WIDTH {1} \
 ] $RS458_DE1

  # Create instance: axi_ethernet_0_refclk, and set properties
  set axi_ethernet_0_refclk [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 axi_ethernet_0_refclk ]
  set_property -dict [ list \
   CONFIG.CLKIN1_JITTER_PS {50.0} \
   CONFIG.CLKOUT1_JITTER {93.602} \
   CONFIG.CLKOUT1_PHASE_ERROR {83.901} \
   CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {200} \
   CONFIG.CLKOUT2_JITTER {82.875} \
   CONFIG.CLKOUT2_PHASE_ERROR {83.901} \
   CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {375} \
   CONFIG.CLKOUT2_USED {true} \
   CONFIG.CLKOUT3_JITTER {98.146} \
   CONFIG.CLKOUT3_PHASE_ERROR {89.971} \
   CONFIG.CLKOUT3_REQUESTED_OUT_FREQ {100.000} \
   CONFIG.CLKOUT3_USED {false} \
   CONFIG.CLKOUT4_JITTER {112.316} \
   CONFIG.CLKOUT4_PHASE_ERROR {89.971} \
   CONFIG.CLKOUT4_USED {false} \
   CONFIG.MMCM_CLKFBOUT_MULT_F {5.625} \
   CONFIG.MMCM_CLKIN1_PERIOD {5.000} \
   CONFIG.MMCM_CLKIN2_PERIOD {10.0} \
   CONFIG.MMCM_CLKOUT0_DIVIDE_F {5.625} \
   CONFIG.MMCM_CLKOUT1_DIVIDE {3} \
   CONFIG.MMCM_CLKOUT2_DIVIDE {1} \
   CONFIG.MMCM_CLKOUT3_DIVIDE {1} \
   CONFIG.NUM_OUT_CLKS {2} \
   CONFIG.PRIM_IN_FREQ {200.000} \
   CONFIG.PRIM_SOURCE {No_buffer} \
   CONFIG.USE_RESET {false} \
 ] $axi_ethernet_0_refclk

  # Create instance: axi_interconnect_1, and set properties
  set axi_interconnect_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_1 ]
  set_property -dict [ list \
   CONFIG.NUM_MI {1} \
 ] $axi_interconnect_1

  # Create instance: axi_uart16550_0, and set properties
  set axi_uart16550_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uart16550:2.0 axi_uart16550_0 ]
  set_property -dict [ list \
   CONFIG.C_S_AXI_ACLK_FREQ_HZ {200000000} \
 ] $axi_uart16550_0

  # Create instance: axi_uart16550_1, and set properties
  set axi_uart16550_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uart16550:2.0 axi_uart16550_1 ]
  set_property -dict [ list \
   CONFIG.C_S_AXI_ACLK_FREQ_HZ {200000000} \
 ] $axi_uart16550_1

  # Create instance: axis_subset_converter_0, and set properties
  set axis_subset_converter_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_subset_converter:1.1 axis_subset_converter_0 ]
  set_property -dict [ list \
   CONFIG.M_HAS_TLAST {1} \
   CONFIG.M_TDATA_NUM_BYTES {6} \
   CONFIG.M_TUSER_WIDTH {1} \
   CONFIG.S_HAS_TLAST {1} \
   CONFIG.S_TDATA_NUM_BYTES {4} \
   CONFIG.S_TUSER_WIDTH {1} \
   CONFIG.TDATA_REMAP {16'b0000000000000000,tdata[31:0]} \
   CONFIG.TDEST_REMAP {1'b0} \
   CONFIG.TLAST_REMAP {tlast[0]} \
   CONFIG.TUSER_REMAP {tuser[0:0]} \
 ] $axis_subset_converter_0

  # Create instance: csc_rst_gpio, and set properties
  set csc_rst_gpio [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 csc_rst_gpio ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {8} \
   CONFIG.DIN_TO {8} \
   CONFIG.DIN_WIDTH {95} \
   CONFIG.DOUT_WIDTH {1} \
 ] $csc_rst_gpio

  # Create instance: fan_gpio, and set properties
  set fan_gpio [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 fan_gpio ]
  set_property -dict [list \
   CONFIG.C_GPIO_WIDTH {1} \
   CONFIG.C_ALL_OUTPUTS {1} \
   ] $fan_gpio
  # Create instance: frmbuf_wr_rst_gpio, and set properties
  set frmbuf_wr_rst_gpio [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 frmbuf_wr_rst_gpio ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {7} \
   CONFIG.DIN_TO {7} \
   CONFIG.DIN_WIDTH {95} \
   CONFIG.DOUT_WIDTH {1} \
 ] $frmbuf_wr_rst_gpio

  # Create instance: gmii_to_rgmii_0, and set properties
  set gmii_to_rgmii_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:gmii_to_rgmii:4.1 gmii_to_rgmii_0 ]
  set_property -dict [ list \
   CONFIG.C_EXTERNAL_CLOCK {false} \
   CONFIG.RGMII_TXC_SKEW {2} \
   CONFIG.SupportLevel {Include_Shared_Logic_in_Core} \
 ] $gmii_to_rgmii_0

  # Create instance: mipi_csi2_rx_subsyst_0, and set properties
  set mipi_csi2_rx_subsyst_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mipi_csi2_rx_subsystem:5.0 mipi_csi2_rx_subsyst_0 ]
  set_property -dict [ list \
   CONFIG.CLK_LANE_IO_LOC {H15} \
   CONFIG.CMN_NUM_LANES {2} \
   CONFIG.CMN_NUM_PIXELS {2} \
   CONFIG.CMN_PXL_FORMAT {YUV422_8bit} \
   CONFIG.C_CLK_LANE_IO_POSITION {13} \
   CONFIG.C_DATA_LANE0_IO_POSITION {15} \
   CONFIG.C_DATA_LANE1_IO_POSITION {17} \
   CONFIG.C_DPHY_LANES {2} \
   CONFIG.C_EN_BG0_PIN0 {false} \
   CONFIG.C_HS_LINE_RATE {1000} \
   CONFIG.C_HS_SETTLE_NS {145} \
   CONFIG.DATA_LANE0_IO_LOC {J16} \
   CONFIG.DATA_LANE1_IO_LOC {J18} \
   CONFIG.DPY_LINE_RATE {1000} \
   CONFIG.HP_IO_BANK_SELECTION {68} \
   CONFIG.SupportLevel {1} \
 ] $mipi_csi2_rx_subsyst_0

  # Create instance: pl_key, and set properties
  set pl_key [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 pl_key ]
  set_property -dict [ list \
   CONFIG.C_ALL_INPUTS {1} \
   CONFIG.C_GPIO_WIDTH {1} \
   CONFIG.C_INTERRUPT_PRESENT {1} \
 ] $pl_key

  # Create instance: pl_led, and set properties
  set pl_led [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 pl_led ]
  set_property -dict [ list \
   CONFIG.C_ALL_OUTPUTS {1} \
   CONFIG.C_GPIO_WIDTH {1} \
 ] $pl_led

  # Create instance: pl_uart16550, and set properties
  set pl_uart16550 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uart16550:2.0 pl_uart16550 ]
  set_property -dict [ list \
   CONFIG.C_S_AXI_ACLK_FREQ_HZ {200000000} \
 ] $pl_uart16550

  # Create instance: ps8_0_axi_periph_1, and set properties
  set ps8_0_axi_periph_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 ps8_0_axi_periph_1 ]
  set_property -dict [ list \
   CONFIG.NUM_MI {11} \
 ] $ps8_0_axi_periph_1

  # Create instance: rst_mipi_375M, and set properties
  set rst_mipi_375M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_mipi_375M ]

  # Create instance: rst_ps8_0_200M, and set properties
  set rst_ps8_0_200M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_ps8_0_200M ]

  # Create instance: util_ds_buf_0, and set properties
  set util_ds_buf_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.1 util_ds_buf_0 ]
  set_property -dict [ list \
   CONFIG.C_BUF_TYPE {IBUFDS} \
 ] $util_ds_buf_0

  # Create instance: util_ds_buf_1, and set properties
  set util_ds_buf_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.1 util_ds_buf_1 ]
  set_property -dict [ list \
   CONFIG.C_BUF_TYPE {BUFG} \
 ] $util_ds_buf_1

  # Create instance: v_frmbuf_wr_0, and set properties
  set v_frmbuf_wr_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:v_frmbuf_wr:2.1 v_frmbuf_wr_0 ]
  set_property -dict [ list \
   CONFIG.HAS_UYVY8 {1} \
   CONFIG.HAS_YUYV8 {1} \
   CONFIG.HAS_Y_UV8 {1} \
   CONFIG.MAX_COLS {1920} \
   CONFIG.MAX_NR_PLANES {2} \
   CONFIG.MAX_ROWS {1080} \
 ] $v_frmbuf_wr_0

  # Create instance: v_proc_ss_0, and set properties
  set v_proc_ss_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:v_proc_ss:2.2 v_proc_ss_0 ]
  set_property -dict [ list \
   CONFIG.C_COLORSPACE_SUPPORT {1} \
   CONFIG.C_MAX_COLS {1920} \
   CONFIG.C_MAX_DATA_WIDTH {8} \
   CONFIG.C_MAX_ROWS {1080} \
   CONFIG.C_TOPOLOGY {3} \
 ] $v_proc_ss_0

  # Create instance: xlconcat_0, and set properties
  set xlconcat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0 ]
  set_property -dict [ list \
   CONFIG.NUM_PORTS {6} \
 ] $xlconcat_0

  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
 ] $xlconstant_1

  # Create instance: xlconstant_2, and set properties
  set xlconstant_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_2 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {1} \
 ] $xlconstant_2

  # Create instance: xlconstant_3, and set properties
  set xlconstant_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_3 ]


  # Create interface connections
  connect_bd_intf_net -intf_net CLK_IN_D_0_1 [get_bd_intf_ports sys] [get_bd_intf_pins util_ds_buf_0/CLK_IN_D]
  connect_bd_intf_net -intf_net RS458_DE0_GPIO [get_bd_intf_ports RS485_0_DE] [get_bd_intf_pins RS458_DE0/GPIO]
  connect_bd_intf_net -intf_net RS458_DE1_GPIO [get_bd_intf_ports RS485_1_DE] [get_bd_intf_pins RS458_DE1/GPIO]
  connect_bd_intf_net -intf_net axi_interconnect_1_M00_AXI [get_bd_intf_pins axi_interconnect_1/M00_AXI] [get_bd_intf_pins zynq_ultra_ps_e_0/S_AXI_HP0_FPD]
  connect_bd_intf_net -intf_net axis_subset_converter_0_M_AXIS [get_bd_intf_pins axis_subset_converter_0/M_AXIS] [get_bd_intf_pins v_proc_ss_0/s_axis]
  connect_bd_intf_net -intf_net fan_gpio_GPIO [get_bd_intf_ports fan] [get_bd_intf_pins fan_gpio/GPIO]
  connect_bd_intf_net -intf_net gmii_to_rgmii_0_MDIO_PHY [get_bd_intf_ports mdio] [get_bd_intf_pins gmii_to_rgmii_0/MDIO_PHY]
  connect_bd_intf_net -intf_net gmii_to_rgmii_0_RGMII [get_bd_intf_ports rgmii] [get_bd_intf_pins gmii_to_rgmii_0/RGMII]
  connect_bd_intf_net -intf_net mipi_csi2_rx_subsyst_0_video_out [get_bd_intf_pins axis_subset_converter_0/S_AXIS] [get_bd_intf_pins mipi_csi2_rx_subsyst_0/video_out]
  connect_bd_intf_net -intf_net mipi_phy_if_0_1 [get_bd_intf_ports mipi_phy_if] [get_bd_intf_pins mipi_csi2_rx_subsyst_0/mipi_phy_if]
  connect_bd_intf_net -intf_net pl_key_GPIO [get_bd_intf_ports pl_key] [get_bd_intf_pins pl_key/GPIO]
  connect_bd_intf_net -intf_net pl_led_GPIO [get_bd_intf_ports pl_led] [get_bd_intf_pins pl_led/GPIO]
  connect_bd_intf_net -intf_net ps8_0_axi_periph_1_M00_AXI [get_bd_intf_pins fan_gpio/S_AXI] [get_bd_intf_pins ps8_0_axi_periph_1/M00_AXI]
  connect_bd_intf_net -intf_net ps8_0_axi_periph_1_M01_AXI [get_bd_intf_pins RS458_DE1/S_AXI] [get_bd_intf_pins ps8_0_axi_periph_1/M01_AXI]
  connect_bd_intf_net -intf_net ps8_0_axi_periph_1_M02_AXI [get_bd_intf_pins axi_uart16550_0/S_AXI] [get_bd_intf_pins ps8_0_axi_periph_1/M02_AXI]
  connect_bd_intf_net -intf_net ps8_0_axi_periph_1_M03_AXI [get_bd_intf_pins axi_uart16550_1/S_AXI] [get_bd_intf_pins ps8_0_axi_periph_1/M03_AXI]
  connect_bd_intf_net -intf_net ps8_0_axi_periph_1_M04_AXI [get_bd_intf_pins pl_uart16550/S_AXI] [get_bd_intf_pins ps8_0_axi_periph_1/M04_AXI]
  connect_bd_intf_net -intf_net ps8_0_axi_periph_1_M05_AXI [get_bd_intf_pins mipi_csi2_rx_subsyst_0/csirxss_s_axi] [get_bd_intf_pins ps8_0_axi_periph_1/M05_AXI]
  connect_bd_intf_net -intf_net ps8_0_axi_periph_1_M06_AXI [get_bd_intf_pins pl_key/S_AXI] [get_bd_intf_pins ps8_0_axi_periph_1/M06_AXI]
  connect_bd_intf_net -intf_net ps8_0_axi_periph_1_M07_AXI [get_bd_intf_pins pl_led/S_AXI] [get_bd_intf_pins ps8_0_axi_periph_1/M07_AXI]
  connect_bd_intf_net -intf_net ps8_0_axi_periph_1_M08_AXI [get_bd_intf_pins RS458_DE0/S_AXI] [get_bd_intf_pins ps8_0_axi_periph_1/M08_AXI]
  connect_bd_intf_net -intf_net ps8_0_axi_periph_1_M09_AXI [get_bd_intf_pins ps8_0_axi_periph_1/M09_AXI] [get_bd_intf_pins v_frmbuf_wr_0/s_axi_CTRL]
  connect_bd_intf_net -intf_net ps8_0_axi_periph_1_M10_AXI [get_bd_intf_pins ps8_0_axi_periph_1/M10_AXI] [get_bd_intf_pins v_proc_ss_0/s_axi_ctrl]
  connect_bd_intf_net -intf_net v_frmbuf_wr_0_m_axi_mm_video [get_bd_intf_pins axi_interconnect_1/S00_AXI] [get_bd_intf_pins v_frmbuf_wr_0/m_axi_mm_video]
  connect_bd_intf_net -intf_net v_proc_ss_0_m_axis [get_bd_intf_pins v_frmbuf_wr_0/s_axis_video] [get_bd_intf_pins v_proc_ss_0/m_axis]
  connect_bd_intf_net -intf_net zynq_ultra_ps_e_0_GMII_ENET0 [get_bd_intf_pins gmii_to_rgmii_0/GMII] [get_bd_intf_pins zynq_ultra_ps_e_0/GMII_ENET0]
  connect_bd_intf_net -intf_net zynq_ultra_ps_e_0_IIC_0 [get_bd_intf_ports cam_i2c] [get_bd_intf_pins zynq_ultra_ps_e_0/IIC_0]
  connect_bd_intf_net -intf_net zynq_ultra_ps_e_0_MDIO_ENET0 [get_bd_intf_pins gmii_to_rgmii_0/MDIO_GEM] [get_bd_intf_pins zynq_ultra_ps_e_0/MDIO_ENET0]
  connect_bd_intf_net -intf_net zynq_ultra_ps_e_0_M_AXI_HPM0_LPD [get_bd_intf_pins ps8_0_axi_periph_1/S00_AXI] [get_bd_intf_pins zynq_ultra_ps_e_0/M_AXI_HPM0_LPD]

  # Create port connections
  connect_bd_net -net Net [get_bd_pins gmii_to_rgmii_0/rx_reset] [get_bd_pins gmii_to_rgmii_0/tx_reset] [get_bd_pins rst_mipi_375M/peripheral_reset]
  connect_bd_net -net Net2 [get_bd_pins csc_rst_gpio/Din] [get_bd_pins frmbuf_wr_rst_gpio/Din] [get_bd_pins zynq_ultra_ps_e_0/emio_gpio_o]
  connect_bd_net -net axi_ethernet_0_refclk_clk_out1 [get_bd_pins RS458_DE0/s_axi_aclk] [get_bd_pins RS458_DE1/s_axi_aclk] [get_bd_pins axi_ethernet_0_refclk/clk_out1] [get_bd_pins axi_interconnect_1/ACLK] [get_bd_pins axi_interconnect_1/M00_ACLK] [get_bd_pins axi_interconnect_1/S00_ACLK] [get_bd_pins axi_uart16550_0/s_axi_aclk] [get_bd_pins axi_uart16550_1/s_axi_aclk] [get_bd_pins axis_subset_converter_0/aclk] [get_bd_pins fan_gpio/s_axi_aclk] [get_bd_pins mipi_csi2_rx_subsyst_0/dphy_clk_200M] [get_bd_pins mipi_csi2_rx_subsyst_0/lite_aclk] [get_bd_pins mipi_csi2_rx_subsyst_0/video_aclk] [get_bd_pins pl_key/s_axi_aclk] [get_bd_pins pl_led/s_axi_aclk] [get_bd_pins pl_uart16550/s_axi_aclk] [get_bd_pins ps8_0_axi_periph_1/ACLK] [get_bd_pins ps8_0_axi_periph_1/M00_ACLK] [get_bd_pins ps8_0_axi_periph_1/M01_ACLK] [get_bd_pins ps8_0_axi_periph_1/M02_ACLK] [get_bd_pins ps8_0_axi_periph_1/M03_ACLK] [get_bd_pins ps8_0_axi_periph_1/M04_ACLK] [get_bd_pins ps8_0_axi_periph_1/M05_ACLK] [get_bd_pins ps8_0_axi_periph_1/M06_ACLK] [get_bd_pins ps8_0_axi_periph_1/M07_ACLK] [get_bd_pins ps8_0_axi_periph_1/M08_ACLK] [get_bd_pins ps8_0_axi_periph_1/M09_ACLK] [get_bd_pins ps8_0_axi_periph_1/M10_ACLK] [get_bd_pins ps8_0_axi_periph_1/S00_ACLK] [get_bd_pins rst_ps8_0_200M/slowest_sync_clk] [get_bd_pins v_frmbuf_wr_0/ap_clk] [get_bd_pins v_proc_ss_0/aclk] [get_bd_pins zynq_ultra_ps_e_0/maxihpm0_lpd_aclk] [get_bd_pins zynq_ultra_ps_e_0/saxihp0_fpd_aclk]
  connect_bd_net -net axi_ethernet_0_refclk_clk_out2 [get_bd_pins axi_ethernet_0_refclk/clk_out2] [get_bd_pins gmii_to_rgmii_0/clkin] [get_bd_pins rst_mipi_375M/slowest_sync_clk]
  connect_bd_net -net axi_uart16550_0_ip2intc_irpt [get_bd_pins axi_uart16550_0/ip2intc_irpt] [get_bd_pins xlconcat_0/In4]
  connect_bd_net -net axi_uart16550_0_sout [get_bd_ports RS485_0_txd] [get_bd_pins axi_uart16550_0/sout]
  connect_bd_net -net axi_uart16550_1_ip2intc_irpt [get_bd_pins axi_uart16550_1/ip2intc_irpt] [get_bd_pins xlconcat_0/In3]
  connect_bd_net -net axi_uart16550_1_sout [get_bd_ports RS485_1_txd] [get_bd_pins axi_uart16550_1/sout]
  connect_bd_net -net axi_uart16550_3_sout [get_bd_ports uart_txd] [get_bd_pins pl_uart16550/sout]
  connect_bd_net -net csc_rst_gpio_Dout [get_bd_pins csc_rst_gpio/Dout] [get_bd_pins ps8_0_axi_periph_1/M10_ARESETN] [get_bd_pins v_proc_ss_0/aresetn]
  connect_bd_net -net frmbuf_wr_rst_gpio_Dout [get_bd_pins axis_subset_converter_0/aresetn] [get_bd_pins frmbuf_wr_rst_gpio/Dout] [get_bd_pins ps8_0_axi_periph_1/M09_ARESETN] [get_bd_pins v_frmbuf_wr_0/ap_rst_n]
  connect_bd_net -net mipi_csi2_rx_subsyst_0_csirxss_csi_irq [get_bd_pins mipi_csi2_rx_subsyst_0/csirxss_csi_irq] [get_bd_pins xlconcat_0/In0]
  connect_bd_net -net pl_key_ip2intc_irpt [get_bd_pins pl_key/ip2intc_irpt] [get_bd_pins xlconcat_0/In2]
  connect_bd_net -net pl_uart16550_ip2intc_irpt [get_bd_pins pl_uart16550/ip2intc_irpt] [get_bd_pins xlconcat_0/In5]
  connect_bd_net -net rst_mipi_375M_peripheral_aresetn [get_bd_ports phy_reset_n] [get_bd_pins rst_mipi_375M/peripheral_aresetn]
  connect_bd_net -net rst_ps8_0_150M_interconnect_aresetn [get_bd_pins axi_interconnect_1/ARESETN] [get_bd_pins ps8_0_axi_periph_1/ARESETN] [get_bd_pins rst_ps8_0_200M/interconnect_aresetn]
  connect_bd_net -net rst_ps8_0_150M_peripheral_aresetn [get_bd_pins RS458_DE0/s_axi_aresetn] [get_bd_pins RS458_DE1/s_axi_aresetn] [get_bd_pins axi_interconnect_1/M00_ARESETN] [get_bd_pins axi_interconnect_1/S00_ARESETN] [get_bd_pins axi_uart16550_0/s_axi_aresetn] [get_bd_pins axi_uart16550_1/s_axi_aresetn] [get_bd_pins fan_gpio/s_axi_aresetn] [get_bd_pins mipi_csi2_rx_subsyst_0/lite_aresetn] [get_bd_pins mipi_csi2_rx_subsyst_0/video_aresetn] [get_bd_pins pl_key/s_axi_aresetn] [get_bd_pins pl_led/s_axi_aresetn] [get_bd_pins pl_uart16550/s_axi_aresetn] [get_bd_pins ps8_0_axi_periph_1/M00_ARESETN] [get_bd_pins ps8_0_axi_periph_1/M01_ARESETN] [get_bd_pins ps8_0_axi_periph_1/M02_ARESETN] [get_bd_pins ps8_0_axi_periph_1/M03_ARESETN] [get_bd_pins ps8_0_axi_periph_1/M04_ARESETN] [get_bd_pins ps8_0_axi_periph_1/M05_ARESETN] [get_bd_pins ps8_0_axi_periph_1/M06_ARESETN] [get_bd_pins ps8_0_axi_periph_1/M07_ARESETN] [get_bd_pins ps8_0_axi_periph_1/M08_ARESETN] [get_bd_pins ps8_0_axi_periph_1/S00_ARESETN] [get_bd_pins rst_ps8_0_200M/peripheral_aresetn]
  connect_bd_net -net sin_0_1 [get_bd_ports RS485_0_rxd] [get_bd_pins axi_uart16550_0/sin]
  connect_bd_net -net sin_0_2 [get_bd_ports RS485_1_rxd] [get_bd_pins axi_uart16550_1/sin]
  connect_bd_net -net sin_0_3 [get_bd_ports uart_rxd] [get_bd_pins pl_uart16550/sin]
  connect_bd_net -net util_ds_buf_0_IBUF_OUT [get_bd_pins axi_ethernet_0_refclk/clk_in1] [get_bd_pins util_ds_buf_1/BUFG_O]
  connect_bd_net -net util_ds_buf_0_IBUF_OUT1 [get_bd_pins util_ds_buf_0/IBUF_OUT] [get_bd_pins util_ds_buf_1/BUFG_I]
  connect_bd_net -net v_frmbuf_wr_0_interrupt [get_bd_pins v_frmbuf_wr_0/interrupt] [get_bd_pins xlconcat_0/In1]
  connect_bd_net -net xlconcat_0_dout [get_bd_pins xlconcat_0/dout] [get_bd_pins zynq_ultra_ps_e_0/pl_ps_irq0]
  connect_bd_net -net xlconstant_1_dout [get_bd_pins axi_uart16550_0/dcdn] [get_bd_pins axi_uart16550_0/dsrn] [get_bd_pins axi_uart16550_0/freeze] [get_bd_pins axi_uart16550_1/dcdn] [get_bd_pins axi_uart16550_1/dsrn] [get_bd_pins axi_uart16550_1/freeze] [get_bd_pins pl_uart16550/dcdn] [get_bd_pins pl_uart16550/dsrn] [get_bd_pins pl_uart16550/freeze] [get_bd_pins xlconstant_1/dout]
  connect_bd_net -net xlconstant_2_dout [get_bd_pins axi_uart16550_0/ctsn] [get_bd_pins axi_uart16550_0/rin] [get_bd_pins axi_uart16550_1/ctsn] [get_bd_pins axi_uart16550_1/rin] [get_bd_pins pl_uart16550/ctsn] [get_bd_pins pl_uart16550/rin] [get_bd_pins xlconstant_2/dout]
  connect_bd_net -net xlconstant_3_dout [get_bd_ports cam_gpio] [get_bd_pins xlconstant_3/dout]
  connect_bd_net -net zynq_ultra_ps_e_0_pl_resetn0 [get_bd_pins rst_mipi_375M/ext_reset_in] [get_bd_pins rst_ps8_0_200M/ext_reset_in] [get_bd_pins zynq_ultra_ps_e_0/pl_resetn0]


  assign_bd_address