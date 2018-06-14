----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:30:23 06/12/2018 
-- Design Name: 
-- Module Name:    Rom - Behavioral 
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
use ieee.numeric_std.all;
use work.common.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Rom is
    Port ( ins_a : in  STD_LOGIC_VECTOR (15 downto 0) := x"0000";
           ins_di : out  STD_LOGIC_VECTOR (31 downto 0));
			  
	shared variable romdata : instrArray := init_rom("rom.hex");
end Rom;
architecture Behavioral of Rom is
begin
-- use file to create rom ( table ) from file and read line ins_a and out it on ins_di
		ins_di <= romdata(to_integer(unsigned(ins_a)));
end Behavioral;

