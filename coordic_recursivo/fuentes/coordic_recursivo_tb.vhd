library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



entity coordic_recursivo_tb is
end coordic_recursivo_tb;

architecture sim of coordic_recursivo_tb is
   constant N_tb:natural := 18 ; 
   signal x0_tb : std_logic_vector(N_tb -1 downto 0):="001001101101110100"; --std_logic_vector(to_signed(13,N_tb)) ;  
   signal y0_tb : std_logic_vector(N_tb -1 downto 0):="000000000000000000"; --std_logic_vector(to_signed(1,N_tb)) ; 
   signal z0_tb : std_logic_vector(N_tb -1 downto 0):="001100100100001111"; --std_logic_vector(to_signed(1,N_tb)) ; 
   signal xn_tb : std_logic_vector(N_tb -1 downto 0) ; 
   signal yn_tb : std_logic_vector(N_tb -1 downto 0) ; 
   signal zn_tb : std_logic_vector(N_tb -1 downto 0) ;  
   signal clk_tb: std_logic:='0' ;  
   signal rst_tb: std_logic:='1' ;



begin

    clk_tb <= not clk_tb after 20 ns ; 
    rst_tb <= '0' after 35 ns ; 
    DUT : entity work.coordic_recursivo
    generic map(
        N=>N_tb
    )
    port map (
        clk_in => clk_tb,
        rst_in => rst_tb,
        x0 => x0_tb,
        y0 => y0_tb, 
        z0 => z0_tb, 
        Xn => xn_tb,
        Yn => yn_tb,
        Zn => zn_tb       
    );
    
   
end architecture;