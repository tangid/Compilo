----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:00:32 06/01/2018 
-- Design Name: 
-- Module Name:    PIpeLine2 - Behavioral 
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

entity PIpeLine2 is
    Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
           OP : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (15 downto 0);
           C : in  STD_LOGIC_VECTOR (15 downto 0);
			  Clock : in STD_LOGIC;
           QA : out  STD_LOGIC_VECTOR (15 downto 0);
           QOP : out  STD_LOGIC_VECTOR (7 downto 0);
           QB : out  STD_LOGIC_VECTOR (15 downto 0);
           QC : out  STD_LOGIC_VECTOR (15 downto 0));
			  
end PipeLine2;

architecture Behavioral of Pipeline is

begin
	process
	begin
		wait until Clock'event and Clock ='1'; --Attente front montant
		QA <= A;
		QB <= B;
		QC <= C;
		QOP <= OP;
	end process;

end Behavioral;

