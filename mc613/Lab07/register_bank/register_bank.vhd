library ieee;
use ieee.std_logic_1164.all;

entity register_bank is
  port (
    clk : in std_logic;
    data_in : in std_logic_vector(3 downto 0);
    data_out : out std_logic_vector(3 downto 0);
    reg_rd : in std_logic_vector(2 downto 0);
    reg_wr : in std_logic_vector(2 downto 0);
    we : in std_logic;
    clear : in std_logic
  );
end register_bank;

architecture structural of register_bank is

  component reg is
    generic (N : integer);
    port (
      clk : in std_logic;
      data_in : in std_logic_vector(N-1 downto 0);
      data_out : out std_logic_vector(N-1 downto 0);
      load : in std_logic;
      clear : in std_logic
    );
  end component;

  component dec3_to_8 is
    port(en: in std_logic;
         w: in std_logic_vector(2 downto 0);
         y: out std_logic_vector(7 downto 0));
  end component;

  component zbuffer is
    generic (N : integer);
    port (X: in std_logic_vector(N-1 downto 0);
        E: in std_logic;
        F: out std_logic_vector(N-1 downto 0));
  end component;


  signal memory: std_logic_vector(31 downto 0);
  signal selection_rd, selection_wr: std_logic_vector(7 downto 0);

begin

  g1: for i in 0 to 7 generate
      regs: reg generic map(N=>4) port map(clk, data_in, memory(i*4+3 downto i*4), selection_wr(i), clear);
    end generate;
  
  dec_rd: dec3_to_8 port map('1', reg_rd, selection_rd);

  dec_wr: dec3_to_8 port map(we, reg_wr, selection_wr);

  g2: for i in 0 to 7 generate
      buffers: zbuffer generic map(N=>4) port map(memory(i*4+3 downto i*4), selection_rd(i), data_out);
    end generate;

end structural;
