
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity FA is
    Port ( A,B,Cin : in  STD_LOGIC;
           S,Cout : out  STD_LOGIC);
end FA;

architecture Behavioral of FA is

signal t0 : STD_LOGIC;
signal t1: STD_LOGIC;
signal t2: STD_LOGIC;

begin

t0 <=  A XOR B ;
S <= t0 XOR Cin ;
t1 <= A AND B;
t2 <= t0 AND Cin;
Cout <= t1 OR t2 ;

end Behavioral;

