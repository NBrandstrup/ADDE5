library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity fir_filter_4 is
   generic (
   COEFF_WIDTH : integer := 32;
   INPUT_WIDTH : integer := 24;
   MULT_WIDTH  : integer := 48
   );
port (
  i_clk        : in  std_logic;
  i_rstb       : in  std_logic;
  -- coefficient
  i_coeff_0    : in  std_logic_vector( COEFF_WIDTH-1 downto 0);
  i_coeff_1    : in  std_logic_vector( COEFF_WIDTH-1 downto 0);
  i_coeff_2    : in  std_logic_vector( COEFF_WIDTH-1 downto 0);
  i_coeff_3    : in  std_logic_vector( COEFF_WIDTH-1 downto 0);
  -- data input
  i_data       : in  std_logic_vector( INPUT_WIDTH-1 downto 0);
  -- filtered data 
  o_data       : out std_logic_vector( (INPUT_WIDTH-1) downto 0));
end fir_filter_4;
architecture rtl of fir_filter_4 is
type t_data_pipe      is array (0 to 3) of unsigned(INPUT_WIDTH-1  downto 0);
type t_coeff          is array (0 to 3) of unsigned(INPUT_WIDTH-1  downto 0);
type t_mult           is array (0 to 3) of unsigned(MULT_WIDTH-1    downto 0);
type t_add_st0        is array (0 to 1) of unsigned((MULT_WIDTH-1)+1  downto 0);
signal r_coeff              : t_coeff ;
signal p_data               : t_data_pipe;
signal r_mult               : t_mult;
signal r_add_st0            : t_add_st0;
signal r_add_st1            : unsigned((MULT_WIDTH-1)+2  downto 0);
begin
p_input : process (i_rstb,i_clk)
begin
  if(i_rstb='0') then
    p_data       <= (others=>(others=>'0'));
    r_coeff      <= (others=>(others=>'0'));
  elsif(rising_edge(i_clk)) then
    p_data      <= unsigned(i_data)&p_data(0 to p_data'length-2);
    r_coeff(0)  <= unsigned(i_coeff_0(INPUT_WIDTH-1 downto 0));
    r_coeff(1)  <= unsigned(i_coeff_1(INPUT_WIDTH-1 downto 0));
    r_coeff(2)  <= unsigned(i_coeff_2(INPUT_WIDTH-1 downto 0));
    r_coeff(3)  <= unsigned(i_coeff_3(INPUT_WIDTH-1 downto 0));
  end if;
end process p_input;

p_mult : process (i_rstb,i_clk)
begin
  if(i_rstb='0') then
    r_mult       <= (others=>(others=>'0'));
  elsif(rising_edge(i_clk)) then
    for k in 0 to 3 loop
      r_mult(k)       <= p_data(k) * r_coeff(k);
    end loop;
  end if;
end process p_mult;

p_add_st0 : process (i_rstb,i_clk)
begin
  if(i_rstb='0') then
    r_add_st0     <= (others=>(others=>'0'));
  elsif(rising_edge(i_clk)) then
    for k in 0 to 1 loop
      r_add_st0(k)     <= resize(r_mult(2*k),MULT_WIDTH+1)  + resize(r_mult(2*k+1),MULT_WIDTH+1);
    end loop;
  end if;
end process p_add_st0;

p_add_st1 : process (i_rstb,i_clk)
begin
  if(i_rstb='0') then
    r_add_st1     <= (others=>'0');
  elsif(rising_edge(i_clk)) then
    r_add_st1     <= resize(r_add_st0(0),MULT_WIDTH+2)  + resize(r_add_st0(1),MULT_WIDTH+2);
  end if;
end process p_add_st1;

p_output : process (i_rstb,i_clk)
begin
  if(i_rstb='0') then
    o_data     <= (others=>'0');
  elsif(rising_edge(i_clk)) then
    o_data     <= std_logic_vector(r_add_st1((MULT_WIDTH-1)+2 downto ((MULT_WIDTH-1)+2)- INPUT_WIDTH+1));
  end if;
end process p_output;

end rtl;