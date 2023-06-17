library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity registroPPNbits is
    generic(
        N: natural :=5 
    ); 
    port (
        clk : in std_logic;
        rst : in std_logic;
        ena:  in std_logic;
        D: in std_logic_vector(N-1 downto 0); 
        Q: out std_logic_vector(N-1 downto 0)  
        );
end registroPPNbits;

architecture registroN_arq of registroPPNbits is

begin
    process(clk)
        begin
            if rising_edge(clk) then 
                if rst = '1' then 
                    Q <= (others =>'0')  ; -- (N-1 downto 0 =>'0') 
                elsif ena = '1' then
                    Q <= D ; 
    --            else Se hace explicito mantener el estado anterior
    --                Q <= Q ; 
                end if ; 
            end if; 
    end process; 
end architecture;