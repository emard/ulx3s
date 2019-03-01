-- (c)EMARD
-- License=BSD

-- module to bypass user input and usbserial to esp32 wifi

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- use work.f32c_pack.all;

library ecp5u;
use ecp5u.components.all;

entity ulx3s_passthru_wifi is
  generic
  (
    C_dummy_constant: integer := 0
  );
  port
  (
  clk_25mhz: in std_logic;  -- main clock input from 25MHz clock source must be lowercase

  -- UART0 (FTDI USB slave serial)
  ftdi_rxd: out   std_logic;
  ftdi_txd: in    std_logic;
  -- FTDI additional signaling
  ftdi_ndtr: inout  std_logic;
  ftdi_ndsr: inout  std_logic;
  ftdi_nrts: inout  std_logic;
  ftdi_txden: inout std_logic;

  -- UART1 (WiFi serial)
  wifi_rxd: out   std_logic;
  wifi_txd: in    std_logic;
  -- WiFi additional signaling
  wifi_en, wifi_gpio0, wifi_gpio2, wifi_gpio16, wifi_gpio17: inout  std_logic := 'Z'; -- '0' will disable wifi by default

  -- Onboard blinky
  led: out std_logic_vector(7 downto 0);
  btn: in std_logic_vector(6 downto 0);
  sw: in std_logic_vector(1 to 4);
  oled_csn, oled_clk, oled_mosi, oled_dc, oled_resn: out std_logic;

  -- GPIO (some are shared with wifi and adc)
  gp, gn: inout std_logic_vector(27 downto 0) := (others => 'Z');

  -- SHUTDOWN: logic '1' here will shutdown power on PCB >= v1.7.5
  shutdown: out std_logic := '0';

  -- Audio jack 3.5mm
  audio_l, audio_r, audio_v: inout std_logic_vector(3 downto 0) := (others => 'Z');

  -- Digital Video (differential outputs)
  --gpdi_dp, gpdi_dn: out std_logic_vector(2 downto 0);
  --gpdi_clkp, gpdi_clkn: out std_logic;

  -- Flash ROM (SPI0)
  --flash_miso   : in      std_logic;
  --flash_mosi   : out     std_logic;
  --flash_clk    : out     std_logic;
  --flash_csn    : out     std_logic;
  flash_holdn, flash_wpn: out std_logic := '1';

  -- SD card (SPI1)
  sd_d: inout std_logic_vector(3 downto 0); -- wifi_gpio 13,12,4,2
  sd_cmd: in std_logic; -- wifi_gpio15
  sd_clk: in std_logic; -- wifi_gpio14
  sd_cdn, sd_wp: in std_logic 
  );
end;

architecture Behavioral of ulx3s_passthru_wifi is
  signal S_prog_in, R_prog_in, S_prog_out: std_logic_vector(1 downto 0);
  signal R_spi_miso: std_logic_vector(7 downto 0);
  signal S_oled_csn: std_logic;
  constant C_prog_release_timeout: integer := 17; -- default 17 2^n * 25MHz timeout for initialization phase
  signal R_prog_release: std_logic_vector(C_prog_release_timeout downto 0) := (others => '1'); -- timeout that holds lines for reliable entering programming mode
begin

  -- TX/RX passthru
  ftdi_rxd <= wifi_txd;
  wifi_rxd <= ftdi_txd;

  -- Programming logic
  -- SERIAL  ->  ESP32
  -- DTR RTS -> EN IO0
  --  1   1     1   1
  --  0   0     1   1
  --  1   0     0   1
  --  0   1     1   0
  S_prog_in(1) <= ftdi_ndtr;
  S_prog_in(0) <= ftdi_nrts;
  S_prog_out <= "01" when S_prog_in = "10" else
                "10" when S_prog_in = "01" else
                "11";
  wifi_en <= S_prog_out(1);
  wifi_gpio0 <= S_prog_out(0) and btn(0); -- holding BTN0 will hold gpio0 LOW, signal for ESP32 to take control
  --sd_d(0) <= '0' when wifi_gpio0 = '0' else 'Z'; -- gpio2 together with gpio0 to 0
  --sd_d(2) <= '0' when wifi_gpio0 = '0' else 'Z'; -- wifi gpio12
  sd_d(0) <= S_prog_out(0) when R_prog_release(R_prog_release'high) = '0' else
             -- '1' when R_prog_release(R_prog_release'high) = '0' else
             R_spi_miso(0) when S_oled_csn = '0' else -- SPI reading buttons with OLED CSn
             'Z'; -- gpio2 to 0 during programming init
			 
  -- sd_d(2) <= '0' when (S_prog_in(0) xor S_prog_in(1)) = '1' else 'Z'; -- wifi gpio12
  -- sd_d(2) <= '0' when R_prog_release(R_prog_release'high) = '0' else 'Z'; -- wifi gpio12
  -- sd_d(3) <= '1' when R_prog_release(R_prog_release'high) = '0' else 'Z';
  -- sd_clk <= clk_25mhz when R_prog_release(R_prog_release'high) = '0' else 'Z';
  -- permanent flashing mode
  -- wifi_en <= ftdi_nrts;
  -- wifi_gpio0 <= ftdi_ndtr;

  S_oled_csn <= wifi_gpio17;
  oled_csn <= S_oled_csn;
  oled_clk <= sd_clk; -- wifi_gpio14
  oled_mosi <= sd_cmd; -- wifi_gpio15
  oled_dc <= wifi_gpio16;
  oled_resn <= gp(11); -- wifi_gpio25

  -- show OLED signals on the LEDs
  -- show SD signals on the LEDs
  -- led(7 downto 0) <= S_oled_csn & R_spi_miso(0) & sd_clk & sd_d(2) & sd_d(3) & sd_cmd & sd_d(0) & sd_d(1); -- beautiful but makes core unreliable
  led(7) <= not R_prog_release(R_prog_release'high); -- ESP32 programming start: blinks too short to be visible
  led(6) <= S_prog_out(1); -- green LED indicates ESP32 disabled
  --led(3) <= sd_d(3); -- sd_d(3) is sd_cs, pullup=NONE in constraints otherwise SD card will prevents esp32 from entering programming mode...
  --led(2) <= sd_d(2);
  --led(1) <= sd_d(1);
  --led(0) <= sd_d(0);

  -- programming release counter
  process(clk_25MHz)
  begin
      if rising_edge(clk_25MHz) then
        R_prog_in <= S_prog_in;
        if S_prog_out = "01" and R_prog_in = "11" then
          R_prog_release <= (others => '0');
        else
          if R_prog_release(R_prog_release'high) = '0' then
            R_prog_release <= R_prog_release + 1;
          end if;
        end if;
      end if;
  end process;

  process(sd_clk, wifi_gpio17) -- gpio17 is OLED CSn
  begin
    if wifi_gpio17 = '1' then
      R_spi_miso <= '0' & btn; -- sample button state during csn=1
    else
      if rising_edge(sd_clk) then
        R_spi_miso <= R_spi_miso(R_spi_miso'high-1 downto 0) & R_spi_miso(R_spi_miso'high) ; -- shift to the left
      end if;
    end if;
  end process;

end Behavioral;