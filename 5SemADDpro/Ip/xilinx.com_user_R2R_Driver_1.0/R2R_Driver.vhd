----------------------------------------------------------------------------------
-- Company: KFJ Systems
-- Engineer: Kenneth Fyhring
-- 
-- Create Date: 11/16/2019 09:15:38 PM
-- Module Name: R2R_Driver - Behavioral
-- Project Name: ADD Project
--
-- Revision: 1.0
-- Revision 0.01 - File Created
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity R2R_Driver is
    Port ( data_in : in STD_LOGIC_VECTOR (15 downto 0);
           data_out : out STD_LOGIC_VECTOR (15 downto 0));
end R2R_Driver;

architecture Behavioral of R2R_Driver is

begin

process(data_in)
begin 
if(data_in(15) = '0') then
    data_out <= NOT (std_logic_vector(data_in) OR "1000000000000000"); --Invert MSB
else
    data_out <= NOT (std_logic_vector(data_in) AND "0111111111111111"); --Invert MSB
end if; 
end process; 

end Behavioral;
