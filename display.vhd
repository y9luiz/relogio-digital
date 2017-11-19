library ieee;
use ieee.std_logic_1164.all;

entity display is
	port(
		I: in std_logic_vector (3 downto 0);
		O: out std_logic_vector (6 downto 0)
	);
end display;

architecture display of display is
	begin
		process(I)
			begin	
			case I is
			when "0000" => O <="0111111";
			when "0001" => O <="0000011";
			when "0010" => O <="1011011";
			when "0011" => O <="1001111";
			when "0100" => O <="1100110";
			when "0101" => O <="1101101";
			when "0110" => O <="1111101";
			when "0111" => O <="0000111";
			when "1000" => O <="1111111";
			when "1001" => O <="1100111";
			when others => O <="0000000";
			end case;
		end process;
end display;	