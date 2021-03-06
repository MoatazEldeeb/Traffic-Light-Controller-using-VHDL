LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
entity TLC_test is
end entity;
architecture tb of TLC_test is
signal Trafficlights : std_logic_vector (11 downto 0);
signal Clck,Reset,ManualSwitch: std_logic;
begin

DUT : ENTITY work.TLC
PORT MAP(Trafficlights=>Trafficlights,Clck=>Clck,Reset=>Reset,ManualSwitch=>ManualSwitch);
Clock : process
begin
Clck <= '0';
wait for 10 ns;
Clck <= '1';
wait for 10 ns;
end process;
stimulis : process
begin
 report("Starting simulation");
 Reset <= '1';
 ManualSwitch<= '0';
 wait for 20 ns;
 
 ManualSwitch <= '0';
 Reset <= '0';
 wait for 20 ns;
 
 ManualSwitch<= '1';
 wait for 20 ns;
 
 ManualSwitch <= '0';
 wait for 200 ns;
 
 ManualSwitch <= '1';
 wait for 20 ns;
 
 ManualSwitch <='0';
 Reset <= '0';
 wait for 20000 ns;
 
 
 report("End simulation");
end process;
end architecture;
