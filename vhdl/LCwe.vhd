----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:29:05 06/12/2018 
-- Design Name: 
-- Module Name:    LCwe - Behavioral 
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

entity LCwe is
    Port ( CTRL : in  STD_LOGIC_VECTOR (7 downto 0);
           WE : out  STD_LOGIC);
end LCwe;

architecture Behavioral of LCwe is

begin

	WE <= '1' when CTRL=x"08"
	else
		'0';

end Behavioral;

