library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TOP_Module is
    Port ( reset : in STD_LOGIC;
           adc_data : in STD_LOGIC;
           data : out STD_LOGIC_VECTOR (23 downto 0);
           mclk : in STD_LOGIC;
           bclk : out STD_LOGIC;
           lrclk : out STD_LOGIC;
           sample_trig : out STD_LOGIC);
end TOP_Module;

architecture Behavioral of TOP_Module is
signal mclk_bus : STD_LOGIC_VECTOR (0 downto 0);
signal bclk_bus : STD_LOGIC_VECTOR (0 downto 0);
signal lrclk_bus : STD_LOGIC_VECTOR (0 downto 0);
signal data_bus : STD_LOGIC_VECTOR (0 downto 0);
--signal data_out_bus : STD_LOGIC_VECTOR (15 downto 0);
signal data_IIR_bus : STD_LOGIC_VECTOR (23 downto 0);
signal clk_bus : STD_LOGIC;
signal reset_bus : STD_LOGIC; 
--signal trig_bus : STD_LOGIC; 

begin


I2S_RCV : entity work.i2s_transceiver 
port map (reset_n => reset_bus, mclk => mclk, sclk => bclk_bus(0), ws => lrclk_bus(0), sd_rx => data_bus(0), r_data_rx => data_IIR_bus, t_pulse => sample_trig);

--IIR_FILTER : entity work.IIR_Biquad
--port map (clk => clk_bus, n_reset => reset_bus, sample_trig => trig_bus, X_in => data_IIR_bus, filter_done => open , Y_out => data_out_bus); 

--R2R_Driver : entity work.R2R_Driver
--port map (data_in => data_out_bus, data_out => data); 

--ILA_TEST : entity work.ila_0
--port map (clk => clk_bus, probe0 => data_bus, probe1 => bclk_bus, probe2 => lrclk_bus, probe3 => mclk_bus, probe4 => data_out_bus); 

data_bus(0) <= adc_data;

bclk <= bclk_bus(0);

lrclk <= lrclk_bus(0);
 
reset_bus <= reset; 

data <= data_IIR_Bus; 

end Behavioral;
