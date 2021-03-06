# This file is automatically generated.
# It contains project source information necessary for synthesis and implementation.

# XDC: new/constraint.xdc

# Block Designs: bd/Z_system/Z_system.bd
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==Z_system || ORIG_REF_NAME==Z_system} -quiet] -quiet

# IP: bd/Z_system/ip/Z_system_processing_system7_0_0/Z_system_processing_system7_0_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==Z_system_processing_system7_0_0 || ORIG_REF_NAME==Z_system_processing_system7_0_0} -quiet] -quiet

# IP: bd/Z_system/ip/Z_system_axi_mem_intercon_0/Z_system_axi_mem_intercon_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==Z_system_axi_mem_intercon_0 || ORIG_REF_NAME==Z_system_axi_mem_intercon_0} -quiet] -quiet

# IP: bd/Z_system/ip/Z_system_rst_ps7_0_50M_0/Z_system_rst_ps7_0_50M_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==Z_system_rst_ps7_0_50M_0 || ORIG_REF_NAME==Z_system_rst_ps7_0_50M_0} -quiet] -quiet

# IP: bd/Z_system/ip/Z_system_IIR_filter_0_0/Z_system_IIR_filter_0_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==Z_system_IIR_filter_0_0 || ORIG_REF_NAME==Z_system_IIR_filter_0_0} -quiet] -quiet

# IP: bd/Z_system/ip/Z_system_R2R_Driver_0_0/Z_system_R2R_Driver_0_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==Z_system_R2R_Driver_0_0 || ORIG_REF_NAME==Z_system_R2R_Driver_0_0} -quiet] -quiet

# IP: bd/Z_system/ip/Z_system_TOP_Module_0_1/Z_system_TOP_Module_0_1.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==Z_system_TOP_Module_0_1 || ORIG_REF_NAME==Z_system_TOP_Module_0_1} -quiet] -quiet

# IP: bd/Z_system/ip/Z_system_clk_wiz_0_0/Z_system_clk_wiz_0_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==Z_system_clk_wiz_0_0 || ORIG_REF_NAME==Z_system_clk_wiz_0_0} -quiet] -quiet

# IP: bd/Z_system/ip/Z_system_system_ila_0_0/Z_system_system_ila_0_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==Z_system_system_ila_0_0 || ORIG_REF_NAME==Z_system_system_ila_0_0} -quiet] -quiet

# Block Designs: bd/Z_system/ip/Z_system_system_ila_0_0/bd_0/bd_4c55.bd
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==bd_4c55 || ORIG_REF_NAME==bd_4c55} -quiet] -quiet

# IP: bd/Z_system/ip/Z_system_system_ila_0_0/bd_0/ip/ip_0/bd_4c55_ila_lib_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==bd_4c55_ila_lib_0 || ORIG_REF_NAME==bd_4c55_ila_lib_0} -quiet] -quiet

# IP: bd/Z_system/ip/Z_system_system_ila_0_0/bd_0/ip/ip_1/bd_4c55_g_inst_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==bd_4c55_g_inst_0 || ORIG_REF_NAME==bd_4c55_g_inst_0} -quiet] -quiet

# IP: bd/Z_system/ip/Z_system_system_ila_0_0/bd_0/ip/ip_2/bd_4c55_slot_0_aw_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==bd_4c55_slot_0_aw_0 || ORIG_REF_NAME==bd_4c55_slot_0_aw_0} -quiet] -quiet

# IP: bd/Z_system/ip/Z_system_system_ila_0_0/bd_0/ip/ip_3/bd_4c55_slot_0_w_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==bd_4c55_slot_0_w_0 || ORIG_REF_NAME==bd_4c55_slot_0_w_0} -quiet] -quiet

# IP: bd/Z_system/ip/Z_system_system_ila_0_0/bd_0/ip/ip_4/bd_4c55_slot_0_b_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==bd_4c55_slot_0_b_0 || ORIG_REF_NAME==bd_4c55_slot_0_b_0} -quiet] -quiet

# IP: bd/Z_system/ip/Z_system_system_ila_0_0/bd_0/ip/ip_5/bd_4c55_slot_0_ar_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==bd_4c55_slot_0_ar_0 || ORIG_REF_NAME==bd_4c55_slot_0_ar_0} -quiet] -quiet

# IP: bd/Z_system/ip/Z_system_system_ila_0_0/bd_0/ip/ip_6/bd_4c55_slot_0_r_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==bd_4c55_slot_0_r_0 || ORIG_REF_NAME==bd_4c55_slot_0_r_0} -quiet] -quiet

# IP: bd/Z_system/ip/Z_system_auto_pc_0/Z_system_auto_pc_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==Z_system_auto_pc_0 || ORIG_REF_NAME==Z_system_auto_pc_0} -quiet] -quiet

# XDC: bd/Z_system/ip/Z_system_processing_system7_0_0/Z_system_processing_system7_0_0.xdc
set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==Z_system_processing_system7_0_0 || ORIG_REF_NAME==Z_system_processing_system7_0_0} -quiet] {/inst } ]/inst ] -quiet] -quiet

# XDC: bd/Z_system/ip/Z_system_rst_ps7_0_50M_0/Z_system_rst_ps7_0_50M_0_board.xdc
set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==Z_system_rst_ps7_0_50M_0 || ORIG_REF_NAME==Z_system_rst_ps7_0_50M_0} -quiet] {/U0 } ]/U0 ] -quiet] -quiet

# XDC: bd/Z_system/ip/Z_system_rst_ps7_0_50M_0/Z_system_rst_ps7_0_50M_0.xdc
#dup# set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==Z_system_rst_ps7_0_50M_0 || ORIG_REF_NAME==Z_system_rst_ps7_0_50M_0} -quiet] {/U0 } ]/U0 ] -quiet] -quiet

# XDC: bd/Z_system/ip/Z_system_rst_ps7_0_50M_0/Z_system_rst_ps7_0_50M_0_ooc.xdc

# XDC: bd/Z_system/ip/Z_system_clk_wiz_0_0/Z_system_clk_wiz_0_0_board.xdc
set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==Z_system_clk_wiz_0_0 || ORIG_REF_NAME==Z_system_clk_wiz_0_0} -quiet] {/inst } ]/inst ] -quiet] -quiet

# XDC: bd/Z_system/ip/Z_system_clk_wiz_0_0/Z_system_clk_wiz_0_0.xdc
#dup# set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==Z_system_clk_wiz_0_0 || ORIG_REF_NAME==Z_system_clk_wiz_0_0} -quiet] {/inst } ]/inst ] -quiet] -quiet

# XDC: bd/Z_system/ip/Z_system_clk_wiz_0_0/Z_system_clk_wiz_0_0_ooc.xdc

# XDC: bd/Z_system/ip/Z_system_system_ila_0_0/Z_system_system_ila_0_0_ooc.xdc

# XDC: bd/Z_system/ip/Z_system_system_ila_0_0/bd_0/ip/ip_0/ila_v6_2/constraints/ila_impl.xdc
set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==bd_4c55_ila_lib_0 || ORIG_REF_NAME==bd_4c55_ila_lib_0} -quiet] {/U0 } ]/U0 ] -quiet] -quiet

# XDC: bd/Z_system/ip/Z_system_system_ila_0_0/bd_0/ip/ip_0/ila_v6_2/constraints/ila.xdc
#dup# set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==bd_4c55_ila_lib_0 || ORIG_REF_NAME==bd_4c55_ila_lib_0} -quiet] {/U0 } ]/U0 ] -quiet] -quiet

# XDC: bd/Z_system/ip/Z_system_system_ila_0_0/bd_0/ip/ip_0/bd_4c55_ila_lib_0_ooc.xdc

# XDC: bd/Z_system/ip/Z_system_system_ila_0_0/bd_0/bd_4c55_ooc.xdc

# XDC: bd/Z_system/ip/Z_system_auto_pc_0/Z_system_auto_pc_0_ooc.xdc

# XDC: bd/Z_system/Z_system_ooc.xdc
