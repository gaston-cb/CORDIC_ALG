library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sumador_restador_Nbits is
    generic(
        N: natural:=4  
    ); 
    port (
        a_in: in std_logic_vector(N-1 downto 0) ; 
        b_in: in std_logic_vector(N-1 downto 0) ; 
        sel: in std_logic ; 
        s_out: out std_logic_vector(N-1 downto 0) ; 
        c_out: out std_logic  
    );
end sumador_restador_Nbits;


architecture sumador_restador_Nbits_arq of sumador_restador_Nbits is
    signal connect_carry: std_logic_vector(N downto 0); 
    signal b_aux:std_logic_vector(N-1 downto 0) ; 
     
begin
    c_out <= connect_carry(N); 
    connect_carry(0) <= sel;
   
    sum_rest_inst: for i in 0 to N-1 generate
            b_aux(i) <= b_in(i) xor sel ; 
            sum1b_inst: entity work.sumador1bit  
                    port map(
                    a_in   => a_in(i) , 
                    b_in   => b_aux(i), 
                    c_in   => connect_carry(i), 
                    c_out  => connect_carry(i+1), 
                    s_out  => s_out(i) 
                    ); 
            end generate  ; 
end architecture;