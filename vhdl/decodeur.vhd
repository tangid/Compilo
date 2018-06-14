----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:37:17 06/12/2018 
-- Design Name: 
-- Module Name:    decodeur - Behavioral 
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

entity decodeur is
    Port ( Entry : in  STD_LOGIC_VECTOR (31 downto 0);
           A : out  STD_LOGIC_VECTOR (15 downto 0);
           B : out  STD_LOGIC_VECTOR (15 downto 0);
           C : out  STD_LOGIC_VECTOR (15 downto 0);
			  OP : out  STD_LOGIC_VECTOR (7 downto 0));
end decodeur;

architecture Behavioral of decodeur is

begin
	OP <= Entry (31 downto 24);
	A <= Entry( 23 downto 8 ) when (Entry (31 downto 24)) =x"08" or (Entry (31 downto 24)) =x"0E" or (Entry (31 downto 24)) =x"0F"
	else
	std_logic_vector(resize(signed(Entry( 23 downto 16 )),A'length));
	B <= (others => 'Z')	when (Entry (31 downto 24)) =x"08" or (Entry (31 downto 24)) =x"0E" or (Entry (31 downto 24)) =x"0F"
	else
	Entry( 15 downto 0 ) when (Entry (31 downto 24)) =x"07" or (Entry (31 downto 24)) =x"06"
	else
	std_logic_vector(resize(signed(Entry( 15 downto 8 )),A'length));
	C <= (others => 'Z')	when (Entry (31 downto 24)) =x"07" or (Entry (31 downto 24)) =x"06" or (Entry (31 downto 24)) =x"0E"
	else
	std_logic_vector(resize(signed(Entry( 7 downto 0 )),A'length));
end Behavioral;

