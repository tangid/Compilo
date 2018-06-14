----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:41:50 05/03/2018 
-- Design Name: 
-- Module Name:    ual - Behavioral 
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
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
-- Dans le cas de présence de chiffre négatif, on prendra la convention de complément à deux pour les représenter
--- La 17 valeur est utilisée pour la retenue
entity ual is
    Port ( A : in  STD_LOGIC_VECTOR (15 downto 0); 
           B : in  STD_LOGIC_VECTOR (15 downto 0);
           OP : in  STD_LOGIC_VECTOR (3 downto 0);
           S : out  STD_LOGIC_VECTOR (15 downto 0);
           Flag : out  STD_LOGIC_VECTOR (3 downto 0));
				--0 => Zero
				--1 => négatif
				--2 => overflow
				--3 => carry

end ual;

architecture Behavioral of ual is
		signal S_res : STD_LOGIC_VECTOR (15 downto 0);		
		signal S_add : STD_LOGIC_VECTOR (16 downto 0);
		signal S_sub : STD_LOGIC_VECTOR (16 downto 0);
		signal S_ls : STD_LOGIC_VECTOR (15 downto 0);
		signal S_rs : STD_LOGIC_VECTOR (15 downto 0);	
		signal S_mul : STD_LOGIC_VECTOR (31 downto 0);					
						
begin
		--Opérations
		S_add <= ('0'&A)+('0'&B);
		S_sub <= ('0'&A)-('0'&B);
		S_mul <= A*B;
		S_ls <= std_logic_vector(unsigned(A) sll to_integer(unsigned(B)));
		S_rs <= std_logic_vector(unsigned(A) srl to_integer(unsigned(B)));
		
		--Définition du signal
		S_res <= S_add(15 downto 0) when op=x"0"
			else 
			S_sub (15 downto 0) when op=x"1"
			else 
			S_mul (15 downto 0) when op=x"2"
			else 
			S_ls when op=x"3"
			else 
			S_rs when op=x"4"
			else
			B when op=x"8" or op=x"F"
			else
			  (others => 'Z')
			;
		
		--Définition des flags
			--Flag overflow
		flag(2) <= '0' when S_mul(31 downto 16) = x"0000" AND op=x"2"
						--else
							--'0' when S_mul(31 downto 16) = x"FFFF" AND op=x"2"
						else
							'1' when op=x"2"
						else 
							S_add(16) when op=x"0"
						else 
							S_sub(16) when op=x"1"
						else
							'0';
		
		--Résultat en sortie
		S <= S_res;
		
end Behavioral;

