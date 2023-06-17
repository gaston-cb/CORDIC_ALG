library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sumador1bit is
    port (
        a_in : in std_logic;
        b_in : in std_logic;
        c_in : in std_logic; 
        c_out : out std_logic; 
        s_out : out std_logic 
    );
end sumador1bit;

architecture sumador1bit of sumador1bit is

begin
    s_out <= (a_in) xor (b_in) xor (c_in) ; 
    c_out <= (a_in and b_in) or (a_in and c_in) or (b_in and c_in) ; 
end architecture;