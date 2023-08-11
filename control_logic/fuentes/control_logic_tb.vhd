library ieee;
use ieee.std_logic_1164.all;

entity control_logic_tb is
end control_logic_tb;

architecture control_logic_tb_arq of control_logic_tb is
    constant N_tb         : natural:= 5 ; 
    -- type fsm_control is (LOAD_INITIAL,COMPUTE,END_ITERa) ; 

    signal clk            : std_logic := '1';
    signal rst            : std_logic := '1';
    signal start_i_tb     :std_logic ; 
    signal count_tb       :std_logic_vector(N_tb-1 downto 0) ; 
    signal ena_counter_tb :std_logic ; 
    signal rst_counter_tb :std_logic; 
    signal load_counter_tb:std_logic; 
    signal end_iter_tb    :std_logic ; 

begin

    clk <= not clk after 10 ns ;
    start_i_tb <='1' after 25 ns, '0' after 35 ns ; 
    DUT : entity work.control_logic
    generic map(
        N => N_tb 
    )
    port map (
        clk_in        =>  clk,   
        start_i       =>  start_i_tb,    
        input_counter =>  count_tb,        
        end_iter      =>  end_iter_tb,          
        ena_counter   =>  ena_counter_tb,   
        rst_counter   =>  rst_counter_tb,   
        load_port     =>  load_counter_tb  
    );

  
end architecture;