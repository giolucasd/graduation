library ieee;
use ieee.std_logic_1164.all;

entity ripple_carry_board is
  port (
    SW : in std_logic_vector(7 downto 0);
    HEX4 : out std_logic_vector(6 downto 0);
    HEX2 : out std_logic_vector(6 downto 0);
    HEX0 : out std_logic_vector(6 downto 0);
    LEDR : out std_logic_vector(0 downto 0)
    );
end ripple_carry_board;

architecture rtl of ripple_carry_board is
  component ripple_carry is
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
  end component;

  component bin2hex is
    port (
          bin: in std_logic_vector(3 downto 0);
          hex: out std_logic_vector(6 downto 0)
    );
  end component;

  signal resultado: std_logic_vector(3 downto 0);

  begin

    rp_adder: ripple_carry
      generic map (N => 4)
      port map (x => SW(7 downto 4), y => SW(3 downto 0), cin => '0', r => resultado(3 downto 0), overflow => LEDR(0));

    x_hex: bin2hex port map (SW(7 downto 4), HEX4(6 downto 0));
    y_hex: bin2hex port map (SW(3 downto 0), HEX2(6 downto 0));
    r_hex: bin2hex port map (resultado(3 downto 0), HEX0(6 downto 0));

end rtl;
