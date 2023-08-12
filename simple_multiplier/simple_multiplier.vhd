library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity simple_multiplier is
    Port ( A,B : in  STD_LOGIC_VECTOR (5 downto 0);
           P : out  STD_LOGIC_VECTOR (11 downto 0));
end simple_multiplier;

architecture Behavioral of simple_multiplier is

type arr2d is array (0 to 5) of std_logic_vector(5 downto 0);
signal AB, s : arr2d;
signal co : STD_LOGIC_VECTOR (4 downto 0);

component adder_6bit is
    Port ( in1 : in  STD_LOGIC_VECTOR (5 downto 0);
           in2 : in  STD_LOGIC_VECTOR (5 downto 0);
           cin : in  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (5 downto 0);
           cout : out  STD_LOGIC);
end component;


begin

ands: for i in 0 to 5 generate
   ands2: for j in 0 to 5 generate
    AB(i)(j) <= A(i) and B(j); 
   end generate; 
end generate;

add1 : adder_6bit
		port map(
			in1(5 downto 0) => AB(1)(5 downto 0),
			in2(5) => '0'								,
			in2(4 downto 0) => AB(0)(5 downto 1),
			cin => '0' 									,
			sum => s(0)(5 downto 0)					,
			cout => co(0)
			);
			
add2 : adder_6bit
		port map(
			in1(5 downto 0) => AB(2)(5 downto 0),
			in2(5) => co(0)								,
			in2(4 downto 0) => s(0)(5 downto 1),
			cin => '0' 									,
			sum => s(1)(5 downto 0)					,
			cout => co(1)
			);
			
add3 : adder_6bit
		port map(
			in1(5 downto 0) => AB(3)(5 downto 0),
			in2(5) => co(1)								,
			in2(4 downto 0) => s(1)(5 downto 1),
			cin => '0' 									,
			sum => s(2)(5 downto 0)					,
			cout => co(2)
			);
			
add4 : adder_6bit
		port map(
			in1(5 downto 0) => AB(4)(5 downto 0),
			in2(5) => co(2)								,
			in2(4 downto 0) => s(2)(5 downto 1),
			cin => '0' 									,
			sum => s(3)(5 downto 0)					,
			cout => co(3)
			);
add5 : adder_6bit
		port map(
			in1(5 downto 0) => AB(5)(5 downto 0),
			in2(5) => co(3)								,
			in2(4 downto 0) => s(3)(5 downto 1),
			cin => '0' 									,
			sum => s(4)(5 downto 0)					,
			cout => co(4)
			);		
		
-- final values
P(0) <= AB(0)(0);
P(1) <= s(0)(0);
P(2) <= s(1)(0);
P(3) <= s(2)(0);
P(4) <= s(3)(0);
P(5) <= s(4)(0);
P(10 downto 6) <= s(4)(5 downto 1);
P(11) <= co(4);

end Behavioral;

