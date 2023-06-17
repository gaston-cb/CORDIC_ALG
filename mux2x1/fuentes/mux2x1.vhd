library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux2x1 is
    port (
        a_in: in std_logic; 
        b_in: in std_logic; 
        sel: in std_logic ; 
        sal_out : out std_logic 
    );
end mux2x1;

architecture mux2x1_arq of mux2x1 is


begin
    sal_out <= (a_in and not sel) or (b_in and sel) ; 
end architecture;
