----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:11:02 06/12/2018 
-- Design Name: 
-- Module Name:    IP - Behavioral 
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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity IP is
    Port ( CLK : in  STD_LOGIC;
           ipOut : out  STD_LOGIC_VECTOR(15 downto 0));
end IP;

architecture Behavioral of IP is
begin
process 
variable Ip : integer:= 0;
	begin
	wait until CLK'event and CLK ='1'; --Attente front montant
		Ip := Ip+1;
		ipOut <= std_logic_vector(to_signed(Ip, ipOut'length));
	end process;

end Behavioral;

