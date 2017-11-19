library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity modo_selecao is
	port(
		change_mode: in std_logic;
		conf: in std_logic;
		clock: in std_logic;
		set: in std_logic;
		STR: in std_logic;

		
		mode_test: out std_logic_vector (1 downto 0);
		disp_h1: out std_logic_vector (6 downto 0);
		disp_h2: out std_logic_vector (6 downto 0);

		disp_m1: out std_logic_vector (6 downto 0);
		disp_m2: out std_logic_vector (6 downto 0);

		disp_s1: out std_logic_vector (6 downto 0);
		disp_s2: out std_logic_vector (6 downto 0)
	
	);
end modo_selecao;

architecture modo_selecao of modo_selecao is

	component relogio is
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
	end component;
		
		component FF_D is
			port(
				D:in std_logic;
				clock:in std_logic;
				Q: out std_logic;
				Qbar: out std_logic
			
			
			
			);
			
		end component;
	
	
	component div_freq is 
		port(
			 clock_in:	 in std_logic;
			cont: in std_logic_vector (25 downto 0);
			clock_out: out std_logic
		
		);
	end component;

signal mode_index: std_logic_vector (1 downto 0):="00";
signal aux: std_logic_vector (1 downto 0);
signal set_rel: std_logic_vector (1 downto 0):= "00";
signal STR_aux: std_logic:=STR ;
signal STR_aux_bar: std_logic:= not STR ;
signal cont_clocks :std_logic_vector (25 downto 0);
signal div_clock: std_logic;

--signal 
	begin
			divisor_freq: div_freq port map(clock,cont_clocks,div_clock);

			relo: relogio port map (conf,set_rel,mode_index,STR_aux,div_clock,disp_h1,disp_h2,disp_m1,disp_m2,disp_s1,disp_s2);
			
		process(change_mode)
			begin
				if( (change_mode='1' and change_mode'EVENT) ) then
					--aux <= mode_index; 
					mode_index <=mode_index+"01";
				end if;
				if(mode_index="00") then
					--componente relogio
					if(set = '1' and set'EVENT) then

							set_rel <= set_rel+ "01";
						
					end if;
					
					mode_test<="00";
				end if;
				if(mode_index="01") then
					--componente alarme
					mode_test<="01";

				end if;
				if(mode_index="10") then
					--componente cronometro
					mode_test<="10";

					
				end if;
				if(mode_index="11") then
					--componente cronometro
					mode_test<="11";

					mode_index<="00";
					
				end if;
			
		
		end process;
		
		


end modo_selecao;