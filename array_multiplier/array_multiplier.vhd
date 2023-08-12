----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:15:22 03/14/2023 
-- Design Name: 
-- Module Name:    array_multiplier - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;

entity array_multiplier is
    Port ( A,B : in  STD_LOGIC_VECTOR (5 downto 0);
           P : out  STD_LOGIC_VECTOR (11 downto 0));
end array_multiplier;

architecture Behavioral of array_multiplier is
-- components

component HA
    Port ( A,B : in  STD_LOGIC;
           S,Cout : out  STD_LOGIC);
end component;

component FA 
    Port ( A,B,Cin : in  STD_LOGIC;
           S,Cout : out  STD_LOGIC);
end component;

-- signals

type arr2d is array (0 to 5) of std_logic_vector(5 downto 0);
signal AB, s : arr2d;
signal si , ci : arr2d;
-- signal A_new : STD_logic_vector(4 downto 0);
begin

ands: for i in 0 to 5 generate
   ands2: for j in 0 to 5 generate
    AB(i)(j) <= A(i) and B(j); 
   end generate; 
end generate;

HAs: 
	for i in 0 to 4 generate
		HA_i : HA port map(
			A    => AB(i+1)(0)		, 
			B    => AB(i)(1)			,
			S    => si(0)(i)			,
			Cout => ci(0)(i)
			);
	end generate HAs;	
	
FAs :  
	for j in 0 to 3 generate
		row : for k in 0 to 3 generate
						FA_jk : FA port map(				
							A    => si(j)(k+1)	, 
							B    => AB(k)(j+2)	,
							Cin  => ci(j)(k) 		,
							S    => si(j+1)(k) 	,
							Cout => ci(j+1)(k)			
						);					
					
				end generate;
						FA_j4 : FA port map(				
							A    => 	AB(5)(j+1)	, 
							B    => AB(4)(j+2)	,
							Cin  => ci(j)(4) 		,
							S    => si(j+1)(4) 	,
							Cout => ci(j+1)(4)			
						);		
	end generate FAs;
	
FA_40 : HA port map(				
				A    => si(4)(1)		, 
				B    => ci(4)(0)		,
				S    => si(5)(0) 		,
				Cout => ci(5)(0)			
						);		

FA_4k: 
	for k in 0 to 2 generate
		FA_i : FA port map(
			A    => si(4)(k+2)		, 
			B    => ci(4)(k+1)		,
			Cin  => ci(5)(k) 			,
			S    => si(5)(k+1)		,
			Cout => ci(5)(k+1)
			);
	end generate FA_4k;	
FA_44 : FA port map(				
							A    => si(4)(4)	, 
							B    => AB(5)(5)	,
							Cin  => ci(5)(3) 	,
							S    => si(5)(4) 	,
							Cout => ci(5)(4)			
						);				
-- final P values
P(0) <= AB(0)(0);
P(1) <= si(0)(0);
P(2) <= si(1)(0);
P(3) <= si(2)(0);
P(4) <= si(3)(0);
P(5) <= si(4)(0);
P(6) <= si(5)(0);
P(7) <= si(5)(1);
P(8) <= si(5)(2);
P(9) <= si(5)(3);
P(10) <= si(5)(4);
P(11) <= ci(5)(4);

end Behavioral;

