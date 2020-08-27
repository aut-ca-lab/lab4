----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:02:00 08/27/2020 
-- Design Name: 
-- Module Name:    carry_lookahead_adder - structure 
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

entity carry_lookahead_adder is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC);
end carry_lookahead_adder;

architecture structure of carry_lookahead_adder is

	component carry_calc is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
			  cin : in STD_LOGIC;
           C : out  STD_LOGIC_VECTOR (4 downto 0));
	end component carry_calc;

	component full_adder is
    Port ( i0 : in  STD_LOGIC;
           i1 : in  STD_LOGIC;
			  cin : in  STD_LOGIC;
           s : out  STD_LOGIC;
           cout : out  STD_LOGIC);
	end component full_adder;
	
	signal carry_vec : STD_LOGIC_VECTOR (4 downto 0);
	signal temp_vec : STD_LOGIC_VECTOR (3 downto 0);
	
begin
					
					-------				Calculate all carry bits				-------
					
	 carry_calc_instance0: carry_calc port map ( A => A, B => B, cin => cin , C => carry_vec);	
					
					
					-------				Fulladders with pre-defined carry bits				-------
					
					
	 full_adder_instance0: full_adder port map ( i0 => A(0), i1 => B(0), cin => carry_vec(0) ,cout => temp_vec(0), s => S(0));
	 full_adder_instance1: full_adder port map ( i0 => A(1), i1 => B(1), cin => carry_vec(1) ,cout => temp_vec(1), s => S(1));
	 full_adder_instance2: full_adder port map ( i0 => A(2), i1 => B(2), cin => carry_vec(2) ,cout => temp_vec(2), s => S(2));
	 full_adder_instance3: full_adder port map ( i0 => A(3), i1 => B(3), cin => carry_vec(3) ,cout => temp_vec(3), s => S(3));
		
	 cout <= carry_vec(4);

end structure;

