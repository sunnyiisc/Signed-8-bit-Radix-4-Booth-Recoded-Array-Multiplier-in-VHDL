----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.03.2019 14:31:05
-- Design Name: 
-- Module Name: booth_encoder - Behavioral
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

entity booth_encoder is
    Port ( a : in STD_LOGIC_VECTOR (2 downto 0);
           y : out STD_LOGIC_VECTOR (2 downto 0)); --y(0)=negative, y(1)=doubling. y(2)=same
end booth_encoder;

architecture Behavioral of booth_encoder is

begin
y(0) <= a(2);   --select negative
y(1) <= (not(a(2)) and a(1) and a(0)) or 
        (a(2) and not(a(1)) and not(a(0)));    --select doubling
y(2) <= a(1) xor a(0); --select same

end Behavioral;
