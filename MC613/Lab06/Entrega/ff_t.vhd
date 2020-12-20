library ieee;
use ieee.std_logic_1164.all;

entity ff_t is
  port (
    Clk : in std_logic;
    T : in std_logic;
    Q : out std_logic;
    Q_n : out std_logic;
    Preset : in std_logic;
    Clear : in std_logic
  );
end ff_t;

architecture rtl of ff_t is
begin
  process
    variable q_buffer: std_logic;
  begin
    wait until Clk'event and Clk='1';
    if Clear='1' then
      Q <= '0';
      Q_n <= '1';
      q_buffer := '0';
    elsif Preset='1' then
      Q <= '1';
      Q_n <= '0';
      q_buffer := '1';
    elsif T = '0' then
      Q <= q_buffer;
      Q_n <= not(q_buffer);
    else
      Q <= not(q_buffer);
      Q_n <= q_buffer;
      q_buffer := not(q_buffer);
    end if;
  end process;
end rtl;
