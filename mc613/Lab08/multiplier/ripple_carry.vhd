library ieee;
use ieee.std_logic_1164.all;

entity ripple_carry is
  generic (
    N : integer := 4
  );
  port (
    x,y : in std_logic_vector(N-1 downto 0);
    r : out std_logic_vector(N-1 downto 0);
    cin : in std_logic;
    cout : out std_logic;
    overflow : out std_logic
  );
end ripple_carry;

architecture rtl of ripple_carry is
  component full_adder is
  port (
    x, y : in std_logic;
    r : out std_logic;
    cin : in std_logic;
    cout : out std_logic
  );
  end component;
  signal carries: std_logic_vector(N downto 1);
begin
  initial_stage: full_adder port map (x(0), y(0), r(0), cin, carries(1));
  intermediate_stages: for i in 1 to N-1 generate
    intermediate: full_adder port map (x(i), y(i), r(i), carries(i), carries(i+1)) ;
  end generate;
  overflow <= carries(N) xor carries(N-1);
  cout <= carries(N);
end rtl;
