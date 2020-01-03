LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY i2s_transceiver IS
  GENERIC(
    mclk_sclk_ratio  :  INTEGER := 4;    --number of mclk periods per sclk period
    sclk_ws_ratio    :  INTEGER := 64;   --number of sclk periods per word select period
    d_width          :  INTEGER := 24);  --data width
  PORT(
    reset_n    :  IN   STD_LOGIC;                             --asynchronous active low reset
    mclk       :  IN   STD_LOGIC;                             --master clock
    sclk       :  OUT  STD_LOGIC;                             --serial clock (or bit clock)
    ws         :  OUT  STD_LOGIC;                             --word select (or left-right clock)
    sd_rx      :  IN   STD_LOGIC;                             --serial data receive
    r_data_rx  :  OUT  STD_LOGIC_VECTOR(d_width-1 DOWNTO 0); --right channel data received
    t_pulse : OUT STD_LOGIC);
END i2s_transceiver;

ARCHITECTURE logic OF i2s_transceiver IS

  SIGNAL sclk_int       :  STD_LOGIC := '0';                      --internal serial clock signal
  SIGNAL ws_int         :  STD_LOGIC := '0';                      --internal word select signal
  SIGNAL r_data_rx_int  :  STD_LOGIC_VECTOR(d_width-1 DOWNTO 0);  --internal right channel rx data buffer
   
BEGIN  
  
  PROCESS(mclk, reset_n)
    VARIABLE sclk_cnt  :  INTEGER := 0;  --counter of master clocks during half period of serial clock
    VARIABLE ws_cnt    :  INTEGER := 0;  --counter of serial clock toggles during half period of word select
  BEGIN
    
    IF(reset_n = '0') THEN                                           --asynchronous reset
      sclk_cnt := 0;                                                   --clear mclk/sclk counter
      ws_cnt := 0;                                                     --clear sclk/ws counter
      sclk_int <= '0';                                                 --clear serial clock signal
      ws_int <= '0';                                                   --clear word select signal
      r_data_rx_int <= (OTHERS => '0');                                --clear internal right channel rx data buffer
      r_data_rx <= (OTHERS => '0');                                    --clear right channel received data output
    ELSIF(mclk'EVENT AND mclk = '1') THEN                            --master clock rising edge
      IF(sclk_cnt < mclk_sclk_ratio/2-1) THEN                          --less than half period of sclk
        sclk_cnt := sclk_cnt + 1;                                        --increment mclk/sclk counter 
      ELSE                                                             --half period of sclk
        sclk_cnt := 0;                                                   --reset mclk/sclk counter
        sclk_int <= NOT sclk_int;                                        --toggle serial clock
        IF(ws_cnt < sclk_ws_ratio-1) THEN                                --less than half period of ws
          ws_cnt := ws_cnt + 1;                                            --increment sclk/ws counter
          t_pulse <= '0';
          IF(sclk_int = '0' AND ws_cnt > 1 AND ws_cnt < d_width*2+2) THEN  --rising edge of sclk during data word
            IF(ws_int = '1') THEN                                            --right channel
              r_data_rx_int <= r_data_rx_int(d_width-2 DOWNTO 0) & sd_rx;      --shift data bit into right channel rx data buffer                                                         --left channel
            END IF;
          END IF;       
        ELSE                                                            --half period of ws
          ws_cnt := 0;                                                    --reset sclk/ws counter
          ws_int <= NOT ws_int;                                           --toggle word select
          IF(ws_int = '1') THEN
            t_pulse <= '1';
            r_data_rx <= r_data_rx_int;
          END IF;
        END IF;
      END IF;
    END IF;    
  END PROCESS;
  
  sclk <= sclk_int;  --output serial clock
  ws <= ws_int;      --output word select
  
END logic;
    
