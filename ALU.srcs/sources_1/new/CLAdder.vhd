----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/26/2022 11:33:12 AM
-- Design Name: 
-- Module Name: CLAdder - Behavioral
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

entity CLAdder is
  Port (cin : in std_logic;
        x : in std_logic_vector(3 downto 0);
        y : in std_logic_vector(3 downto 0);
        s : out std_logic_vector(3 downto 0);
        cout : out std_logic);
end CLAdder;

architecture Behavioral of CLAdder is

component FullAdder is
  Port (x : in std_logic;
      y : in std_logic;
      s : out std_logic;
      cin : in std_logic;
      cout : out std_logic );
end component;

signal g : std_logic_vector(3 downto 0);
signal p : std_logic_vector(3 downto 0);
signal carry : std_logic_vector(4 downto 0);
signal c: std_logic;

begin

carry(0) <= cin;

FA_0 : FullAdder port map(x(0), y(0), s(0), carry(0), c); 
g(0) <= x(0) and y(0);
p(0) <= x(0) or y(0);
carry(1) <= g(0) or (p(0) and carry(0));

FA_1 : FullAdder port map(x(1), y(1), s(1), carry(1), c); 
g(1) <= x(1) and y(1);
p(1) <= x(1) or y(1);
carry(2) <= g(1) or (p(1) and carry(1));

FA_2 : FullAdder port map(x(2), y(2), s(2), carry(2), c); 
g(2) <= x(2) and y(2);
p(2) <= x(2) or y(2);
carry(3) <= g(2) or (p(2) and carry(2));

FA_3 : FullAdder port map(x(3), y(3), s(3), carry(3), c); 
g(3) <= x(3) and y(3);
p(3) <= x(3) or y(3);
carry(4) <= g(3) or (p(3) and carry(3));

cout <= carry(4);

end Behavioral;
