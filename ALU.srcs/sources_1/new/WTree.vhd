----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/28/2022 09:03:14 PM
-- Design Name: 
-- Module Name: WTree - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity WTree is
     Port (  x : in std_logic_vector(3 downto 0);
       y : in std_logic_vector(3 downto 0);
       p : out std_logic_vector(7 downto 0));
end WTree;

architecture Behavioral of WTree is

component FullAdder is
  Port (x : in std_logic;
      y : in std_logic;
      s : out std_logic;
      cin : in std_logic;
      cout : out std_logic );
end component;

signal s: std_logic_vector(11 downto 0);
signal c: std_logic_vector(11 downto 0);
signal carry: std_logic;
signal x0, y0, x1, y1, x2, y2, x3, y3, x4, x5, y5, x6, y6, x7, x11: std_logic;
begin

carry <= '0';
x0 <= x(1) and y(2);
y0 <= x(0) and y(3);

x1 <= x(2) and y(2);
y1 <= x(1) and y(3);

x2 <= x(1) and y(1);
y2 <= x(0) and y(2);

x3 <= x(3) and y(0);
y3 <= x(2) and y(1);

x4 <= x(3) and y(1);

x5 <= x(3) and y(2);
y5 <= x(2) and y(3);

x6 <= x(1) and y(0);
y6 <= x(0) and y(1);

x7 <= x(2) and y(0);

x11 <= x(3) and y(3);

FA_0 : FullAdder port map(x0, y0, s(0), carry, c(0)); 
FA_1 : FullAdder port map(x1, y1, s(1), carry, c(1)); 
FA_2 : FullAdder port map(x2, y2, s(2), carry, c(2)); 
FA_3 : FullAdder port map(x3, y3, s(3), s(0), c(3)); 
FA_4 : FullAdder port map(x4, s(1), s(4), c(0), c(4)); 
FA_5 : FullAdder port map(x5, y5, s(5), c(1), c(5)); 
FA_6 : FullAdder port map(x6, y6, s(6), carry, c(6)); 
FA_7 : FullAdder port map(x7, s(2), s(7), c(6), c(7)); 
FA_8 : FullAdder port map(s(3), c(2), s(8), c(7), c(8)); 
FA_9 : FullAdder port map(s(4), c(3), s(9), c(8), c(9)); 
FA_10 : FullAdder port map(s(5), c(4), s(10), c(9), c(10)); 
FA_11 : FullAdder port map(x11, c(5), s(11), c(10), c(11)); 

p(0) <= x(0) and y(0);
p(1) <= s(6);
p(2) <= s(7);
p(3) <= s(8);
p(4) <= s(9);
p(5) <= s(10);
p(6) <= s(11);
p(7) <= c(11);

end Behavioral;
