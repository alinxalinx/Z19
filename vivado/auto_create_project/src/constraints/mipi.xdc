
set_property PACKAGE_PIN F12 [get_ports {cam_gpio[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cam_gpio[0]}]
set_property PULLUP true [get_ports {cam_gpio[0]}]

set_property PACKAGE_PIN E10 [get_ports cam_i2c_scl_io]
set_property PACKAGE_PIN E11 [get_ports cam_i2c_sda_io]

set_property IOSTANDARD LVCMOS33 [get_ports cam_i2c_scl_io]
set_property IOSTANDARD LVCMOS33 [get_ports cam_i2c_sda_io]

set_property PULLUP true [get_ports cam_i2c_scl_io]
set_property PULLUP true [get_ports cam_i2c_sda_io]
