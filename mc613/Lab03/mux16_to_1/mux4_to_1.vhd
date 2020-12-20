library ieee;
use ieee.std_logic_1164.all;

entity mux4_to_1 is
  port(d3, d2, d1, d0 : in std_logic;
       sel: in std_logic_vector(1 downto 0);
       output: out std_logic);
end mux4_to_1;

architecture rtl of mux4_to_1 is
  signal m : std_logic_vector(3 downto 0);

component extra_logic is
  port(w3, w2, w1, w0 : in std_logic;
       y3, y2, y1, y0 : in std_logic;
       f : out std_logic);
end component;

component dec2_to_4 is
  port(en, w1, w0: in std_logic;
       y3, y2, y1, y0: out std_logic);
end component;

begin
  Selection: dec2_to_4 port map
    ('1', sel(1), sel(0), m(3), m(2), m(1), m(0));
  Transmission: extra_logic port map
    (m(3), m(2), m(1), m(0), d3, d2, d1, d0, output);
end rtl;

