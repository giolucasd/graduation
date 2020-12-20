LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

LIBRARY Processor;
USE Processor.Processor_pack.ALL;

ENTITY selector IS
    GENERIC (
        WORDSIZE : NATURAL := 32 -- Tamanho da palavra de dados
    );
	PORT (
        instruction:	IN	STD_LOGIC_VECTOR (5 DOWNTO 0);
        data_in:	IN	STD_LOGIC_VECTOR (WORDSIZE-1 DOWNTO 0);
        immediate: IN	STD_LOGIC_VECTOR (15 DOWNTO 0);
        B: out STD_LOGIC_VECTOR (WORDSIZE-1 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE Behavior OF selector IS
signal append: STD_LOGIC_VECTOR (15 DOWNTO 0);

begin
    with instruction select
        B <=    (append & immediate) when "001100",
                data_in when others;

    with immediate(15) select
        append <=   "1111111111111111" when '1',
                    "0000000000000000" when others;


END ARCHITECTURE;
