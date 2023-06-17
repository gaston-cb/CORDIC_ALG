library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



entity barrel_shifter_arit_tb is
end barrel_shifter_arit_tb;

architecture barrel_shifter_arit_tb_Arq of barrel_shifter_arit_tb is
    constant stages_tb:natural :=3;
    constant widht:natural := 8;
    signal d_tb : std_logic_vector(widht-1 downto 0) :="11010000"     ; 
    signal q_tb : std_logic_vector(widht-1 downto 0) ; 
    signal sel_tb : std_logic_vector(stages_tb-1 downto 0):="000"  ; 


begin
    sel_tb <= "001" after 100 ns, "010" after 200 ns, "011" after 300 ns, "101" after 400 ns,"000" after 800 ns ;  
  --  d_tb <= "0001" after 200 ns, "0010" after 300 ns, "0100" after 400 ns, "1000" after 500 ns ;  

    DUT : entity work.barrel_shifter_arit
    generic map(
        stages      =>  stages_tb, 
        widht_input => widht 
    )
    port map (
        d    => d_tb , 
        q    => q_tb ,
        sel  => sel_tb 
    );

end architecture;