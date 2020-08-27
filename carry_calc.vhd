----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:05:06 08/27/2020 
-- Design Name: 
-- Module Name:    carry_calc - Behavioral 
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

entity carry_calc is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
			  cin : in STD_LOGIC;
           C : out  STD_LOGIC_VECTOR (4 downto 0));
end carry_calc;

architecture structure of carry_calc is
	
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
	
	component xor_gate is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : out  STD_LOGIC);
	end component xor_gate;

	signal p_vec , g_vec : STD_LOGIC_VECTOR (3 downto 0);
	signal w1_1, c_1 , w2_1, c_2, w3_1, c_3, w4_1, c_4 : STD_LOGIC;
	
begin

						-------      P(i) and G(i)     -------
						
		and_gate_instance0: and_gate port map ( A => A(0), B => B(0), C=> g_vec(0));
		and_gate_instance1: and_gate port map ( A => A(1), B => B(1), C=> g_vec(1));
		and_gate_instance2: and_gate port map ( A => A(2), B => B(2), C=> g_vec(2));
		and_gate_instance3: and_gate port map ( A => A(3), B => B(3), C=> g_vec(3));
		
		xor_gate_instance0: xor_gate port map ( A => A(0), B => B(0), C=> p_vec(0));
		xor_gate_instance1: xor_gate port map ( A => A(1), B => B(1), C=> p_vec(1));
		xor_gate_instance2: xor_gate port map ( A => A(2), B => B(2), C=> p_vec(2));
		xor_gate_instance3: xor_gate port map ( A => A(3), B => B(3), C=> p_vec(3));


						------- carry 0 is pre-defined -------
		

						-------        carry 1         -------

		
		and_gate_instance4: and_gate port map ( A => cin, B => p_vec(0), C=> w1_1 );
		or_gate_instance0: or_gate port map ( A => w1_1, B => g_vec(0), C=> c_1 );

		
						-------        carry 2         -------
						
		
		and_gate_instance5: and_gate port map ( A => c_1, B => p_vec(1), C=> w2_1 );
		or_gate_instance1: or_gate port map ( A => w2_1, B => g_vec(1), C=> c_2 );


						-------        carry 3         -------
						
						
		and_gate_instance6: and_gate port map ( A => c_2, B => p_vec(2), C=> w3_1 );
		or_gate_instance2: or_gate port map ( A => w3_1, B => g_vec(2), C=> c_3 );
		
		
						-------        carry 4         -------


		and_gate_instance7: and_gate port map ( A => c_3, B => p_vec(3), C=> w4_1 );
		or_gate_instance3: or_gate port map ( A => w4_1, B => g_vec(3), C=> c_4 );


						-------        results         -------
		
		
		C(0) <= cin;
		C(1) <= c_1;
		C(2) <= c_2;
		C(3) <= c_3;
		C(4) <= c_4;
		
end structure;

