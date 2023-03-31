----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/28/2022 09:43:33 PM
-- Design Name: 
-- Module Name: wTree_tb - Behavioral
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

entity wTree_tb is
--  Port ( );
end wTree_tb;

architecture Behavioral of wTree_tb is
component WTree is
     Port (  x : in std_logic_vector(3 downto 0);
       y : in std_logic_vector(3 downto 0);
       p : out std_logic_vector(7 downto 0));
end component;

signal x: std_logic_vector(3 downto 0);
signal y: std_logic_vector(3 downto 0);
signal p: std_logic_vector(7 downto 0);

begin

    UUT: WTree port map(x,y,p);
    
    process 
    begin
        x <= "0000";
        y <= "0101";
        wait for 100 ns;
        x <= "0111";
        y <= "0010";
        wait for 100 ns;
        x <= "1000";
        y <= "1001";
        wait for 100 ns;
        x <= "1001";
        wait for 100 ns;
        y <= "1000";
        wait;
    end process;

end Behavioral;
