library IEEE; use IEEE.std_logic_1164.all;
entity alarm_behav is
	port(output: out std_logic; i0,i1,i2,o0,o1,o2: in std_logic);
end entity alarm_behav;

architecture alarm_behav of alarm_behav is begin
	output <= (i0 or i1 or i2) and (o0 or o1 or o2);
end architecture alarm_behav;

library IEEE; use IEEE.std_logic_1164.all;
entity and2 is 
	port(o0: out std_logic; i0, i1: in std_logic);
end entity and2;

architecture and2 of and2 is begin
	o0 <= i0 and i1;
end architecture and2;

library IEEE; use IEEE.std_logic_1164.all;
entity or2 is 
	port(o0: out std_logic; i0, i1, i2: in std_logic);
end entity or2;

architecture or2 of or2 is begin
	o0 <= i0 or i1 or i2;
end architecture or2;

library IEEE; use IEEE.std_logic_1164.all;
entity alarm_struct is 
	port(a, b, c, d, e, f: in std_logic; output: out std_logic);
end entity alarm_struct;
	
architecture struct of alarm_struct is
signal g, h, i: std_logic;

	component or2 is
	port(o0: out std_logic; i0, i1, i2: in std_logic);
	end component or2;
	
	component and2 is
	port(o0: out std_logic; i0, i1: in std_logic);
	end component and2;
	
	begin
	g0: component or2 port map(g, a, b, c);
	g1: component or2 port map(h, d, e, f);
	g2: component and2 port map(i, g, h);
end architecture struct;
