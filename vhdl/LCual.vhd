----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:37:23 06/06/2018 
-- Design Name: 
-- Module Name:    LCual - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LCual is
    Port ( OP : in  STD_LOGIC_VECTOR (7 downto 0);
           S : out  STD_LOGIC_VECTOR (3 downto 0));
end LCual;

architecture Behavioral of LCual is

begin
	S<= x"0" when OP=x"01"
	else 
		x"2" when OP=x"02"
	else
		x"1" when OP=x"03"
	else
		x"8" when OP=x"08"
	else
		x"F" when OP=x"0F"
	else
		x"5" when OP=x"06" -- rdy for future operation
	else
		x"5" when OP=x"07"
	else
		x"5" when OP=x"08"
	else x"5";

end Behavioral;

