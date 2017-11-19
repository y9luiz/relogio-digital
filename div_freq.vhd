library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity div_freq is

	port(
	 clock_in:	 in std_logic;
	 cont: in std_logic_vector (25 downto 0);
	 clock_out: out std_logic
	 
	 

	);

end div_freq;


architecture div_freq of div_freq is
signal contagem: std_logic_vector (25 downto 0):= cont ;
	
	begin
		
		process(clock_in,contagem)
			begin
			
			if(clock_in = '1' and clock_in'EVENT) then
				--if(contagem < "10111110101111000010000000") then
				if(contagem < "01") then

					contagem <= contagem +'1';
					clock_out <= not clock_in;
				else
					contagem <="00000000000000000000000000";
					clock_out <= clock_in;
				end if;
			end if;	
		end process;
		
		
end div_freq;