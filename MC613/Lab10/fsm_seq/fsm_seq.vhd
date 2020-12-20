library ieee;
use ieee.std_logic_1164.all;

entity fsm_seq is
    port (
      clock : in  std_logic;
      reset : in  std_logic;
      w     : in  std_logic;
      z     : out std_logic
    );
end fsm_seq;

architecture rtl of fsm_seq is
    type states is (A, B, C); 
    signal currentState : states;
begin 
    process
    begin
        wait until clock'event and clock='1';

        if (reset = '1') then
            currentState <= A;
        else 
            case currentState is
                when A =>
                    if w = '0' then
                        currentState <=  A;
                        z <= '0';
                    else
                        currentState <=  B;
                        z <= '0';
                    end if;       
                when B =>
                    if w = '0' then
                        currentState <=  C;
                        z <= '0';
                    else
                        currentState <=  B;
                        z <= '0';
                    end if;       
                when C =>
                    if w = '0' then
                        currentState <=  A;
                        z <= '0';
                    else
                        currentState <=  B;
                        z <= '1';
                    end if;          
            end case;   
        end if;
    end process;

end rtl;