library ieee;

use ieee.math_real.all  ; 
use work.CORDICPACK.all;
use std.textio.all;






entity cordic_tb is
end cordic_tb;
architecture TestCordicArch of cordic_tb is


    begin
            Prueba: process
                variable tita,K:real;
                variable sen,cos,atan:real;
                variable xo,yo,zo:real;
                variable linea:line;
                type fi_real is file of real;
                file salidaSen:fi_real open write_mode is  "senFunc32_min.r";
                file salidaCos:fi_real open write_mode is  "cosFunc32_min.r";
                file salidaATan:fi_real open write_mode is "atanFunc32_min.r";
            begin 
            K:=1.0;
            for i in 0 to Iteraciones-1 loop --iter define in package 
                K:=K*(1.0/sqrt(1.0+2.0**(-2*i)));
            end loop;
            tita:=-math_pi/2.0;
            while tita<math_pi/2.0 loop
                wait for 1 ns;

                cordic(K,0.0,tita,cos,sen,zo,Rotating);
                --cordic(1.0,tan(tita),0.0,xo,yo,atan,Vectoring);
                write(salidaSen,sen);
                write(salidaCos,cos);
                --write(salidaAtan,atan);
                tita:=tita+(math_pi/10800.0);
            end loop;
            wait;
         
        end process;
    
end TestCordicArch;
