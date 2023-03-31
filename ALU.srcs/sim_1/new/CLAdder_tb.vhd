----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/26/2022 11:48:49 AM
-- Design Name: 
-- Module Name: CLAdder_tb - Behavioral
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

entity CLAdder_tb is
--  Port ( );
end CLAdder_tb;

architecture Behavioral of CLAdder_tb is

component CLAdder
  Port (cin : in std_logic;
      x : in std_logic_vector(3 downto 0);
      y : in std_logic_vector(3 downto 0);
      s : out std_logic_vector(3 downto 0);
      cout : out std_logic);
end component;

signal cin : std_logic;
signal x: std_logic_vector(3 downto 0);
signal y: std_logic_vector(3 downto 0);
signal s: std_logic_vector(3 downto 0);
signal cout : std_logic;

begin

    UUT: CLAdder port map(cin, x,y,s,cout);
    
    process 
    begin
        x <= "1010";
        y <= "0010";
        cin <= '0';
        wait for 100 ns;
        x <= "0101";
        wait for 100 ns;
        y <= "0100";
        wait for 100 ns;
        cin <= '1';
        x <= "1000";
        wait for 100 ns;
        cin <= '0';
        y <= "0111";
        wait for 100 ns;
        x <= "1001";
        wait for 100 ns;
        y <= "1000";
        wait;
    end process;
end Behavioral;
