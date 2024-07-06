LIBRARY ieee;
USE ieee.std_logic_1164.all;

Entity latch2 IS
	PORT(B: IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- 8 bit A input
	Resetn, Clock:IN STD_LOGIC; -- 1 bit clock input and 1 bit reset input bit
	Q:OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END latch2;

Architecture Behavior of latch2 IS
	BEGIN 
		PROCESS(Resetn, Clock)--Process takes reset and clock as inputs
		BEGIN
			IF Resetn='0' THEN
				Q <= "00000000";
			ELSIF Clock'EVENT AND Clock = '1' THEN -- Level Sensitive Clock
				Q<=B;
			END IF;
			END PROCESS;
		End Behavior;