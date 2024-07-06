library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity ALU is
port(Clock : in std_logic;
A,B : in unsigned(7 downto 0);
student_id : in unsigned(3 downto 0);
OP : in unsigned(15 downto 0);
Neg: out std_logic;
R1: out unsigned(3 downto 0);
R2: out unsigned(3 downto 0));
end ALU;
architecture calculation of ALU is
signal Reg1,Reg2,Result : unsigned(7 downto 0) := (others => '0');
signal Reg4 : unsigned(0 to 7);
signal sum : unsigned(8 downto 0);
begin
Reg1 <= A;
Reg2 <= B;
process(Clock, OP)
begin 
if(rising_edge(Clock))THEN
	case OP is
	WHEN "0000000000000001"=> --1
	
	result <= (Reg1+Reg2);
	neg<='0';
		--add
	WHEN "0000000000000010"=> 
	result <= Reg1 - Reg2;
	if(Reg2>Reg1) then 
		neg<='1';
		result<= ((Not Reg1) +  Reg2 + 1); --2	
		end if;
		--sub
	WHEN "0000000000000100"=>
	result<= (NOT Reg1); --3 
	neg<='0';
		--inverse
	WHEN "0000000000001000"=>
	result<= (NOT(Reg1 and Reg2)); --4
	neg<='0';
		--NAND
	WHEN "0000000000010000"=>
	result<= (NOT(Reg1 or Reg2)); --5
		neg<='0';
	--NOR
	WHEN "0000000000100000"=>
	result<= (Reg1 or Reg2); --6
	neg<='0';
	--OR
	WHEN "0000000001000000"=>
	result<= (Reg1 xor Reg2); --7
	neg<='0';
	--XOR
	WHEN "0000000010000000"=>
	result<= (Reg1 AND Reg2); --7
	neg<='0';
	---and
	WHEN "0000000100000000"=> --8
	result<= Reg1 xnor Reg2;
	neg<='0';
	--XNOR
	WHEN OTHERS =>
	--Don't care, do nothing
end case;
end if;
end process;
R1 <= Result(3 downto 0); -- splitting 8 bits into 2 4 bits
R2 <= Result(7 downto 4);
end calculation;