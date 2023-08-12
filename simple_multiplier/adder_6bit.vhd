
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity adder_6bit is
    Port ( in1,in2 : in  STD_LOGIC_VECTOR (5 downto 0);
           cin : in  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (5 downto 0);
           cout : out  STD_LOGIC);
end adder_6bit;

architecture Behavioral of adder_6bit is

component FA 
    Port ( A,B,Cin : in  STD_LOGIC;
           S,Cout : out  STD_LOGIC);
end component;

signal c1,c2,c3,c4,c5: STD_LOGIC ;

begin

FA1: FA port map( in1(0), in2(0), cin, sum(0), c1);
FA2: FA port map( in1(1), in2(1), c1, sum(1), c2);
FA3: FA port map( in1(2), in2(2), c2, sum(2), c3);
FA4: FA port map( in1(3), in2(3), c3, sum(3), c4);
FA5: FA port map( in1(4), in2(4), c4, sum(4), c5);
FA6: FA port map( in1(5), in2(5), c5, sum(5), cout);

end Behavioral;

