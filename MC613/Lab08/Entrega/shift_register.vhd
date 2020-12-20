library ieee;
use ieee.std_logic_1164.all;

entity shift_register is
generic (N : integer := 6);
port(
    clk     : in  std_logic;
    mode    : in  std_logic_vector(1 downto 0);
    ser_in  : in  std_logic;
    par_in  : in  std_logic_vector((N - 1) downto 0);
    par_out : out std_logic_vector((N - 1) downto 0)
  );
end shift_register;

architecture rtl of shift_register is
begin
  process
  variable tmp: std_logic;
  variable memoria: std_logic_vector(N-1 downto 0);
  begin
    par_out <= memoria;
    wait until clk'event and clk='1';
    if mode="11" then
      memoria := par_in;
    elsif mode="10" then
      for i in 0 to (N-2) loop
        tmp := memoria(i+1);
        memoria(i) := tmp;
      end loop;
      memoria(N-1) := ser_in;
    elsif mode="01" then
      for i in (N-1) downto 1 loop
        tmp := memoria(i-1);
        memoria(i) := tmp;
      end loop;
      memoria(0) := ser_in;
    end if;
  end process;
end rtl;
