library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity sumador1bit_tb is
end    sumador1bit_tb;

architecture sumador1bit_tb_arq of sumador1bit_tb is
    
    component sumador1bit is
    port (
        a_in : in std_logic;
        b_in : in std_logic;
        c_in : in std_logic; 
        c_out : out std_logic; 
        s_out : out std_logic 
    );
    end component; 

    signal a_tb :std_logic := '0' ; 
    signal b_tb :std_logic := '0'; 
    signal ci_tb :std_logic := '0'; 
    signal s_o_tb :std_logic ; 
    signal c_o_tb :std_logic ; 
begin
    a_tb <= not a_tb after 10 ns ;  
    b_tb <= not b_tb after 20 ns ; 
    ci_tb <= not ci_tb after 40 ns  ; 
    DUT: sumador1bit
    port map(
        a_in  => a_tb, 
        b_in  => b_tb,
        c_in  => ci_tb,
        c_out   => c_o_tb , 
        s_out => s_o_tb
    ) ; 

end architecture;