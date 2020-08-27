--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:35:53 08/27/2020
-- Design Name:   
-- Module Name:   E:/Education/CA/Lab/LAB_4/Code/ripple_adder_testbench.vhd
-- Project Name:  LAB_4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ripple_adder
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
 
ENTITY ripple_adder_testbench IS
END ripple_adder_testbench;
 
ARCHITECTURE behavior OF ripple_adder_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ripple_adder
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         cin : IN  std_logic;
         cout : OUT  std_logic;
         S : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal cin : std_logic := '0';

 	--Outputs
   signal cout : std_logic;
   signal S : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ripple_adder PORT MAP (
          A => A,
          B => B,
          cin => cin,
          cout => cout,
          S => S
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		A <= "1010";
		B <= "1100";
		cin <= '0';
		wait for 30 ns;
		
		A <= "1010";
		B <= "1111";
		cin <= '1';
		wait for 30 ns;
		
		A <= "1011";
		B <= "1101";
		cin <= '0';
		wait for 30 ns;
		
		A <= "1110";
		B <= "1100";
		cin <= '1';
		wait for 30 ns;
		
		A <= "1111";
		B <= "1101";
		cin <= '0';
		wait for 30 ns;
		
		A <= "1110";
		B <= "1111";
		cin <= '1';
		wait for 30 ns;
		
		A <= "1111";
		B <= "1111";
		cin <= '1';
		wait for 30 ns;
		
		
      wait;
   end process;

END;
