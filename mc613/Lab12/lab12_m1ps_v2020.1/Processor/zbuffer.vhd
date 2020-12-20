library ieee ;
use ieee.std_logic_1164.all ;
entity zbuffer is
  generic (N : integer := 4);
  port (X: in std_logic_vector(N-1 downto 0);
      E: in std_logic;
      F: out std_logic_vector(N-1 downto 0));
end zbuffer ;

architecture rtl of zbuffer is
begin
  F <= (others => 'Z') when E = '0' else X;
end rtl;
