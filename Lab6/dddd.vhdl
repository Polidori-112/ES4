library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity dddd is
  port(
    count : in unsigned(5 downto 0);
    tens : out std_logic_vector(6 downto 0);
    ones : out std_logic_vector(6 downto 0)
  );
end dddd;



architecture synth of dddd is

  component sevenseg is
    port(
  	  S : in unsigned(3 downto 0);
  	  segments : out std_logic_vector(6 downto 0)
    );
  end component;

signal lowBCD : unsigned(3 downto 0);
signal tensplace : unsigned (12 downto 0);
signal highBCD : unsigned(3 downto 0);

begin
  -- Do the math to split up the digits. Input `count` is 6 bit unsigned
lowBCD <= count mod 4d"10"; -- Low digit result is 4 bit unsigned
-- Multiply by 52. Intermediate term is 13 bit unsigned
tensplace <= count * 7d"52";
-- Divide by 512 (2ˆ9). High digit result is 4 bit unsigned
highBCD <= tensplace(12 downto 9);

segz : sevenseg port map (S => highBCD, segments => tens);
segzz : sevenseg port map (S => lowBCD, segments => ones);


end;
