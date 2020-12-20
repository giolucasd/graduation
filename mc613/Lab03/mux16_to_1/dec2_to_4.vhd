library ieee;
use ieee.std_logic_1164.all;

entity dec2_to_4 is
  port(en, w1, w0: in std_logic;
       y3, y2, y1, y0: out std_logic);
end dec2_to_4;

architecture rtl of dec2_to_4 is
begin
  with en select
    y0 <= not(w0) and not(w1) when '1',
          '0' when others;
  with en select
    y1 <= w0 and not(w1) when '1',
          '0' when others;
  with en select
    y2 <= not(w0) and w1 when '1',
          '0' when others;
  with en select
    y3 <= w0 and w1 when '1',
          '0' when others;
end rtl;

