library ieee;
use ieee.std_logic_1164.all;

entity fsm_diag is
    port (
      clock : in  std_logic;
      reset : in  std_logic;
      w     : in  std_logic;
      z     : out std_logic
    );
end fsm_diag;

architecture rtl of fsm_diag is
    type states is (A, B, C, D); 
    signal currentState : states;
begin 
    process
    begin
        wait until clock'event and clock='1';

        if (reset = '1') then
            -- sets state to "A"
            currentState <= A;
        else 
            case currentState is
                when A =>
                    if w = '0' then
                        currentState <=  A;
                    else
                        currentState <=  B;
                    end if;       
                when B =>
                    if w = '0' then
                        currentState <=  C;
                    else
                        currentState <=  B;
                    end if;       
                when C =>
                    if w = '0' then
                        currentState <=  C;
                    else
                        currentState <=  D;
                    end if;       
                when D =>
                    if w = '0' then
                        currentState <=  A;
                    else
                        currentState <=  D;
                    end if;    
            end case;   
        end if;
    end process;

    with currentState select
        z <= '1' when B,
             '0' when others;
                
end rtl;