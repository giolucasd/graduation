library ieee;
use ieee.std_logic_1164.all;

entity counter is
    generic (N: integer := 5);
    port (
        clk: in std_logic;
        s: out std_logic
    );
end counter;

architecture rtl of counter is
    signal saida: std_logic;
-- O contador é acrescido em 0 até N, momento em que a contagem é reiniciada e a saída é 1 por 1 período de clock.
begin
    with saida select
        s <='1' when '1',
            '0' when others;

    process
        variable count: integer range 0 to 67108863;

        begin
        -- Na N-ésima borda de subida, s recebe 1
        wait until Clk'event and Clk='1';
        if count = N then
            count := 0;
            saida <= '1';
        else
            count := count + 1;
            saida <= '0';
        end if;
    end process;
end rtl;