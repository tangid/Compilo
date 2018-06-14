----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:56:09 05/18/2018 
-- Design Name: 
-- Module Name:    BancRegistre - Behavioral 
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

entity BancRegistre is
    Port ( adr_A : in  STD_LOGIC_VECTOR (15 downto 0) ;
           adr_B : in  STD_LOGIC_VECTOR (15 downto 0);
           adr_W : in  STD_LOGIC_VECTOR (15 downto 0);
           W : in  STD_LOGIC;
			  RST : in  STD_LOGIC;
           DATA : in  STD_LOGIC_VECTOR (15 downto 0);
           QA : out  STD_LOGIC_VECTOR (15 downto 0) := x"0000";
           QB : out  STD_LOGIC_VECTOR (15 downto 0) := x"0000";
			  CLK : in STD_LOGIC);
			  
	 type registre is array(15 downto 0) of STD_LOGIC_VECTOR(15 downto 0);
	 signal Reg : registre; -- Declarer un registre et le remplir de 0
end BancRegistre;

architecture Behavioral of BancRegistre is

begin
	QA <= DATA when W='1' and to_integer(unsigned(adr_A)) = to_integer(unsigned(adr_W )) --BYPASS ?
		else 
		STD_LOGIC_VECTOR(Reg(to_integer(unsigned(adr_A))))when (to_integer(unsigned(adr_A)))<=15
		else
		(others => 'Z');
	QB <= DATA when W='1' and to_integer(unsigned(adr_B)) = to_integer(unsigned(adr_W ))
		else 
		STD_LOGIC_VECTOR(Reg(to_integer(unsigned(adr_B)))) when (to_integer(unsigned(adr_B)))<=15
		else
		(others => 'Z');
	process 
	begin
	wait until CLK'event and CLK ='1'; --Attente front montant
		if W='1' and RST='1' then
			Reg(to_integer(unsigned(adr_W))) <= DATA;
			elsif RST ='0' then
			Reg <= (others => (others => '0'));
		end if;
	end process;
end Behavioral;

