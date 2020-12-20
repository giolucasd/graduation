library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ram is
  port (
    Clock : in std_logic;
    Address : in std_logic_vector(9 downto 0);
    DataIn : in std_logic_vector(31 downto 0);
    DataOut : out std_logic_vector(31 downto 0);
    WrEn : in std_logic
  );
end ram;

architecture rtl of ram is

  component ram_block is
    port (
      Clock : in std_logic;
      Address : in std_logic_vector(6 downto 0);
      Data : in std_logic_vector(7 downto 0);
      Q : out std_logic_vector(7 downto 0);
      WrEn : in std_logic
    );
  end component;

  signal address_corrigido: std_logic_vector(6 downto 0);
  signal WrEn_0_to_127: std_logic;
  signal WrEn_128_to_255: std_logic;
  signal DataOut_0_to_127: std_logic_vector(31 downto 0);
  signal DataOut_128_to_255: std_logic_vector(31 downto 0);



  begin
    f: for i in 0 to 3 generate
      block_0_to_127: ram_block port map(Clock, address_corrigido(6 downto 0), DataIn(8*i+7 downto 8*i), DataOut_0_to_127(8*i+7 downto 8*i), WrEn_0_to_127);
      block_128_to_255: ram_block port map(Clock, address_corrigido(6 downto 0), DataIn(8*i+7 downto 8*i), DataOut_128_to_255(8*i+7 downto 8*i), WrEn_128_to_255);
    end generate;



    DataOut <=  DataOut_0_to_127 when (to_integer(unsigned(Address)) < 128) else
                DataOut_128_to_255 when (to_integer(unsigned(Address)) < 256) else 
                (others => 'X');

    address_corrigido <=  Address(6 downto 0);


    WrEn_0_to_127 <=  WrEn when (to_integer(unsigned(Address)) < 128) else '0';

    WrEn_128_to_255 <=  '0' when (to_integer(unsigned(Address)) < 128) else
                        WrEn when (to_integer(unsigned(Address)) < 256) else 
                        '0';


end rtl;
