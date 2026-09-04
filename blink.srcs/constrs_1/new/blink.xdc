## Zybo Z7 constrains file
## project blink

# Clock signal
set_property -dict { PACKAGE_PIN K17 IOSTANDARD LVCMOS33 } \
    [get_ports { CLK }]
create_clock -add \
    -name sys_clk_pin \
    -period 8.00 \
    -waveform {0 4} [get_ports { CLK }]
    
# Reset
set_property -dict { PACKAGE_PIN Y16 IOSTANDARD LVCMOS33 } \
    [get_ports { RST }]

# RGB LED
# R
set_property -dict { PACKAGE_PIN V16 IOSTANDARD LVCMOS33 } \
    [get_ports { LED_RGB[2] }]
# G
set_property -dict { PACKAGE_PIN F17 IOSTANDARD LVCMOS33 } \
    [get_ports { LED_RGB[1] }]
# B
set_property -dict { PACKAGE_PIN M17 IOSTANDARD LVCMOS33 } \
    [get_ports { LED_RGB[0] }]
