library ieee ;
use ieee.std_logic_1164.all ;
use ieee.std_logic_unsigned.all ;

entity fsm_table is
  port ( 
         clk, reset, w: in std_logic;
         z: out std_logic
       );
end fsm_table;

architecture rtl of fsm_table is
  
  type state_type is (A, B, C, D);

  signal state: state_type; 

begin

  process (clk)
  begin
    if clk'EVENT and clk = '1' then
      if reset = '1' then
        state <= A; z <= '1';
      else
        case state is
       	  when A =>
	    if w = '0'
	      then state <= C; z <= '1';
	      else state <= B; z <= '1';
	    end  if;
	  when B =>
	    if w = '0'
	      then state <= D; z <= '1';
	      else state <= C; z <= '0';
	    end if;
       	  when C =>
	    if w = '0'
	      then state <= B; z <= '0';
	      else state <= C; z <= '0';
	    end if;
	  when D =>
	    if w = '0'
	      then state <= A; z <= '0';
	      else state <= C; z <= '1';
	    end if;
        end case;
      end if;
    end if;
  end process;
end rtl;
