----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:31:28 03/15/2023 
-- Design Name: 
-- Module Name:    carry_save_multiplier - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

entity carry_save_multiplier is
    Port ( A,B : in  STD_LOGIC_VECTOR (5 downto 0);
           P : out  STD_LOGIC_VECTOR (11 downto 0));
end carry_save_multiplier;

architecture Behavioral of carry_save_multiplier is
--components
component MA 
    Port ( x,y,si,ci : in  STD_LOGIC;
           so,co : out  STD_LOGIC);
end component;



--signals
type arr2d is array (0 to 6) of std_logic_vector(5 downto 0);
signal s,c: arr2d;

	begin


 
ma_0i : for i in 0 to 5 generate	--ok
				ma_i : ma port map(
							x  => A(i)				,
							y  => B(0)				,
							si => '0' 				,
							ci => '0' 				,
							so => s(0)(i)  		,
							co => c(0)(i)  
							);
			end generate ma_0i;

mas : for j in 1 to 5 generate
	row : for k in 0 to 4 generate
				ma_jk: ma port map(--ok
							x  => A(k)				,
							y  => B(j)				,
							si => s(j-1)(k+1) 	,
							ci => c(j-1)(k) 		,
							so => s(j)(k)  		,
							co => c(j)(k)	
							);			  
			  end generate;

				ma_j5: ma port map(--ok
							x  => A(5)				,
							y  => B(j)				,
							si => '0' 				,
							ci => c(j-1)(5) 		,
							so => s(j)(5)  		,
							co => c(j)(5)	
							);
		end generate mas;
		
		ma_60 : ma port map(--ok
							x  => '0'				,
							y  => '1'				,
							si => s(5)(1) 			,
							ci => c(5)(0) 			,
							so => s(6)(0)  		,
							co => c(6)(0)	
						);
ma_6k : for k in 1 to 4 generate
			ma_k : ma port map(
							x  => c(5)(k)		   ,
							y  => '1'				,
							si => s(5)(k+1) 		,
							ci => c(6)(k-1) 		,
							so => s(6)(k)  		,
							co => c(6)(k)	
							); 			
			end generate ma_6k;
			ma_65 : ma port map(	--ok
							x  => c(5)(5)			,
							y  => '1'				,
							si => '0' 				,
							ci => c(6)(4) 			,
							so => s(6)(5)  		,
							co => c(6)(5)	
						);
					
-- final values
--P(0) <= s(0)(0);
--P(1) <= s(1)(0);
--P(2) <= s(2)(0);
--P(3) <= s(3)(0);
--P(4) <= s(4)(0);
--P(5) <= s(5)(0);
--P(6) <= s(6)(0);
--p(7) <= s(6)(1);
--p(8) <= s(6)(2);
--p(9) <= s(6)(3);
--p(10) <= s(6)(4);
--p(11) <= s(6)(5);
P_0_6 : for i in 0 to 6 generate
		P(i) <= s(i)(0) ;
		end generate P_0_6;
P_7_11 : for i in 7 to 11 generate
		P(i) <= s(6)(i-6) ;
		end generate P_7_11;
end Behavioral;

