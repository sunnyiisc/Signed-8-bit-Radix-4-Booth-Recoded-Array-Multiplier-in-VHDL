----------------------------------------------------------------------------------
-- Company: IISc
-- Engineer: Supantha Sen
-- 
-- Create Date: 02.03.2019 16:08:30
-- Design Name: Signed 8-bit Booth Recorder Array Multiplier
-- Module Name: main - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main is
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           b : in STD_LOGIC_VECTOR (7 downto 0);
           y : out STD_LOGIC_VECTOR (15 downto 0));
end main;

architecture Behavioral of main is

component booth_encoder is
    Port ( a : in STD_LOGIC_VECTOR (2 downto 0);
           y : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component partial_product_generator is
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           be : in STD_LOGIC_VECTOR (2 downto 0);
           y : out STD_LOGIC_VECTOR (15 downto 0));
end component;

signal q1, q2, q3, q4 : std_logic_vector (2 downto 0);
signal b0, b1, b2, b3 : std_logic_vector (2 downto 0);
signal s0, s1, s2, s3 : std_logic_vector (15 downto 0);

begin

-- grouping 3 terms together
b0 <= b(1 downto 0) & '0';
b1 <= b(3 downto 1);
b2 <= b(5 downto 3);
b3 <= b(7 downto 5);

c1: booth_encoder port map(b0,q1);
c2: booth_encoder port map(b1,q2);
c3: booth_encoder port map(b2,q3);
c4: booth_encoder port map(b3,q4);
c5: partial_product_generator port map(a, q1, s0);
c6: partial_product_generator port map(a, q2, s1);
c7: partial_product_generator port map(a, q3, s2);
c8: partial_product_generator port map(a, q4, s3);

--sum of partial sum
y <= (s0 + ((s1(13 downto 0))&"00") + ((s2(11 downto 0))&"0000") + ((s3(9 downto 0))&"000000"));

end Behavioral;
