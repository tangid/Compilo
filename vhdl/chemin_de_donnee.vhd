----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:54:43 06/12/2018 
-- Design Name: 
-- Module Name:    chemin_de_donnee - Behavioral 
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

entity chemin_de_donnee is
    Port ( sys_clk : in  STD_LOGIC;
           sys_rst : in  STD_LOGIC);
end chemin_de_donnee;

architecture Behavioral of chemin_de_donnee is

component bram16
  generic (
    init_file : String := "none";
    adr_width : Integer := 11);
  port (
  -- System
  sys_clk : in std_logic;
  sys_rst : in std_logic;
  -- Master
  di : out std_logic_vector(15 downto 0);
  we : in std_logic;
  a : in std_logic_vector(15 downto 0);
  do : in std_logic_vector(15 downto 0));
end component;
component microproc
  port (	
			  CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           ins_di : in STD_LOGIC_VECTOR (31 downto 0);
			  Data_di : in STD_LOGIC_VECTOR (15 downto 0);
			  Data_do : out STD_LOGIC_VECTOR (15 downto 0);
			  Data_a : out STD_LOGIC_VECTOR (15 downto 0);
			  Data_we : out STD_LOGIC;
			  ins_a : out STD_LOGIC_VECTOR (15 downto 0));
end component;
component Rom
  port (	
			  ins_di : out STD_LOGIC_VECTOR (31 downto 0);
			  ins_a : in STD_LOGIC_VECTOR (15 downto 0));
end component;

	signal d_di : STD_LOGIC_VECTOR (15 downto 0);
	signal d_do : STD_LOGIC_VECTOR (15 downto 0);
	signal d_a : STD_LOGIC_VECTOR (15 downto 0);
	signal ins_di : STD_LOGIC_VECTOR (31 downto 0);
	signal d_we : STD_LOGIC;
	signal ins_a : STD_LOGIC_VECTOR (15 downto 0);
begin
	mcp : microproc port map(sys_clk,sys_rst,ins_di,d_di,d_do,d_a,d_we,ins_a);
	ram : bram16 port map(sys_clk,sys_rst,d_di,d_we,d_a,d_do);
	rome : Rom port map(ins_di,ins_a);
end Behavioral;

