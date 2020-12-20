library ieee;
use ieee.std_logic_1164.all;

entity extra_logic is
  port(w3, w2, w1, w0 : in std_logic;
       y3, y2, y1, y0 : in std_logic;
       f : out std_logic);
end extra_logic;

architecture rtl of extra_logic is
  signal s : std_logic_vector(3 downto 0);
begin
  s <= y0 & y1 & y2 & y3;
  with s select
    f <= w0 when "1000",
         w1 when "0100",
         w2 when "0010",
	      w3 when "0001",
        '0' when others;
end rtl;

