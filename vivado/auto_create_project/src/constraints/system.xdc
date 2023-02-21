set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]

set_property PACKAGE_PIN C5 [get_ports {fan_tri_o[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {fan_tri_o[0]}]

set_property IOSTANDARD DIFF_SSTL12 [get_ports sys_clk_p]
set_property PACKAGE_PIN H24 [get_ports sys_clk_p]
create_clock -period 5.000 -name sys_clk_clk_p -waveform {0.000 2.500} [get_ports sys_clk_p]

set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins design_1_i/axi_ethernet_0_refclk/inst/mmcme4_adv_inst/CLKOUT1]] -group [get_clocks mdio0_mdc_clock]