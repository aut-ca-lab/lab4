----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:36:10 08/27/2020 
-- Design Name: 
-- Module Name:    carry_select_adder - structure 
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

entity carry_select_adder is
    Port ( A : in  STD_LOGIC_vector (3 downto 0);
           B : in  STD_LOGIC_vector (3 downto 0);
           cin : in  STD_LOGIC;
           S : out  STD_LOGIC_vector (3 downto 0);
           cout : out  STD_LOGIC);
end carry_select_adder;

architecture structure of carry_select_adder is

	
	component mux_2to1 is
		Port ( in0 : in  STD_LOGIC;
				in1 : in  STD_LOGIC;
				S : in  STD_LOGIC;
				out0 : out  STD_LOGIC);
	end component mux_2to1;

	component full_adder is
    Port ( i0 : in  STD_LOGIC;
           i1 : in  STD_LOGIC;
			  cin : in  STD_LOGIC;
           s : out  STD_LOGIC;
           cout : out  STD_LOGIC);
	end component full_adder;
	
	signal cin_1_1 , cin_2_1 , cin_3_1, cin_1_2 , cin_2_2 , cin_3_2 , cout0, cout1: STD_LOGIC;
	signal S_0, S_1 : STD_LOGIC_VECTOR (3 downto 0);

begin
	
							-------				Fulladders of layer 1				-------
							
	
	 full_adder_instance0:full_adder port map ( i0 => A(0), i1 => B(0), cin => '0' ,cout => cin_1_1, s => S_0(0));
	 full_adder_instance1:full_adder port map ( i0 => A(1), i1 => B(1), cin => cin_1_1 ,cout => cin_2_1, s => S_0(1));
	 full_adder_instance2:full_adder port map ( i0 => A(2), i1 => B(2), cin => cin_2_1 ,cout => cin_3_1, s => S_0(2));
	 full_adder_instance3:full_adder port map ( i0 => A(3), i1 => B(3), cin => cin_3_1 ,cout => cout0, s => S_0(3));


							-------				Fulladders of layer 2				-------
							
	 
	 full_adder_instance4:full_adder port map ( i0 => A(0), i1 => B(0), cin => '1' ,cout => cin_1_2, s => S_1(0));
	 full_adder_instance5:full_adder port map ( i0 => A(1), i1 => B(1), cin => cin_1_2 ,cout => cin_2_2, s => S_1(1));
	 full_adder_instance6:full_adder port map ( i0 => A(2), i1 => B(2), cin => cin_2_2 ,cout => cin_3_2, s => S_1(2));
	 full_adder_instance7:full_adder port map ( i0 => A(3), i1 => B(3), cin => cin_3_2 ,cout => cout1, s => S_1(3));
	 
	 
	 						-------				MUX for select S(i) bits				-------
	 

	 mux_2to1_instance0:mux_2to1 port map ( in0 => S_0(0), in1 => S_1(0), S => cin , out0 => S(0));
	 mux_2to1_instance1:mux_2to1 port map ( in0 => S_0(1), in1 => S_1(1), S => cin , out0 => S(1));
	 mux_2to1_instance2:mux_2to1 port map ( in0 => S_0(2), in1 => S_1(2), S => cin , out0 => S(2));
	 mux_2to1_instance3:mux_2to1 port map ( in0 => S_0(3), in1 => S_1(3), S => cin , out0 => S(3));
	 
	 
	 	 						-------				MUX for select cout bit				-------

	 
	 mux_2to1_instance4:mux_2to1 port map ( in0 => cout0, in1 => cout1, S => cin , out0 => cout);

end structure;

