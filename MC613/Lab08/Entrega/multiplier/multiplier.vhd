library ieee;
use ieee.std_logic_1164.all;

entity multiplier is
generic(N : integer := 4);
port(
     a, b : in std_logic_vector(N-1 downto 0);
     r : out std_logic_vector(2*N-1 downto 0);
     clk : in std_logic;
     set : in std_logic
    );
end multiplier;

architecture rtl of multiplier is

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

  component shift_register is
  generic(N : integer := 6);
  port(
      clk     : in  std_logic;
      mode    : in  std_logic_vector(1 downto 0);
      ser_in  : in  std_logic;
      par_in  : in  std_logic_vector((N - 1) downto 0);
      par_out : out std_logic_vector((N - 1) downto 0)
  );
  end component;

  component reg is
  generic (
    N : integer := 4
  );
  port (
    clk : in std_logic;
    data_in : in std_logic_vector(N-1 downto 0);
    data_out : out std_logic_vector(N-1 downto 0);
    load : in std_logic; -- Write enable
    clear : in std_logic
  );
  end component;

  signal mode_a, mode_b: std_logic_vector(1 downto 0);
  signal a_extended, a_reg, a_sum, r_reg, result: std_logic_vector(2*N-1 downto 0);
  signal b_reg: std_logic_vector(N-1 downto 0);
  signal n_bit_0: std_logic_vector(N-1 downto 0);
  signal e: std_logic;
begin

  register_a: shift_register
      generic map (N => 2*N)
      port map (clk, mode_a, '0', a_extended, a_reg);

  register_b: shift_register
      generic map (N => N)
      port map (clk, mode_b, '0', b, b_reg);

  register_r: reg
      generic map (N => 2*N)
      port map (clk, result, r_reg, '1', set);

  adder: ripple_carry
      generic map (N => 2*N)
      port map (x => a_sum, y => r_reg, r => result, cin => '0', cout => e);

  -- to keep both registers updated, we just need to grant that
  -- a_extended, mode_a, mode_b and mode_r are set

    with set select
      mode_a <= "11" when '1',
                "01" when others;

    with set select
      mode_b <= "11" when '1',
                "10" when others; 

    n_bit_0 <= (others => '0');
    -- set all bits to 0

    a_extended <= n_bit_0 & a; -- grant that a_extended has the updated a value

    with b_reg(0) select
      a_sum <= a_reg when '1',
               (others => '0') when others;

    r <= result;

end rtl;
