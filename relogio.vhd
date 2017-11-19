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
		
		disp_h1: out std_logic_vector (6 downto 0);
		disp_h2: out std_logic_vector (6 downto 0);

		disp_m1: out std_logic_vector (6 downto 0);
		disp_m2: out std_logic_vector (6 downto 0);

		disp_s1: out std_logic_vector (6 downto 0);
		disp_s2: out std_logic_vector (6 downto 0)

	
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
	
	component display is
		port(
		I: in std_logic_vector (3 downto 0);
		O: out std_logic_vector (6 downto 0)
		);
	end component;
	

signal hour1: std_logic_vector (3 downto 0):= "0000";
signal hour2: std_logic_vector (3 downto 0):= "0000";

signal min1: std_logic_vector (3 downto 0):= "0000";
signal min2: std_logic_vector (3 downto 0):= "0000";

signal seg1: std_logic_vector (3 downto 0):= "0000";
signal seg2: std_logic_vector (3 downto 0):= "0000";

signal pressionado: std_logic;
signal apertou_conf: std_logic:='0';


begin
	--divisor_freq: div_freq port map(clock,cont_clocks,div_clock);

		pressinou: buttom_press port map( STR,clock,pressionado);
		process(mode,set)
			begin
				if(mode = "00") then -- se o usuario selecionou relogio posso entrar no relogio
					
					-- componente divisor de freq;
					if(clock= '1' and clock'EVENT) then
							if(conf = '1') then -- se o usuario apertar em conf, ele quer mudar a hora
								apertou_conf <= '1'; -- variavel auxiliar para testar se apertou
							end if;
						
						if(pressionado = '1' and apertou_conf = '1' ) then		-- se ele apertou o botao STR ele quer adicionar +1 em um  valor
								
							--	subida <=STR;

							if(set = "00") then		-- verifico se ele quer mexer na hora
								hour2 <= hour2 + "0001";
								if(hour2= "1010") then
									hour1 <= hour1 + "0001";
									hour2 <= "0000";
								end if;
							end if;
							
							if( set = "01") then		-- verifico se ele quer mexer nos minutos
								min2 <= min2 + "0001";
								if(min2 = "1010") then
									min1 <= min1 + "0001";
									min2 <= "0000";
								end if;
							end if;
							
							if(set = "10") then
								apertou_conf <= '0';		-- espere ate o usuario setar todos os valores para permitir que ele sete novamente
								
							end if;
							
							
												
						end if;
						
					 if(apertou_conf = '0') then
						seg2 <= seg2 + "0001";
						
						if(seg2 = "1010") then
							seg1 <= seg1+"0001";
							seg2 <= "0000";
							if(seg1 = "0110") then
								min2 <= min2 + "0001";
								seg1 <="0000";
								if(min2 = "1010") then
									min1 <= min2 + "0001";
									min2 <= "0000";
									if(min1 = "0110") then
										min1 <= "0000";
										hour2 <= hour2 + "0001";
										if(hour2 = "1010") then 
											hour1 <= hour1 + "0001";
											hour2 <= "0000";
										end if;
										if(hour2 = "0100" and hour1 = "0010") then -- se hora1 for 2 e hora2 for 4, temos 24 horas que ´e 00
											hour2 <= "0000";
											hour1 <= "0000";
										end if;
									end if;
								end if;
							end if;
						end if;
						
						
					 
					 end if;
						
						
						
						
				
						
					end if;
					
						
					
				end if;
				
				
			
			end process;
						Dh1: display port map (hour1,disp_h1);
						Dh2: display port map (hour2,disp_h2);
						
						Dm1: display port map (min1,disp_m1);
						Dm2: display port map (min2,disp_m2);
						
						Ds1: display port map (seg1,disp_s1);
						Ds2: display port map (seg2,disp_s2);



end relogio;
