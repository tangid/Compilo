--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:25:35 05/28/2018
-- Design Name:   
-- Module Name:   /home/delanoe/4A/semestre_8/projet_syst/proc/ual/TestBanc.vhd
-- Project Name:  ual
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: BancRegistre
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
 
ENTITY TestBanc IS
END TestBanc;
 
ARCHITECTURE behavior OF TestBanc IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT BancRegistre
    PORT(
         adr_A : IN  std_logic_vector(15 downto 0);
         adr_B : IN  std_logic_vector(15 downto 0);
         adr_W : IN  std_logic_vector(15 downto 0);
         W : IN  std_logic;
			RST : IN  std_logic;
         DATA : IN  std_logic_vector(15 downto 0);
         QA : OUT  std_logic_vector(15 downto 0);
         QB : OUT  std_logic_vector(15 downto 0);
         Clock : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal adr_A : std_logic_vector(15 downto 0) := (others => '0');
   signal adr_B : std_logic_vector(15 downto 0) := (others => '0');
   signal adr_W : std_logic_vector(15 downto 0) := (others => '0');
   signal W : std_logic := '0';
	signal RST : std_logic := '1';
   signal DATA : std_logic_vector(15 downto 0) := (others => '0');
   signal Clock : std_logic := '0';

 	--Outputs
   signal QA : std_logic_vector(15 downto 0);
   signal QB : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant Clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: BancRegistre PORT MAP (
          adr_A => adr_A,
          adr_B => adr_B,
          adr_W => adr_W,
          W => W,
			 RST => RST,
          DATA => DATA,
          QA => QA,
          QB => QB,
          Clock => Clock
        );

   -- Clock process definitions
   Clock_process :process
   begin
		Clock <= '0';
		wait for Clock_period/2;
		Clock <= '1';
		wait for Clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for Clock_period*10;
		DATA <= x"8F12" after 100ns;
		adr_W <= x"0002" after 100ns;
		W <= '1' after 110ns;
		RST <= '0' after 300ns;
		adr_A <= x"0002" after 200ns;
      -- insert stimulus here 

      wait;
   end process;

END;
