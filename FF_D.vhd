library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FF_D is
	port(
		D:in std_logic;
		clock:in std_logic;
		Q: out std_logic;
		Qbar: out std_logic
	
	);
	
end FF_D;

architecture FF_D of FF_D is
signal Q_aux : std_logic;
signal Q_bar_aux : std_logic;
signal contagem: std_logic_vector (2 downto 0) ;

	begin 	
	
	
		process(clock,contagem)
		
	
		begin
		
			if(clock'EVENT and clock = '1') then
				if(contagem < "001") then
					contagem <= contagem +"01";
						
				else 
					contagem <="000";
					Q_aux <= D;
					Q_bar_aux <= not D;
				end if;	
			end if;
		end process;
		
		Q<=Q_aux;
		Qbar<=Q_bar_aux;
	
end FF_D;
	