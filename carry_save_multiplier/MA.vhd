library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MA is
    Port ( x,y,si,ci : in  STD_LOGIC;
           so,co : out  STD_LOGIC);
end MA;

architecture Behavioral of MA is

	component FA 
		 Port ( A,B,Cin : in  STD_LOGIC;
				  S,Cout : out  STD_LOGIC);
	end component;

	signal xy:std_logic ;

	begin
		xy <= x AND y;
		FA1: FA port map( si, xy, ci, so, co);

end Behavioral;

