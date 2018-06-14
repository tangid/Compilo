----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:07:09 06/01/2018 
-- Design Name: 
-- Module Name:    MUX - Behavioral 
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

entity MUXual is
    Port ( A : in  STD_LOGIC_VECTOR (15 downto 0); --Sortie de B du pipeline DIEX
           B : in  STD_LOGIC_VECTOR (15 downto 0); --Sortie de l'UAL
           CTRL : in  STD_LOGIC_VECTOR (7 downto 0);
           S : out  STD_LOGIC_VECTOR (15 downto 0)); -- Sortie du multiplexeur
end MUXual;

architecture Behavioral of MUXual is
begin
	S <= A when CTRL=x"06" OR CTRL=x"05" OR CTRL=x"07" else	B;	
end Behavioral;

