library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FIR_filter_v1_0 is
	generic (
		-- Users to add parameters here
		COEFF_WIDTH_INTEGER : integer := 32;
		INPUT_WITDH_INTEGER : integer:= 24;
		MULT_WITDH_INTEGER  : integer := 48;
		-- User parameters ends
		-- Do not modify the parameters beyond this line


		-- Parameters of Axi Slave Bus Interface S00_AXI
		C_S00_AXI_DATA_WIDTH	: integer	:= 32;
		C_S00_AXI_ADDR_WIDTH	: integer	:= 4
	);
	port (
		-- Users to add ports here
		output_sig : out std_logic_vector(INPUT_WITDH_INTEGER-1 downto 0);
		CLK_in : in std_logic;
		input_sig : in std_logic_vector(INPUT_WITDH_INTEGER - 1 downto 0);
		
		--DEBUG PORTS
		debug1 : out std_logic_vector(31 downto 0);
		debug2 : out std_logic_vector(31 downto 0);
		debug3 : out std_logic_vector(31 downto 0);
		debug4 : out std_logic_vector(31 downto 0);
		--DEBUG PORTS ends
		-- User ports ends
		-- Do not modify the ports beyond this line


		-- Ports of Axi Slave Bus Interface S00_AXI
		s00_axi_aclk	: in std_logic;
		s00_axi_aresetn	: in std_logic;
		s00_axi_awaddr	: in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
		s00_axi_awprot	: in std_logic_vector(2 downto 0);
		s00_axi_awvalid	: in std_logic;
		s00_axi_awready	: out std_logic;
		s00_axi_wdata	: in std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
		s00_axi_wstrb	: in std_logic_vector((C_S00_AXI_DATA_WIDTH/8)-1 downto 0);
		s00_axi_wvalid	: in std_logic;
		s00_axi_wready	: out std_logic;
		s00_axi_bresp	: out std_logic_vector(1 downto 0);
		s00_axi_bvalid	: out std_logic;
		s00_axi_bready	: in std_logic;
		s00_axi_araddr	: in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
		s00_axi_arprot	: in std_logic_vector(2 downto 0);
		s00_axi_arvalid	: in std_logic;
		s00_axi_arready	: out std_logic;
		s00_axi_rdata	: out std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
		s00_axi_rresp	: out std_logic_vector(1 downto 0);
		s00_axi_rvalid	: out std_logic;
		s00_axi_rready	: in std_logic
	);
end FIR_filter_v1_0;

architecture arch_imp of FIR_filter_v1_0 is

	-- component declaration
	component fir_filter_4
		generic(
			COEFF_WIDTH : integer;
			INPUT_WIDTH : integer;
			MULT_WIDTH  : integer
		);
		port(
			i_clk     : in  std_logic;
			i_rstb    : in  std_logic;
			i_coeff_0 : in  std_logic_vector(COEFF_WIDTH - 1 downto 0);
			i_coeff_1 : in  std_logic_vector(COEFF_WIDTH - 1 downto 0);
			i_coeff_2 : in  std_logic_vector(COEFF_WIDTH - 1 downto 0);
			i_coeff_3 : in  std_logic_vector(COEFF_WIDTH - 1 downto 0);
			i_data    : in  std_logic_vector(INPUT_WIDTH - 1 downto 0);
			o_data    : out std_logic_vector((INPUT_WIDTH - 1) downto 0)
		);
	end component fir_filter_4;
	component FIR_filter_v1_0_S00_AXI
		generic(
			C_S_AXI_DATA_WIDTH : integer;
			C_S_AXI_ADDR_WIDTH : integer
		);
		port(
			slave_reg0    : out std_logic_vector(C_S_AXI_DATA_WIDTH - 1 downto 0);
			slave_reg1    : out std_logic_vector(C_S_AXI_DATA_WIDTH - 1 downto 0);
			slave_reg2    : out std_logic_vector(C_S_AXI_DATA_WIDTH - 1 downto 0);
			slave_reg3    : out std_logic_vector(C_S_AXI_DATA_WIDTH - 1 downto 0);
			S_AXI_ACLK    : in  std_logic;
			S_AXI_ARESETN : in  std_logic;
			S_AXI_AWADDR  : in  std_logic_vector(C_S_AXI_ADDR_WIDTH - 1 downto 0);
			S_AXI_AWPROT  : in  std_logic_vector(2 downto 0);
			S_AXI_AWVALID : in  std_logic;
			S_AXI_AWREADY : out std_logic;
			S_AXI_WDATA   : in  std_logic_vector(C_S_AXI_DATA_WIDTH - 1 downto 0);
			S_AXI_WSTRB   : in  std_logic_vector((C_S_AXI_DATA_WIDTH / 8) - 1 downto 0);
			S_AXI_WVALID  : in  std_logic;
			S_AXI_WREADY  : out std_logic;
			S_AXI_BRESP   : out std_logic_vector(1 downto 0);
			S_AXI_BVALID  : out std_logic;
			S_AXI_BREADY  : in  std_logic;
			S_AXI_ARADDR  : in  std_logic_vector(C_S_AXI_ADDR_WIDTH - 1 downto 0);
			S_AXI_ARPROT  : in  std_logic_vector(2 downto 0);
			S_AXI_ARVALID : in  std_logic;
			S_AXI_ARREADY : out std_logic;
			S_AXI_RDATA   : out std_logic_vector(C_S_AXI_DATA_WIDTH - 1 downto 0);
			S_AXI_RRESP   : out std_logic_vector(1 downto 0);
			S_AXI_RVALID  : out std_logic;
			S_AXI_RREADY  : in  std_logic
		);
	end component FIR_filter_v1_0_S00_AXI;
	
	    signal Coeff1 : std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
		signal Coeff2 : std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
		signal Coeff3 : std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
		signal Coeff4 : std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
	
begin
	
--DEBUG start
		debug1 <= Coeff1;
		debug2 <= Coeff2;
		debug3 <= Coeff3;
		debug4 <= Coeff4;
--DEBUG ends
	

-- Instantiation of Axi Bus Interface S00_AXI
FIR_filter_v1_0_S00_AXI_inst : FIR_filter_v1_0_S00_AXI
	generic map (
		C_S_AXI_DATA_WIDTH	=> C_S00_AXI_DATA_WIDTH,
		C_S_AXI_ADDR_WIDTH	=> C_S00_AXI_ADDR_WIDTH
	)
	port map (
		slave_reg0 => Coeff1,
		slave_reg1 => Coeff2,
		slave_reg2 => Coeff3,
		slave_reg3 => Coeff4,
		S_AXI_ACLK	=> s00_axi_aclk,
		S_AXI_ARESETN	=> s00_axi_aresetn,
		S_AXI_AWADDR	=> s00_axi_awaddr,
		S_AXI_AWPROT	=> s00_axi_awprot,
		S_AXI_AWVALID	=> s00_axi_awvalid,
		S_AXI_AWREADY	=> s00_axi_awready,
		S_AXI_WDATA	=> s00_axi_wdata,
		S_AXI_WSTRB	=> s00_axi_wstrb,
		S_AXI_WVALID	=> s00_axi_wvalid,
		S_AXI_WREADY	=> s00_axi_wready,
		S_AXI_BRESP	=> s00_axi_bresp,
		S_AXI_BVALID	=> s00_axi_bvalid,
		S_AXI_BREADY	=> s00_axi_bready,
		S_AXI_ARADDR	=> s00_axi_araddr,
		S_AXI_ARPROT	=> s00_axi_arprot,
		S_AXI_ARVALID	=> s00_axi_arvalid,
		S_AXI_ARREADY	=> s00_axi_arready,
		S_AXI_RDATA	=> s00_axi_rdata,
		S_AXI_RRESP	=> s00_axi_rresp,
		S_AXI_RVALID	=> s00_axi_rvalid,
		S_AXI_RREADY	=> s00_axi_rready
	);

	-- Add user logic here
	fir_filter_4_Inst : fir_filter_4
		generic map(
			COEFF_WIDTH => COEFF_WIDTH_INTEGER,
			INPUT_WIDTH => INPUT_WITDH_INTEGER,
			MULT_WIDTH  => MULT_WITDH_INTEGER
		)
		port map(
			i_clk     => CLK_in,
			i_rstb    => s00_axi_aresetn,
			i_coeff_0 => Coeff1,
			i_coeff_1 => Coeff2,
			i_coeff_2 => Coeff3,
			i_coeff_3 => Coeff4,
			i_data    => input_sig,
			o_data    => output_sig
		);
	-- User logic ends

end arch_imp;
