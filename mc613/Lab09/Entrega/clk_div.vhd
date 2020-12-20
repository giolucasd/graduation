library ieee;
use ieee.std_logic_1164.all;

entity clk_div is
  port (
    clk : in std_logic;
    clk_hz : out std_logic
  );
end clk_div;

architecture behavioral of clk_div is
  component counter is
    generic (N: integer := 5);
    port (
        clk: in std_logic;
        s: out std_logic
    );
end component;

begin
  -- Na 50.000.000 a borda de subida, ou seja, após, 50.000.000 períodos de clock, clk_hz é mudado para 1
  count50M: counter 
    generic map(N=>49999999)
    port map (clk, clk_hz);
end behavioral;
