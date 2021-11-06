library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity counter is
  port(
    pin : out std_logic_vector(1 downto 0)
  );
end counter;



architecture synth of counter is

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

begin


osc: SB_HFOSC
    generic map(CLKHF_DIV => "0b00")
    port map(CLKHFPU => '1', CLKHFEN => '1', CLKHF => clk);


process (clk) begin
  if rising_edge(clk) then
    counter <= counter + 1;
    pin(1) <= counter(18);
    pin(0) <= not counter(18);
  end if;
end process;

end;
