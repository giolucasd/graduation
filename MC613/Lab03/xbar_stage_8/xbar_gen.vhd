library ieee;
use ieee.std_logic_1164.all;

entity xbar_gen is
  generic (N: integer := 1);
  port (s: in std_logic_vector (N-1 downto 0);
       y1, y2: out std_logic);
end xbar_gen;

architecture rtl of xbar_gen is
  component xbar_v2
    port(x1, x2, s: in std_logic;
        y1, y2: out std_logic);
    end component;

  signal z: STD_LOGIC_VECTOR(2*N downto 1);

  begin
    xbar0: xbar_v2 port map ( '1', '0', s(0), z(1), z(2));

    G1: for i in 1 to (N-1) generate
      xbar: xbar_v2 port map ( z(2*i-1), z(2*i), s(i), z(2*i+1), z(2*i+2));
    end generate;

    y1 <= z(2*N-1);
    y2 <= z(2*N);

end rtl;

