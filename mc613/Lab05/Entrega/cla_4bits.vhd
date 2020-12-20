-- brief : lab05 - question 2

library ieee;
use ieee.std_logic_1164.all;

entity cla_4bits is
  port(
    x    : in  std_logic_vector(3 downto 0);
    y    : in  std_logic_vector(3 downto 0);
    cin  : in  std_logic;
    sum  : out std_logic_vector(3 downto 0);
    cout : out std_logic
  );
end cla_4bits;

architecture rtl of cla_4bits is
  signal g, p: std_logic_vector(3 downto 0);
  signal c: std_logic_vector(4 downto 0);
  begin
    g1: for i in 3 downto 0 generate
      g(i) <= x(i) and y(i);
    end generate;

    g2: for i in 3 downto 0 generate
      p(i) <= x(i) or y(i);
    end generate;

    c(0) <= cin;
    c(1) <= g(0) or (p(0) and c(0));
    c(2) <= g(1) or (p(1) and g(0)) or (p(1) and p(0) and c(0));
    c(3) <= g(2) or (p(2) and g(1)) or (p(2) and p(1) and g(0)) or (p(2) and p(1) and p(0) and c(0));
    c(4) <= g(3) or (p(3) and g(2)) or (p(3) and p(2) and g(1)) or (p(3) and p(2) and p(1) and g(0)) or (p(3) and p(2) and p(1) and c(0));
    cout <= c(4);

    g3: for i in 3 downto 0 generate
      sum(i) <= x(i) xor y(i) xor c(i);
    end generate;
end rtl;

