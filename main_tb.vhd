----------------------------------------------------------------------------------
-- Company: IISc
-- Engineer: Supantha Sen
-- 
-- Create Date: 02.03.2019 19:29:21
-- Design Name: Signed 8-bit Booth Recorder Array Multiplier
-- Module Name: main_tb - Behavioral
-- Project Name: Digital System Design using FPGA
-- Target Devices: Xilinx Artix-7 XC7A35T- ICPG236C (Family Artix-7, Part XC7A35T, Package CPG236, Speed Grade -1)
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

entity main_tb is
--  Port ( );
end main_tb;

architecture Behavioral of main_tb is

component main is
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           b : in STD_LOGIC_VECTOR (7 downto 0);
           y : out STD_LOGIC_VECTOR (15 downto 0));
end component;

signal a, b : STD_LOGIC_VECTOR (7 downto 0);
signal y : STD_LOGIC_VECTOR (15 downto 0);

begin
uut : main port map (a, b, y);

process
begin

    wait for 10ns;
    a<=x"07";
    b<=x"03";
    wait for 100ns;
    a<=x"F9";
    b<=x"03";
    wait for 100ns;
    a<=x"F9";
    b<=x"FD";
    wait for 100ns;
    a<=x"EF";
    b<=x"EF";
    wait for 100ns;
    a<=x"EF";
    b<=x"FF";
    wait for 100ns;
    a<=x"7F";
    b<=x"7F";
    wait for 100ns;
    a<=x"05";
    b<=x"04";
    wait for 100ns;
    a<=x"EB";
    b<=x"04";
    wait for 100ns;
    a<=x"EB";
    b<=x"FC";
    wait for 100ns;
    a<=x"00";
    b<=x"00";

    wait;
end process;

end Behavioral;
