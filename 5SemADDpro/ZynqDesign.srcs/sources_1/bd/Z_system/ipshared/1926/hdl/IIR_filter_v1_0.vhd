library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity IIR_filter_v1_0 is
	generic (
		-- Users to add parameters here
		COEFF_WIDTH : integer := 32;
		INPUT_WIDTH : integer := 24;
		OUTPUT_WIDTH : integer := 16;
		-- User parameters ends
		-- Do not modify the parameters beyond this line


		-- Parameters of Axi Slave Bus Interface S00_AXI
		C_S00_AXI_DATA_WIDTH	: integer	:= 32;
		C_S00_AXI_ADDR_WIDTH	: integer	:= 5
	);
	port (
		-- Users to add ports here
		sample_trig : in std_logic;
		X_in : in std_logic_vector(INPUT_WIDTH-1 downto 0);
		Y_out : out std_logic_vector(OUTPUT_WIDTH-1 downto 0);
		--DEBUG PORTS:
		debug1 : out std_logic_vector(COEFF_WIDTH-1 downto 0);
		debug2 : out std_logic_vector(COEFF_WIDTH-1 downto 0);
		debug3 : out std_logic_vector(COEFF_WIDTH-1 downto 0);
		debug4 : out std_logic_vector(COEFF_WIDTH-1 downto 0);
		debug5 : out std_logic_vector(COEFF_WIDTH-1 downto 0);
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
end IIR_filter_v1_0;

architecture arch_imp of IIR_filter_v1_0 is

	-- component declaration
	component IIR_Biquad_en
		generic(
			COEFF_WIDTH  : integer;
			INPUT_WIDTH  : integer;
			OUTPUT_WIDTH : integer
		);
		port(
			clk         : in  STD_LOGIC;
			n_reset     : in  STD_LOGIC;
			sample_trig : in  STD_LOGIC;
			X_in        : in  STD_LOGIC_VECTOR(INPUT_WIDTH - 1 downto 0);
			filter_done : out STD_LOGIC;
			coeffb0     : in  std_logic_vector(COEFF_WIDTH - 1 downto 0);
			coeffb1     : in  std_logic_vector(COEFF_WIDTH - 1 downto 0);
			coeffb2     : in  std_logic_vector(COEFF_WIDTH - 1 downto 0);
			coeffa1     : in  std_logic_vector(COEFF_WIDTH - 1 downto 0);
			coeffa2     : in  std_logic_vector(COEFF_WIDTH - 1 downto 0);
			Y_out       : out STD_LOGIC_VECTOR(OUTPUT_WIDTH - 1 downto 0)
		);
	end component IIR_Biquad_en;
	component IIR_filter_v1_0_S00_AXI
		generic(
			C_S_AXI_DATA_WIDTH : integer;
			C_S_AXI_ADDR_WIDTH : integer
		);
		port(
			slave_reg0    : out std_logic_vector(C_S_AXI_DATA_WIDTH - 1 downto 0);
			slave_reg1    : out std_logic_vector(C_S_AXI_DATA_WIDTH - 1 downto 0);
			slave_reg2    : out std_logic_vector(C_S_AXI_DATA_WIDTH - 1 downto 0);
			slave_reg3    : out std_logic_vector(C_S_AXI_DATA_WIDTH - 1 downto 0);
			slave_reg4    : out std_logic_vector(C_S_AXI_DATA_WIDTH - 1 downto 0);
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
	end component IIR_filter_v1_0_S00_AXI;
	signal Coeffb0 : std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
	signal Coeffb1 : std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
	signal Coeffb2 : std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
	signal Coeffa1 : std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
	signal Coeffa2 : std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
	
begin

--DEBUG START:
debug1 <= Coeffb0;
debug2 <= Coeffb1;
debug3 <= Coeffb2;
debug4 <= Coeffa1;
debug5 <= Coeffa2;


-- Instantiation of Axi Bus Interface S00_AXI
IIR_filter_v1_0_S00_AXI_inst : IIR_filter_v1_0_S00_AXI
	generic map (
		C_S_AXI_DATA_WIDTH	=> C_S00_AXI_DATA_WIDTH,
		C_S_AXI_ADDR_WIDTH	=> C_S00_AXI_ADDR_WIDTH
	)
	port map (
		slave_reg0 => Coeffb0,
		slave_reg1 => Coeffb1,
		slave_reg2 => Coeffb2,
		slave_reg3 => Coeffa1,
		slave_reg4 => Coeffa2,
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
	IIR_Biquad_inst : IIR_Biquad_en
		generic map(
			COEFF_WIDTH  => COEFF_WIDTH,
			INPUT_WIDTH  => INPUT_WIDTH,
			OUTPUT_WIDTH => OUTPUT_WIDTH
		)
		port map(
			clk         => s00_axi_aclk,
			n_reset     => s00_axi_aresetn,
			sample_trig => sample_trig,
			X_in        => X_in,
			filter_done => open,
			coeffb0     => Coeffb0,
			coeffb1     => Coeffb1,
			coeffb2     => Coeffb2,
			coeffa1     => Coeffa1,
			coeffa2     => Coeffa2,
			Y_out       => Y_out
		);

end arch_imp;
