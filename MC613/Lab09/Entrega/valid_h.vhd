library ieee;
use ieee.std_logic_1164.all;

entity valid_h is
    port (
      decimal : in std_logic_vector(3 downto 0);
      unity : in std_logic_vector(3 downto 0);
      valid: out std_logic
    );
  end valid_h;

architecture rtl of valid_h is
    begin 
        with (decimal & unity) select
            valid <=    '1' when "00000000",
                        '1' when "00000001",
                        '1' when "00000010",
                        '1' when "00000011",
                        '1' when "00000100",
                        '1' when "00000101",
                        '1' when "00000110",
                        '1' when "00000111",
                        '1' when "00001000",
                        '1' when "00001001",
                        '1' when "00010000",
                        '1' when "00010001",
                        '1' when "00010010",
                        '1' when "00010011",
                        '1' when "00010100",
                        '1' when "00010101",
                        '1' when "00010110",
                        '1' when "00010111",
                        '1' when "00011000",
                        '1' when "00011001",
                        '1' when "00100000",
                        '1' when "00100001",
                        '1' when "00100010",
                        '1' when "00100011",
                        '0' when others;
end rtl;
        

         


        