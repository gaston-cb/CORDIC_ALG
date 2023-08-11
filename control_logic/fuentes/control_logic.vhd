library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity control_logic is
    generic(
        N : natural :=4 
    );
    port (
        clk_in     : in std_logic ;
        start_i : in std_logic ; --inout preguntar 
        input_counter : in std_logic_vector(N-1 downto 0) ;        
        end_iter: out std_logic    ; 
        ena_counter: out std_logic ; 
        rst_counter: out std_logic ; 
        load_port: out std_logic 
        );
end control_logic;

architecture control_logic_arq of control_logic is
    constant iter:natural :=12 ; 
    type fsm_control is (LOAD_INITIAL,COMPUTE,END_ITERa) ; 
    signal fsm_is: fsm_control ;--:=END_ITERa;
    signal s1,s2: std_logic ; 
    signal s3 : std_logic_vector(N-1 downto 0) ;     
begin
    rst_counter <=s1; 
    ena_counter <=s2; 
    --input_counter<=s3 ; 
    COUNT_ITER: entity work.countNmodMbit
    generic map(
        N => N,
        M => iter 
    )
    port map(
        clk_in => clk_in,
        ena_in => s2,--ena_counter,
        rst_in => s1, --rst_counter, 
        q_out  => s3
    ); 


    process (clk_in)
        begin 
            if start_i = '1' then 
                fsm_is <= LOAD_INITIAL  ; 
                load_port <= '0'; 
            elsif input_counter = std_logic_vector(to_unsigned(0,N)) then 
                ena_counter <='0' ; 
                fsm_is <= END_ITERa ;
            end if ;  

    end process; 

    TRANSICIONES:process (fsm_is)
        begin 
            if fsm_is = LOAD_INITIAL then 
                fsm_is <= COMPUTE;
                ena_counter <= '1' ;   
            elsif fsm_is = COMPUTE then 
                fsm_is <= END_ITERa; 
            elsif fsm_is = END_ITERa then    
                fsm_is <= LOAD_INITIAL ; 
            end if ;      
        end process; 
end architecture;