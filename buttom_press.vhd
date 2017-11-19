library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity buttom_press is
	port(
		str: in std_logic;
		clock: in std_logic;
		saida: out std_logic
	);
	
end buttom_press;

architecture buttom_press of buttom_press is
	
		component FF_D is
			port(
				D:in std_logic;
				clock:in std_logic;
				Q: out std_logic;
				Qbar: out std_logic
			
			
			
			);
			
		end component;
	
		
signal out_ff : std_logic;
signal out_ff_bar : std_logic;
signal atraso : std_logic_vector (2 downto 0);

		begin
		
		
			process(STR, out_ff)
			begin
				if(  (STR = '1' and  out_ff= '0')) then
				
					saida <= '1';
					
				
					else
						saida<='0';
				end if;
			
			
			end process;
			FF1: FF_D port map(str,clock,out_ff,out_ff_bar);
		
						
			
				
		
	
end buttom_press;
	