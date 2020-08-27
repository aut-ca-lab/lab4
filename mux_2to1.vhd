----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:38:20 08/27/2020 
-- Design Name: 
-- Module Name:    mux_2to1 - structure 
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

entity mux_2to1 is
    Port ( in0 : in  STD_LOGIC;
           in1 : in  STD_LOGIC;
           S : in  STD_LOGIC;
           out0 : out  STD_LOGIC);
end mux_2to1;

architecture structure of mux_2to1 is
	
	component and_gate is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : out  STD_LOGIC);
	end component and_gate;
	
	component or_gate is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : out  STD_LOGIC);
	end component or_gate;
	
	component not_gate is
    Port ( A : in  STD_LOGIC;
           B : out  STD_LOGIC);
	end component not_gate;
	
	signal s_not, w1, w2: STD_LOGIC;
	
begin

	not_gate_instance0: not_gate port map ( A => S, B => s_not);
	
	and_gate_instance0: and_gate port map ( A => in0, B => s_not, C => w1);
	and_gate_instance1: and_gate port map ( A => in1, B => S, C => w2);

	or_gate_instance0: or_gate port map ( A => w1, B => w2, C => out0);
	
end structure;

