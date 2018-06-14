--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:30:18 06/06/2018
-- Design Name:   
-- Module Name:   /home/delanoe/4A/semestre_8/projet_syst/proc/ual/microprocTest.vhd
-- Project Name:  ual
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: microproc
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY microprocTest IS
END microprocTest;
 
ARCHITECTURE behavior OF microprocTest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT microproc
    PORT(
         A : IN  std_logic_vector(15 downto 0);
         OP : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(15 downto 0);
         CLK : IN  std_logic;
         RST : IN  std_logic;
         C : IN  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(15 downto 0) := x"0001";
   signal OP : std_logic_vector(7 downto 0) := x"06";
   signal B : std_logic_vector(15 downto 0) := x"1010";
   signal CLK : std_logic := '0';
   signal RST : std_logic := '1';
   signal C : std_logic_vector(15 downto 0) := (others => '0');

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: microproc PORT MAP (
          A => A,
          OP => OP,
          B => B,
          CLK => CLK,
          RST => RST,
          C => C
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;
		
      -- insert stimulus here 
		
      wait;
   end process;

END;
