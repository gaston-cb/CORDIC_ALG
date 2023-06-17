library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity countNmodMbit is
    generic (
        N:natural:=5; -- cantida de bits 
        M: natural:=2 -- cantidad maxima de cuenta M<2**n 
    ) ; 
    port (
        clk_in : in std_logic;
        ena_in : in std_logic ; 
        rst_in : in std_logic ; 
        q_out: out std_logic_vector(N-1 downto 0)  

    );
end countNmodMbit;

architecture countNmodMbit_arq of countNmodMbit is
    signal inp_count: std_logic_vector(N-1 downto 0) ;
    signal sal_out: std_logic_vector(N-1 downto 0) ; 
    signal rst_count: std_logic ; 
    signal sal_comp: std_logic ; 
begin
    q_out <= sal_out ;  
    REGNPP:entity work.registroPPNbits
    generic map(
        N => N 
    )
    port map(
        clk =>clk_in,
        rst =>rst_count,
        ena => ena_in,
        D => inp_count,     
        Q => sal_out       
    ); 
    rst_count <= rst_in or sal_comp ; 
    inp_count <= std_logic_vector(unsigned(sal_out) + to_unsigned(1,N)) ;  
    sal_comp  <='1' when sal_out=std_logic_vector(to_unsigned(M,N)) else '0' ;  

end architecture;