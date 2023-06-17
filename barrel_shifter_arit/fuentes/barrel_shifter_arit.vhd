-- Barrel shifter aritmetico de ancho widht y stages parametrizable 
-- Se utiliza ancho de componente fijo (mux 2x1) 
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity barrel_shifter_arit is
    generic(
        stages:natural:=4; 
        widht_input:natural:=8 
    ); 
    port (
        d:   in std_logic_vector(widht_input -1 downto 0);
        sel: in std_logic_vector(stages-1 downto 0) ;
        q:  out std_logic_vector(widht_input -1 downto 0)
    );
end barrel_shifter_arit;

architecture barrel_shifer_arit_arq  of barrel_shifter_arit is
    component mux2x1 is
        port (
            a_in: in std_logic; 
            b_in: in std_logic; 
            sel: in std_logic ; 
            sal_out : out std_logic 
        );
    end component;
    --vector de vectores 
    type  qStagesout is array (0 to stages) of std_logic_vector(widht_input-1 downto 0) ; 
    signal qshift: qStagesout ; 

begin
    ---se debe generar un desplazamiento de 2^-i para cada etapa.. gener
    BSARIT: 
    for i in 0 to stages-1 generate
        wideR:  
        for j in d'range generate
            EXT_SIGN: 
            if (j>= (widht_input-1)-(2**i)) generate
                MUX_PORTS:mux2x1
                port map(
                    a_in  => qshift(i)(j),
                    b_in  => qshift(i)(widht_input-1),
                    sel   => sel(i), 
                    sal_out => qshift(i+1)(j)
                );
            end generate ;  
            BSHIFT: 
            if (j< (widht_input-1)-(2**i)) generate
                MUX_PORTS_1:mux2x1
                    port map(
                        a_in  => qshift(i)(j),
                        b_in  => qshift(i)(j+(2**i)),
                        sel     => sel(i), 
                        sal_out => qshift(i+1)(j)
                    ); 
            end generate ; 
        end generate ; 
    end generate ; 
    qshift(0) <= d ; 
    q <= qshift(stages) ; 



end architecture;