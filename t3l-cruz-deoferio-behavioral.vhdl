library IEEE; use IEEE.std_logic_1164.all;
entity alarm is
	port(output: out std_logic; i0,i1,i2,o0,o1,o2: in std_logic);
end entity alarm;

architecture alarm of alarm is begin
	output <= (i0 or i1 or i2) and (o0 or o1 or o2);
end alarm;
