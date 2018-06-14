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

entity LCBr is
    Port ( OP : in  STD_LOGIC_VECTOR (7 downto 0);
           S : out  STD_LOGIC);
end LCBr;

architecture Behavioral of LCBr is

begin
	S<= '0' when OP=x"08"
	else '1';

end Behavioral;

