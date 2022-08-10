----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.03.2019 18:46:23
-- Design Name: 
-- Module Name: partial_product_generator - Behavioral
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
--use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity partial_product_generator is
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           be : in STD_LOGIC_VECTOR (2 downto 0);
           y : out STD_LOGIC_VECTOR (15 downto 0));
end partial_product_generator;

architecture Behavioral of partial_product_generator is

component twos_complement_8bit is
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal q1, q2 : std_logic_vector (7 downto 0);
signal a1: std_logic_vector (7 downto 0);

begin

a1 <= a(6 downto 0) & '0'; --multiplying by 2

c1: twos_complement_8bit port map (a,q1);
c2: twos_complement_8bit port map (a1,q2);

    y <= (x"00" & a) when (be="100" and a(7)='0') else      --partial product is a
         (x"FF" & a) when (be="100" and a(7)='1') else
         (x"00" & a1) when (be="010" and a(7)='0') else    --partial product is 2*a    
         (x"FF" & a1) when (be="010" and a(7)='1') else    --by shifting also the number is positive so we compare msb of a only   
         (x"00" & q1) when (be="101" and q1(7)='0') else    --partial product is -a
         (x"FF" & q1) when (be="101" and q1(7)='1') else
         (x"00" & q2) when (be="011" and q2(7)='0') else    --partial product is -2*a
         (x"FF" & q2) when (be="011" and q2(7)='1') else
         (x"0000");                                         --partial product is 0

end Behavioral;
