LIBRARY ieee;
USE ieee.std_logic_1164.all;

Entity latch1 IS
	PORT(A: IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- 8 bit A input
	Clock:IN STD_LOGIC; -- 1 bit clock input and 1 bit reset input bit
	Q:OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END latch1;

Architecture Behavior of latch1 IS
	BEGIN 
		PROCESS(Clock)--Process takes reset and clock as inputs
		BEGIN
			IF Clock'EVENT AND Clock = '1' THEN -- Level Sensitive Clock
				Q<=A;
			END IF;
			END PROCESS;
		End Behavior;