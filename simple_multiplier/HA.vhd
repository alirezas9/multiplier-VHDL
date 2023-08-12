
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity HA is
    Port ( A,B : in  STD_LOGIC;
           S,Cout : out  STD_LOGIC);
end HA;

architecture Behavioral of HA is

begin

S <= A XOR B;
Cout <= A AND B;

end Behavioral;

