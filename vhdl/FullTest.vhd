--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:06:26 06/12/2018
-- Design Name:   
-- Module Name:   /home/delanoe/4A/semestre_8/projet_syst/proc/ual/FullTest.vhd
-- Project Name:  ual
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: chemin_de_donnee
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
 
ENTITY FullTest IS
END FullTest;
 
ARCHITECTURE behavior OF FullTest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT chemin_de_donnee
    PORT(
         sys_clk : IN  std_logic;
         sys_rst : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal sys_clk : std_logic := '0';
   signal sys_rst : std_logic := '1';

   -- Clock period definitions
   constant sys_clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: chemin_de_donnee PORT MAP (
          sys_clk => sys_clk,
          sys_rst => sys_rst
        );

   -- Clock process definitions
   sys_clk_process :process
   begin
		sys_clk <= '0';
		wait for sys_clk_period/2;
		sys_clk <= '1';
		wait for sys_clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for sys_clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
