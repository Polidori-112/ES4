library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sevenseg is
  port(
	  S : in unsigned(3 downto 0);
	  segments : out std_logic_vector(6 downto 0)
  );
end sevenseg;

architecture synth of sevenseg is
begin
  process (S,segments) is
  begin
  if (S(3) = '0' and S(2) = '0' and S(1) = '0' and S(0) = '0') then
    segments <= "0000001";
  elsif (S(3) = '0' and S(2) = '0' and S(1) = '0' and S(0) = '1') then
    segments <= "1001111";
  elsif (S(3) = '0' and S(2) = '0' and S(1) = '1' and S(0) = '0') then
    segments <= "0010010";
  elsif (S(3) = '0' and S(2) = '0' and S(1) = '1' and S(0) = '1') then
    segments <= "0000110";
  elsif (S(3) = '0' and S(2) = '1' and S(1) = '0' and S(0) = '0') then
    segments <= "1001100";
  elsif (S(3) = '0' and S(2) = '1' and S(1) = '0' and S(0) = '1') then
    segments <= "0100100";
  elsif (S(3) = '0' and S(2) = '1' and S(1) = '1' and S(0) = '0') then
    segments <= "0100000";
  elsif (S(3) = '0' and S(2) = '1' and S(1) = '1' and S(0) = '1') then
    segments <= "0001111";
  elsif (S(3) = '1' and S(2) = '0' and S(1) = '0' and S(0) = '0') then
    segments <= "0000000";
  elsif (S(3) = '1' and S(2) = '0' and S(1) = '0' and S(0) = '1') then
    segments <= "0000100";
  elsif (S(3) = '1' and S(2) = '0' and S(1) = '1' and S(0) = '0') then
    segments <= "0001000";
  elsif (S(3) = '1' and S(2) = '0' and S(1) = '1' and S(0) = '1') then
    segments <= "1100000";
  elsif (S(3) = '1' and S(2) = '1' and S(1) = '0' and S(0) = '0') then
    segments <= "0110001";
  elsif (S(3) = '1' and S(2) = '1' and S(1) = '0' and S(0) = '1') then
    segments <= "1000010";
  elsif (S(3) = '1' and S(2) = '1' and S(1) = '1' and S(0) = '0') then
    segments <= "0110000";
  elsif (S(3) = '1' and S(2) = '1' and S(1) = '1' and S(0) = '1') then
    segments <= "0111000";
  else
    segments <= "1111111";
  end if;
  end process;
end;
