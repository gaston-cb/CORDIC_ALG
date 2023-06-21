library ieee;

use ieee.math_real.all  ; 

Package CORDICPACK is
    constant Iteraciones:integer:=32;
    type Mode is (Rotating,Vectoring);
    procedure cordic(x0,y0,z0:in real;xo,yo,zo:out real;Modo:in Mode);
   
end CORDICPACK;

Package body CORDICPACK is
    function sgn(x:in real) return real is
    begin
        if x>=0.0 then
        return 1.0;
        else
        return -1.0;
        end if;
    end;
    procedure cordic(x0,y0,z0:in real;xo,yo,zo:out real;Modo:in Mode) is
        variable x:real:=x0;
        variable y:real:=y0;
        variable z:real:=z0;
        variable xAnt:real;
    begin
    if Modo=Rotating then
        for i in 0 to Iteraciones-1 loop
            xAnt:=x;
            x:=x-y*sgn(z)*2.0**(-i);
            y:=y+xAnt*sgn(z)*2.0**(-i);
            z:=z-sgn(z)*arctan(2.0**(-i));
        end loop;
    else
        for i in 0 to Iteraciones-1 loop
            xAnt:=x;
            x:=x+y*sgn(y)*2.0**(-i);
            z:=z+sgn(z)*arctan(2.0**(-i));
            y:=y-xAnt*sgn(y)*2.0**(-i);
        end loop;
    end if;
    xo:=x;
    yo:=y;
    zo:=z;
 end cordic;
end CORDICPACK;