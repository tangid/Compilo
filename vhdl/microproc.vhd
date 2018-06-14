----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:11:03 06/01/2018 
-- Design Name: 
-- Module Name:    microproc - Structural 
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

entity microproc is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           ins_di : in STD_LOGIC_VECTOR (31 downto 0);
			  Data_di : in STD_LOGIC_VECTOR (15 downto 0);
			  Data_do : out STD_LOGIC_VECTOR (15 downto 0);
			  Data_a : out STD_LOGIC_VECTOR (15 downto 0);
			  Data_we : out STD_LOGIC;
			  ins_a : out STD_LOGIC_VECTOR (15 downto 0));
end microproc;


architecture struct of microproc is
type pl_connect is 
	record
		A : STD_LOGIC_VECTOR (15 downto 0);
		B : STD_LOGIC_VECTOR (15 downto 0);
		C : STD_LOGIC_VECTOR (15 downto 0);
		OP: STD_LOGIC_VECTOR (7 downto 0);
	end record;
	
	component decodeur
		port(Entry: in STD_LOGIC_VECTOR (31 downto 0);
			  A,B,C: out STD_LOGIC_VECTOR (15 downto 0);
			  OP : out STD_LOGIC_VECTOR (7 downto 0));
	end component;
	component IP
		port(CLK : in STD_LOGIC;
			  ipOut : out STD_LOGIC_VECTOR (15 downto 0));
	end component;
	component Pipeline
		port(A,B,C: in STD_LOGIC_VECTOR (15 downto 0);
				OP : in STD_LOGIC_VECTOR (7 downto 0);
				CLK: in STD_LOGIC;
				QOP : out STD_LOGIC_VECTOR (7 downto 0);
			  QA,QB,QC: out STD_LOGIC_VECTOR (15 downto 0));
	end component;
		component Pipeline2
		port(A,B: in STD_LOGIC_VECTOR (15 downto 0);
				OP : in STD_LOGIC_VECTOR (7 downto 0);
				CLK: in STD_LOGIC;
				QOP : out STD_LOGIC_VECTOR (7 downto 0);
			  QA,QB: out STD_LOGIC_VECTOR (15 downto 0));
	end component;
		component ual
		port(A,B: in STD_LOGIC_VECTOR (15 downto 0);
				OP : in STD_LOGIC_VECTOR (3 downto 0);
			  S : out STD_LOGIC_VECTOR (15 downto 0);
			  Flag: out STD_LOGIC_VECTOR (3 downto 0));
	end component;
		component BancRegistre
		port(adr_A,adr_B,adr_W,DATA: in STD_LOGIC_VECTOR (15 downto 0);
			  RST,W,CLK: in STD_LOGIC;
			  QA,QB: out STD_LOGIC_VECTOR (15 downto 0));
	end component;
		component LCBr
		port(OP: in STD_LOGIC_VECTOR (7 downto 0);
				S: out STD_LOGIC);
	end component;
		component LCual
		port(OP:in STD_LOGIC_VECTOR (7 downto 0);
				S: out STD_LOGIC_VECTOR (3 downto 0));
	end component;
		component LCwe
		port(CTRL:in STD_LOGIC_VECTOR (7 downto 0);
				WE: out STD_LOGIC);
	end component;
	
		component MUXBr
		port(A,B : in STD_LOGIC_VECTOR (15 downto 0);
			  CTRL : in STD_LOGIC_VECTOR (7 downto 0);
				S : out STD_LOGIC_VECTOR (15 downto 0));
	end component;
			component MUXual
		port(A,B : in STD_LOGIC_VECTOR (15 downto 0);
			  CTRL : in STD_LOGIC_VECTOR (7 downto 0);
				S : out STD_LOGIC_VECTOR (15 downto 0));
	end component;
			component LCram 
			port (OP:in STD_LOGIC_VECTOR (7 downto 0);
					S: out STD_LOGIC);
	end component;
				component MUXW
		port(A,B : in STD_LOGIC_VECTOR (15 downto 0);
			  CTRL : in STD_LOGIC_VECTOR (7 downto 0);
				S : out STD_LOGIC_VECTOR (15 downto 0));
	end component;
	component MUXaRam
		port(A,B : in STD_LOGIC_VECTOR (15 downto 0);
			  CTRL : in STD_LOGIC_VECTOR (7 downto 0);
				S : out STD_LOGIC_VECTOR (15 downto 0));
	end component;
	
	signal DEC : pl_connect;
	signal LIC : pl_connect;
	signal DIC : pl_connect;
	signal EXC : pl_connect;
	signal MEC : pl_connect;
	signal Sual : STD_LOGIC_VECTOR (15 downto 0);
	signal SmuxB : STD_LOGIC_VECTOR (15 downto 0);	
	signal SmuxC : STD_LOGIC_VECTOR (15 downto 0);
	signal SmuxU : STD_LOGIC_VECTOR (15 downto 0);
	signal SigMWB : STD_LOGIC_VECTOR (15 downto 0);
	signal SORT : pl_connect;
	signal SW : STD_LOGIC;
	signal Sig_we : STD_LOGIC;
	signal SDW : STD_LOGIC;
	signal Flag : STD_LOGIC_VECTOR (3 downto 0);
	signal SigU : STD_LOGIC_VECTOR (3 downto 0);
begin
	MemIns:IP port map(CLK,ins_a);
	DECO:decodeur port map(ins_di,DEC.A,DEC.B,DEC.C,DEC.OP);
	LIDI:Pipeline	port map(DEC.A,DEC.B,DEC.C,DEC.OP,CLK,LIC.OP,LIC.A,LIC.B,LIC.C);
	DIEX:Pipeline	port map(LIC.A,SmuxB,SmuxC,LIC.OP,CLK,DIC.OP,DIC.A,DIC.B,DIC.C);
	EXMEM:Pipeline2	port map(DIC.A,SmuxU,DIC.OP,CLK,EXC.OP,EXC.A,EXC.B);
	MEMRE:Pipeline2	port map(EXC.A,EXC.B,EXC.OP,CLK,MEC.OP,MEC.A,MEC.B);
	BR:BancRegistre	port map(LIC.B,LIC.C,MEC.A,SigMWB,RST,SW,CLK,SORT.A,SORT.B);
	UA:ual	port map(DIC.B,DIC.C,SigU,Sual,Flag);
	LCB:LCBr port map( MEC.OP,SW);
	LCU:LCual port map(DIC.OP,SigU);
	LCW : LCwe port map(EXC.OP,Data_we);
	MuxB : MUXBr port map (LIC.B,SORT.A,LIC.OP,SmuxB);
	MuxB2 : MUXBr port map (LIC.C,SORT.B,LIC.OP,SmuxC);
	MuxU : MUXual port map (DIC.B,Sual,DIC.OP,SmuxU);
	MUXWBR : MUXW port map (MEC.B,Data_di,MEC.OP,SigMWB);
	MUXa : MUXaRam port map (EXC.A,EXC.B,EXC.OP,Data_a);
	Data_do <= EXC.B;
end struct;