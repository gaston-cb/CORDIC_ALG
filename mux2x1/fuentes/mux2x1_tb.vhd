library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux2x1_tb is
end mux2x1_tb;

architecture mux2x1_tb_arq of mux2x1_tb is
    signal ain_tb :std_logic :='0' ; 
    signal bin_tb :std_logic :='0' ; 
    signal sel :std_logic :='0' ; 
    signal salida :std_logic ; 

begin
    ain_tb <= '1' after 20 ns, '0' after 250 ns ; 
    bin_tb <= '1' after 120 ns, '0' after 325 ns ; 
    sel <= '1' after 30 ns, '0' after 120 ns,'0' after 345 ns ; 
    DUT: entity work.mux2x1
        port map(
            a_in => ain_tb, 
            b_in => bin_tb,
            sel  => sel ,  
            sal_out => salida 
        ); 



end architecture;