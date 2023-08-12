--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:20:54 03/15/2023
-- Design Name:   
-- Module Name:   E:/E/document/ise/CA_VHDL_HW1_9928041/array_multiplier/array_multiplier_tb.vhd
-- Project Name:  array_multiplier
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: array_multiplier
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
USE ieee.numeric_std.ALL;
 
ENTITY carry_save_multiplier_tb IS
END carry_save_multiplier_tb;
 
ARCHITECTURE behavior OF carry_save_multiplier_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT carry_save_multiplier
    PORT(
         A : IN  std_logic_vector(5 downto 0);
         B : IN  std_logic_vector(5 downto 0);
         P : OUT  std_logic_vector(11 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(5 downto 0) := (others => '0');
   signal B : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal P : std_logic_vector(11 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: carry_save_multiplier PORT MAP (
          A => A,
          B => B,
          P => P
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      -- insert stimulus here 
		for i in 63 downto 0 loop
			A <= std_logic_vector(to_Unsigned(i,6));
			for j in 63 downto 0 loop
				B <= std_logic_vector(to_Unsigned(j,6));
				wait for 0.24 ns;
			end loop;
		end loop;
	wait;
   end process;

END;
