library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity relogio is
	port(
		conf: in std_logic;
		set: in std_logic_vector (1 downto 0);
		mode: in std_logic_vector (1 downto 0);
		STR: in std_logic;
		clock: in std_logic;
		
		
		disp_h: out std_logic_vector (3 downto 0);
		disp_m: out std_logic_vector (5 downto 0);
		disp_s: out std_logic_vector (5 downto 0)
	
	);
end relogio;


architecture relogio of relogio is
	component buttom_press is 
		port(
			str: in std_logic;
			clock: in std_logic;
			saida: out std_logic
		);
	end component;


signal hour: std_logic_vector (3 downto 0):= "0000";
signal min: std_logic_vector (5 downto 0):= "000000";

signal pressionado: std_logic;

begin
		pressinou: buttom_press port map( STR,clock,pressionado);
		
		process(mode,set)
			begin
				if(mode = "00") then -- se o usuario selecionou relogio posso entrar no relogio
					
					-- componente divisor de freq;
					if(clock= '1' and clock'EVENT) then
							

						if(pressionado = '1') then		-- se ele apertou o botao STR ele quer adicionar +1 em um  valor
								
							--	subida <=STR;

							if(set = "00") then		-- verifico se ele quer mexer na hora
								hour <= hour + "0001";
								disp_h <= hour;
							end if;
							
							if( set = "01") then		-- verifico se ele quer mexer nos minutos
								min <= min + "000001";
								disp_m <= min;
							end if;
							
												
						end if;
						
				
					
						
						
				
						
					end if;
					
						
					
				end if;
				
			end process;

end relogio;
