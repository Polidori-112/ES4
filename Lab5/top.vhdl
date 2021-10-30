library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity top is
  port(
	  a1 : in unsigned(3 downto 0);
	  b1 : in unsigned(3 downto 0);
	  x1 : in std_logic_vector(1 downto 0);
    S : in unsigned(3 downto 0);
	  seg1 : out std_logic_vector(6 downto 0)

  );
end top;



architecture synth of top is
component alu is
port(
	  a : in unsigned(3 downto 0);
	  b : in unsigned(3 downto 0);
	  x : in std_logic_vector(1 downto 0);
	  y : out unsigned(3 downto 0)
  );
 end component;

 component sevenseg is
 port(
 S : in unsigned(3 downto 0);
 segments : out std_logic_vector(6 downto 0)
 );
 end component;

 signal y1 : unsigned (3 downto 0);
begin

add : alu port map (a => a1, b => b1, x => x1, y => y1);
somethin : sevenseg port map (S => y1, segments => seg1);


end;
