library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all ;

entity clock is
  port (
    clk : in std_logic;
    decimal : in std_logic_vector(3 downto 0);
    unity : in std_logic_vector(3 downto 0);
    set_hour : in std_logic;
    set_minute : in std_logic;
    set_second : in std_logic;
    hour_dec, hour_un : out std_logic_vector(6 downto 0);
    min_dec, min_un : out std_logic_vector(6 downto 0);
    sec_dec, sec_un : out std_logic_vector(6 downto 0)
  );
end clock;

architecture rtl of clock is
  component clk_div is
    port (
      clk : in std_logic;
      clk_hz : out std_logic
    );
  end component;
  signal clk_hz : std_logic;

  
  component bin2hex is
    port (
          bin: in std_logic_vector(3 downto 0);
          hex: out std_logic_vector(6 downto 0)
    );
  end component;


  component valid_ms is
    port (
      decimal : in std_logic_vector(3 downto 0);
      unity : in std_logic_vector(3 downto 0);
      valid: out std_logic
    );
  end component;

  component valid_h is
    port (
      decimal : in std_logic_vector(3 downto 0);
      unity : in std_logic_vector(3 downto 0);
      valid: out std_logic
    );
    end component;
  
  signal valid_s, valid_m, valid_hour: std_logic;
  signal h_dec, h_un, m_dec, m_un, s_dec, s_un: std_logic_vector(3 downto 0);

begin
    clock_sec : clk_div port map (clk, clk_hz);


    v_s: valid_ms port map(decimal, unity, valid_s);
    v_m: valid_ms port map(decimal, unity, valid_m);
    v_h: valid_h port map(decimal, unity, valid_hour);
    

    format_hd: bin2hex port map (h_dec, hour_dec);
    format_hu: bin2hex port map (h_un, hour_un);
    format_md: bin2hex port map (m_dec, min_dec);
    format_mu: bin2hex port map (m_un, min_un);
    format_sd: bin2hex port map (s_dec, sec_dec);
    format_su: bin2hex port map (s_un, sec_un);

    process (clk, clk_hz)
    begin
      if clk'EVENT and clk = '1' then

        if set_second = '1' and valid_s = '1' then
          s_dec <= decimal; s_un <= unity;
          end if;
        if set_minute = '1' and valid_m = '1' then
          m_dec <= decimal; m_un <= unity;
        end if;
        if set_hour = '1' and valid_hour = '1' then
          h_dec <= decimal; h_un <= unity;
        end if;

        
        
        if clk_hz = '1' then

          if s_un = "1001" then
            s_un <= "0000";
            if s_dec = "0101" then
              s_dec <= "0000";
              -- Soma um minuto
              if m_un = "1001" then
                m_un <= "0000";
                if m_dec = "0101" then
                  m_dec <= "0000";
                  -- Soma uma hora
                  -- When unity reaches 9, reset unity and add 1 to decimal
                  if h_un = "1001" then
                    h_un <= "0000";
                    h_dec <= h_dec + '1';
                -- When unity reaches 3 and decimal reaches 2, reset both
                  elsif h_un = "0011" then
                      if h_dec = "0010" then
                          h_dec <= "0000";
                          h_un <= "0000";
                      end if;
                  else
                      h_un <= h_un + '1' ;
                  end if;
                else      
                  m_dec <= m_dec + '1';
                end if;
              else
                m_un <= m_un + '1' ;
              end if;

            else      
              s_dec <= s_dec + '1';
            end if;
          else
            s_un <= s_un + '1' ;
          end if;
        end if;


      end if;


    end process;



end rtl;
