library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity control_logic is
    port (
        clk : in std_logic;
        rst : in std_logic;
        start_i: in std_logic;
        end_iter: out std_logic;  
        load_mux:out std_logic; 
        rst_counter:out std_logic; 
        enabled_count_o:out std_logic:='0'; 
        rst_counter_o: out std_logic 
    );
end control_logic;

architecture control_logic_arq of control_logic is
    type fsm_control is (LOAD_INITIAL,COMPUTE,END_ITER) ; 
    signal fsm_is: fsm_control:= END_ITER;


begin
    process (clk):

     begin 
        if start_i = '1'
            load_mux <='0' 
            enabled_count_o <='1' ; 
            fsm_is <= LOAD_INITIAL
        elsif 
        end if ;  

    end process; 

    process (fsm_is):

    begin 
        if fsm_is = LOAD_INITIAL
            fsm_is = COMPUTE; 
        elsif fsm_is = COMPUTE
            fsm_is = END_ITER; 
        elsif fsm_is = END_ITER 
            enabled_count <='0' ; 
            fsm_is = LOAD_INITIAL 
        end if ;      
    end process; 






end architecture;