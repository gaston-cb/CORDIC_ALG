library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity muxInputN_tb is
end muxInputN_tb;

architecture muxInputN_tb of muxInputN_tb is
    constant widht_tb:natural := 10 ; 
    signal a_tb:std_logic_vector(widht_tb-1 downto 0):="0110001111" ;  
    signal b_tb:std_logic_vector(widht_tb-1 downto 0):="1110000011" ; 
    signal sel_tb: std_logic:='0'  ; 
    signal q_out: std_logic_vector(widht_tb-1 downto 0)  ; 
begin
    sel_tb <='1' after 200 ns, '0' after 300 ns, '1' after 400 ns,'0' after 800 ns ; 

    DUT : entity work.muxInputN
    generic map(
        widht_bus_in =>widht_tb 
    )
    port map (
        sel => sel_tb, 
        a => a_tb, 
        b => b_tb ,
        sal => q_out 
    );

end architecture;