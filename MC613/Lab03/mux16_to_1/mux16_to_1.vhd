library ieee;
use ieee.std_logic_1164.all;

entity mux16_to_1 is
  port(data : in std_logic_vector(15 downto 0);
       sel : in std_logic_vector(3 downto 0);
       output : out std_logic);
end mux16_to_1;

architecture rtl of mux16_to_1 is

signal m : std_logic_vector(3 downto 0) ;

component mux4_to_1 is
  port(d3, d2, d1, d0 : in std_logic;
       sel: in std_logic_vector(1 downto 0);
       output: out std_logic);
end component;

begin
  G1: for i in 0 to 3 generate
    Muxes: mux4_to_1 port map(
      data(4*i+3), data(4*i+2), data(4*i+1), data(4*i), sel(1 downto 0), m(i));
  end generate;
  
  Mux: mux4_to_1 port map
    ( m(3), m(2), m(1), m(0), sel(3 downto 2), output);
end rtl;

