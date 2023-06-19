library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sumador_restador_Nbits_tb is
end sumador_restador_Nbits_tb;

architecture sumador_restador_Nbits_tb_arq of sumador_restador_Nbits_tb is
    constant N_tb:natural :=18 ; 
    signal a_tb:std_logic_vector(N_tb-1 downto 0):=std_logic_vector(to_signed(-10,N_tb))  ; 
    signal b_tb:std_logic_vector(N_tb-1 downto 0):=std_logic_vector(to_signed(-2,N_tb)) ; 
    signal s_tb:std_logic_vector(N_tb-1 downto 0) ; 
    signal sel:std_logic:='0' ; 
    signal c_out_tb:std_logic ; 
    

begin
    a_tb  <= std_logic_vector(to_signed(-2,N_tb)) after 100 ns, 
             std_logic_vector(to_signed(55,N_tb)) after 200 ns, 
             std_logic_vector(to_signed(8,N_tb)) after 300 ns ; 
    b_tb  <= std_logic_vector(to_signed(-2,N_tb)) after 100 ns, 
             std_logic_vector(to_signed(4,N_tb)) after 200 ns, 
             std_logic_vector(to_signed(-35,N_tb)) after 300 ns; 
    sel <= '1' after 150 ns, '0' after 600 ns,'1' after 800 ns ;  
    DUT: entity work.sumador_restador_Nbits
    generic map(
        N => N_tb
    )
    port map(
        a_in => a_tb, 
        b_in => b_tb, 
        sel => sel, 
        s_out => s_tb, 
        c_out => c_out_tb 
    ) ; 
end architecture;