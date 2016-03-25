library IEEE; use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_pa is	
	constant DELAY: time := 10 ns;
end entity;

architecture pa_tb of tb_pa is

	component alarm is
		port(output: out std_logic; i0,i1,i2,o0,o1,o2: in std_logic);
	end component alarm;
	
	signal output: std_logic;
	signal i0,i1,i2,o0,o1,o2: std_logic;
	
begin --architecture

	uut: component alarm port map(output,i0,i1,i2,o0,o1,o2);
	main: process is
			variable temp: unsigned(5 downto 0);
			variable expected_output: std_logic;
			variable error_count: integer := 0;
			
	begin --process
	
		report "start simulation";
		
		for i in 63 to 0 loop
			temp := TO_UNSIGNED(i, 6);
			
			--assign each input a value from temp
			i0 <= temp(0);
			i1 <= temp(1);
			i2 <= temp(2);
			o0 <= temp(3);
			o1 <= temp(4);
			o2 <= temp(5);
				
			if(i mod 8 = 0) then expected_output := '0';
			elsif (i >= 56 ) then expected_output := '0';
			else expected_output := '1';
			end if;
	
			wait for DELAY;
			
			assert((expected_output = output))
				report "ERROR: Expected output " & std_logic'image(expected_output) &  " /= actual output " & 
					std_logic'image(output) & " at time " & time'image(now);
				
			if  ((expected_output /= output))
				then error_count := error_count + 1;
			end if;
		end loop;
		
		wait for DELAY;
		assert (error_count = 0)
			report "ERROR: There were " &
				integer'image(error_count) & " errors!";
			if(error_count = 0)
				then report "Simulation completed with NO errors.";
			end if;
		wait;
	end process;
end architecture pa_tb;

