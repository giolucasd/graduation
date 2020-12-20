library ieee;
use ieee.std_logic_1164.all;

entity valid_ms is
    port (
      decimal : in std_logic_vector(3 downto 0);
      unity : in std_logic_vector(3 downto 0);
      valid: out std_logic
    );
  end valid_ms;

architecture rtl of valid_ms is
    signal valid_u,  valid_d: std_logic;
    
    begin 
        with unity select
            valid_u <=  '1' when "0000",
                        '1' when "0001",
                        '1' when "0010",
                        '1' when "0011",
                        '1' when "0100",
                        '1' when "0101",
                        '1' when "0110",
                        '1' when "0111",
                        '1' when "1000",
                        '1' when "1001",
                        '0' when others;
        with decimal select
            valid_d <=  '1' when "0000",
                        '1' when "0001",
                        '1' when "0010",
                        '1' when "0011",
                        '1' when "0100",
                        '1' when "0101",
                        '0' when others;
        valid <= valid_u and valid_d;
end rtl;
         


        