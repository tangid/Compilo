----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:06:14 05/28/2018 
-- Design Name: 
-- Module Name:    MicroPr - Behavioral 
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

entity MicroPr is
    Port ( ins_di : in  STD_LOGIC_VECTOR (32 downto 0);
           data_di : in  STD_LOGIC_VECTOR (16 downto 0);
           ins_a : out  STD_LOGIC_VECTOR (16 downto 0);
           data_do : out  STD_LOGIC_VECTOR (16 downto 0);
           data_a : out  STD_LOGIC_VECTOR (16 downto 0);
           data_we : out  STD_LOGIC_VECTOR (16 downto 0));
end MicroPr;

architecture Behavioral of MicroPr is

begin


end Behavioral;

