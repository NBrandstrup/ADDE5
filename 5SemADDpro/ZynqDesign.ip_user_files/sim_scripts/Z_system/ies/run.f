-makelib ies_lib/xilinx_vip -sv \
  "C:/Xilinx/Vivado/2019.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
  "C:/Xilinx/Vivado/2019.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
  "C:/Xilinx/Vivado/2019.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
  "C:/Xilinx/Vivado/2019.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
  "C:/Xilinx/Vivado/2019.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
  "C:/Xilinx/Vivado/2019.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
  "C:/Xilinx/Vivado/2019.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
  "C:/Xilinx/Vivado/2019.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
  "C:/Xilinx/Vivado/2019.1/data/xilinx_vip/hdl/rst_vip_if.sv" \
-endlib
-makelib ies_lib/xil_defaultlib -sv \
  "C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
  "C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/axi_infrastructure_v1_1_0 \
  "../../../../ZynqDesign.srcs/sources_1/bd/Z_system/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_vip_v1_1_5 -sv \
  "../../../../ZynqDesign.srcs/sources_1/bd/Z_system/ipshared/d4a8/hdl/axi_vip_v1_1_vl_rfs.sv" \
-endlib
-makelib ies_lib/processing_system7_vip_v1_0_7 -sv \
  "../../../../ZynqDesign.srcs/sources_1/bd/Z_system/ipshared/8c62/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/Z_system/ip/Z_system_processing_system7_0_0/sim/Z_system_processing_system7_0_0.v" \
-endlib
-makelib ies_lib/lib_cdc_v1_0_2 \
  "../../../../ZynqDesign.srcs/sources_1/bd/Z_system/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib ies_lib/proc_sys_reset_v5_0_13 \
  "../../../../ZynqDesign.srcs/sources_1/bd/Z_system/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/Z_system/ip/Z_system_rst_ps7_0_50M_0/sim/Z_system_rst_ps7_0_50M_0.vhd" \
  "../../../bd/Z_system/ipshared/1926/src/IIR_Biquad_v2.vhd" \
  "../../../bd/Z_system/ipshared/1926/hdl/IIR_filter_v1_0_S00_AXI.vhd" \
  "../../../bd/Z_system/ipshared/1926/hdl/IIR_filter_v1_0.vhd" \
  "../../../bd/Z_system/ip/Z_system_IIR_filter_0_0/sim/Z_system_IIR_filter_0_0.vhd" \
  "../../../bd/Z_system/ipshared/0484/R2R_Driver.vhd" \
  "../../../bd/Z_system/ip/Z_system_R2R_Driver_0_0/sim/Z_system_R2R_Driver_0_0.vhd" \
  "../../../bd/Z_system/ipshared/927f/src/Transciever.vhd" \
  "../../../bd/Z_system/ipshared/927f/src/Top.vhd" \
  "../../../bd/Z_system/ip/Z_system_TOP_Module_0_1/sim/Z_system_TOP_Module_0_1.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/Z_system/ip/Z_system_clk_wiz_0_0/Z_system_clk_wiz_0_0_clk_wiz.v" \
  "../../../bd/Z_system/ip/Z_system_clk_wiz_0_0/Z_system_clk_wiz_0_0.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/Z_system/ip/Z_system_system_ila_0_0/bd_0/sim/bd_4c55.vhd" \
  "../../../bd/Z_system/ip/Z_system_system_ila_0_0/bd_0/ip/ip_0/sim/bd_4c55_ila_lib_0.vhd" \
-endlib
-makelib ies_lib/gigantic_mux \
  "../../../../ZynqDesign.srcs/sources_1/bd/Z_system/ipshared/d322/hdl/gigantic_mux_v1_0_cntr.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/Z_system/ip/Z_system_system_ila_0_0/bd_0/ip/ip_1/bd_4c55_g_inst_0_gigantic_mux.v" \
  "../../../bd/Z_system/ip/Z_system_system_ila_0_0/bd_0/ip/ip_1/sim/bd_4c55_g_inst_0.v" \
-endlib
-makelib ies_lib/xlconcat_v2_1_3 \
  "../../../../ZynqDesign.srcs/sources_1/bd/Z_system/ipshared/442e/hdl/xlconcat_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/Z_system/ip/Z_system_system_ila_0_0/bd_0/ip/ip_2/sim/bd_4c55_slot_0_aw_0.v" \
  "../../../bd/Z_system/ip/Z_system_system_ila_0_0/bd_0/ip/ip_3/sim/bd_4c55_slot_0_w_0.v" \
  "../../../bd/Z_system/ip/Z_system_system_ila_0_0/bd_0/ip/ip_4/sim/bd_4c55_slot_0_b_0.v" \
  "../../../bd/Z_system/ip/Z_system_system_ila_0_0/bd_0/ip/ip_5/sim/bd_4c55_slot_0_ar_0.v" \
  "../../../bd/Z_system/ip/Z_system_system_ila_0_0/bd_0/ip/ip_6/sim/bd_4c55_slot_0_r_0.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/Z_system/ip/Z_system_system_ila_0_0/sim/Z_system_system_ila_0_0.vhd" \
-endlib
-makelib ies_lib/generic_baseblocks_v2_1_0 \
  "../../../../ZynqDesign.srcs/sources_1/bd/Z_system/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_4 \
  "../../../../ZynqDesign.srcs/sources_1/bd/Z_system/ipshared/1f5a/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_4 \
  "../../../../ZynqDesign.srcs/sources_1/bd/Z_system/ipshared/1f5a/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_4 \
  "../../../../ZynqDesign.srcs/sources_1/bd/Z_system/ipshared/1f5a/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib ies_lib/axi_data_fifo_v2_1_18 \
  "../../../../ZynqDesign.srcs/sources_1/bd/Z_system/ipshared/5b9c/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_register_slice_v2_1_19 \
  "../../../../ZynqDesign.srcs/sources_1/bd/Z_system/ipshared/4d88/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_protocol_converter_v2_1_19 \
  "../../../../ZynqDesign.srcs/sources_1/bd/Z_system/ipshared/c83a/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/Z_system/ip/Z_system_auto_pc_0/sim/Z_system_auto_pc_0.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/Z_system/sim/Z_system.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

