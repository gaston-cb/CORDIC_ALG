library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity registroPPNbits_tb is
end registroPPNbits_tb;

architecture registroPPNbits_tb_arq of registroPPNbits_tb is
    constant N_tb: natural :=5 ; 
    signal clk_tb: std_logic :='0' ; 
    signal rst_tb: std_logic :='1' ; 
    signal ena_tb: std_logic :='1' ; 
    signal d_tb: std_logic_vector(N_tb-1 downto 0):= "01100"   ; 
    signal q_tb: std_logic_vector(N_tb-1 downto 0) ;  
    
begin
    clk_tb <= not clk_tb after 10 ns ;  
    rst_tb <=  '0' after 100 ns ; 
    ena_tb  <= '0' after 600 ns, '1' after 800 ns ; 
    d_tb <= "01100" after 300 ns, "11110" after 700 ns,"01100" after 900 ns ; 
    DUT: entity work.registroPPNbits
        generic map(
            N =>N_tb 
        )  
        port map(
            clk =>clk_tb, 
            rst => rst_tb, 
            ena => ena_tb, 
            D =>d_tb, 
            Q => q_tb
        ) ; 

end architecture;