set_property PACKAGE_PIN P15    [get_ports  {adc_dataIn}];

set_property PACKAGE_PIN N11    [get_ports  {mclk}];

set_property PACKAGE_PIN P13    [get_ports  {bclk}];

set_property PACKAGE_PIN P14    [get_ports  {lrclk}];

set_property PACKAGE_PIN R8     [get_ports  {Outputz[0]}];
set_property PACKAGE_PIN P8     [get_ports  {Outputz[1]}];
set_property PACKAGE_PIN P9     [get_ports  {Outputz[2]}];
set_property PACKAGE_PIN R7     [get_ports  {Outputz[3]}];
set_property PACKAGE_PIN N7     [get_ports  {Outputz[4]}];
set_property PACKAGE_PIN R10    [get_ports  {Outputz[5]}];
set_property PACKAGE_PIN P10    [get_ports  {Outputz[6]}];
set_property PACKAGE_PIN N8     [get_ports  {Outputz[7]}];
set_property PACKAGE_PIN M9     [get_ports  {Outputz[8]}];
set_property PACKAGE_PIN N9     [get_ports  {Outputz[9]}];
set_property PACKAGE_PIN M10    [get_ports  {Outputz[10]}];
set_property PACKAGE_PIN M11    [get_ports  {Outputz[11]}];
set_property PACKAGE_PIN R11    [get_ports  {Outputz[12]}];
set_property PACKAGE_PIN P11    [get_ports  {Outputz[13]}];
set_property PACKAGE_PIN L15    [get_ports  {Outputz[14]}];
set_property PACKAGE_PIN M15    [get_ports  {Outputz[15]}];

# Set the bank voltage for IO Bank 34 to 3.3V
set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 34]];

# Set the bank voltage for IO Bank 35 to 3.3V
set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 35]];