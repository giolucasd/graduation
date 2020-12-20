library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ram_block is
  port (
    Clock : in std_logic;
    Address : in std_logic_vector(6 downto 0);
    Data : in std_logic_vector(7 downto 0);
    Q : out std_logic_vector(7 downto 0);
    WrEn : in std_logic
  );
end ram_block;

architecture direct of ram_block is
  type mem_type is array (0 to 127) of std_logic_vector(7 downto 0);
  signal data_block : mem_type;
begin
  process(Clock)
    begin
      if Clock'event and Clock = '1' then
        if WrEn = '1' then
          data_block(to_integer(unsigned(Address))) <= Data;
        else
	  Q <= data_block(to_integer(unsigned(Address)));
	end if;
      end if;
    end process;
end direct;
