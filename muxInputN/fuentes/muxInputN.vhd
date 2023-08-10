library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity muxInputN is
    generic(
        widht_bus_in: natural:=4 
    ); 
    port (
        sel:in std_logic ;  --0 -> load value, 1 init a algorithm
        a: in std_logic_vector(widht_bus_in-1 downto 0);  
        b: in std_logic_vector(widht_bus_in-1 downto 0); 
        sal: out std_logic_vector(widht_bus_in-1 downto 0) 
        ); 
end muxInputN;

architecture muxInputN_arq of muxInputN is
    component mux2x1 is
        port (
            a_in: in std_logic; 
            b_in: in std_logic; 
            sel: in std_logic ; 
            sal_out : out std_logic 
        );
    end component;
 

begin
 
    MUXGEN:for i in 0 to widht_bus_in-1 generate
        MUXNBITS:mux2x1
        port map(
            a_in => a(i),
            b_in => b(i),
            sel  => sel  ,
            sal_out => sal(i)             
        ); 

    end generate ;  


end architecture;