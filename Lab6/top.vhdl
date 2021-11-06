library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity top is
  port(
	  a1 : in unsigned(3 downto 0);
	  b1 : in unsigned(3 downto 0);
	  x1 : in std_logic_vector(1 downto 0);
    S : in unsigned(3 downto 0);
    inp : in unsigned(5 downto 0);
	  seg1 : out std_logic_vector(6 downto 0);
    pin : out std_logic_vector(1 downto 0)
  );
end top;



architecture synth of top is

 component sevenseg is
 port(
 S : in unsigned(3 downto 0);
 segments : out std_logic_vector(6 downto 0)
 );
 end component;

 component dddd is
   port(
     count : in unsigned(5 downto 0);
     tens : out std_logic_vector(6 downto 0);
     ones : out std_logic_vector(6 downto 0)
   );
 end component;

 component SB_HFOSC is
    generic (
        CLKHF_DIV : String := "0b00"
    );
    port (
        CLKHFPU : in std_logic := '1';
        CLKHFEN : in std_logic := '1';
        CLKHF : out std_logic
    );
end component;

signal counter : unsigned(25 downto 0);
signal clk : std_logic;
signal outie : std_logic_vector(6 downto 0);
signal outie1 : std_logic_vector(6 downto 0);

 signal y1 : unsigned (3 downto 0);
begin

ddd : dddd port map (count => inp, tens => outie, ones  => outie1);

osc: SB_HFOSC
    generic map(CLKHF_DIV => "0b00")
    port map(CLKHFPU => '1', CLKHFEN => '1', CLKHF => clk);


process (clk) begin
  if rising_edge(clk) then
    counter <= counter + 1;
    pin(1) <= counter(18);
    pin(0) <= not counter(18);
    if (counter(18)) then
      seg1 <= outie;
    else
      seg1 <= outie1;
    end if;
  end if;
end process;

end;
