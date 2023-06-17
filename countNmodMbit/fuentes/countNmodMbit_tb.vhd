library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity countNmodMbit_tb is
end countNmodMbit_tb;

architecture countNmodMbit_tb of countNmodMbit_tb is
    constant N_tb: natural:=8 ; 
    constant M_tb: natural:=32 ; 
    signal q_out_tb:std_logic_vector(N_tb -1 downto 0) ; 
    signal clk : std_logic := '0';
    signal rst : std_logic := '1';
    signal ena_tb: std_logic:='0'; 


begin

    clk <= not clk after 10 ns ;
    rst <= '0' after 20 ns ; 
    ena_tb <= '1' after 25 ns ; 
    
    DUT : entity work.countNmodMbit
    generic map(
        N=>N_tb,
        M => M_tb 
    )
    port map (
        clk_in => clk, 
        ena_in => ena_tb, 
        rst_in =>rst, 
        q_out => q_out_tb 
    );


end architecture;