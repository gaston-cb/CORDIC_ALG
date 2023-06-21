library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use std.textio.all;
--use std.env.finish;


entity coordic_recursivo_tb is
end coordic_recursivo_tb;

architecture sim of coordic_recursivo_tb is
   constant N_tb:natural := 18 ; 
   signal x0_tb : std_logic_vector(N_tb -1 downto 0):="001001101101110100";   
   signal y0_tb : std_logic_vector(N_tb -1 downto 0):="000000000000000000";  
   signal z0_tb : std_logic_vector(N_tb -1 downto 0):="001100100100001111";  
   signal xn_tb : std_logic_vector(N_tb -1 downto 0);
   signal yn_tb : std_logic_vector(N_tb -1 downto 0) ; 
   signal zn_tb : std_logic_vector(N_tb -1 downto 0) ;  
   signal clk_tb: std_logic:='0' ;  
   signal rst_tb: std_logic:='0' ;
   signal test_file_end: std_logic:='0' ; 
   file report_result:text ; 

   function bin (lvec: in std_logic_vector) return string is
        variable text: string(lvec'length-1 downto 0) := (others => '9');
        begin
            for k in lvec'range loop
                case lvec(k) is
                    when '0' => text(k) := '0';
                    when '1' => text(k) := '1';
                    when 'U' => text(k) := 'U';
                    when 'X' => text(k) := 'X';
                    when 'Z' => text(k) := 'Z';
                    when '-' => text(k) := '-';
                    when others => text(k) := '?';
                end case;
            end loop;
            return text;
    end function;








begin

    clk_tb <= not clk_tb after 20 ns ; 
    rst_tb <= '1' after 10 ns,'0' after 22 ns ; 
    test_file_end <= '1' after 990 ns ; 
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
    
    TEST_CORDIC: process is 
        variable line_number: integer := 0 ; 
        constant ancho:integer:=18 ; 
        variable iteraciones:integer:= 0 ; 
        variable estado        : file_open_status;
        variable string_salx :line ;  
        variable string_saly :line ; 
        variable string_salz :line ;   
        variable file_is_open:  boolean;


        begin 
        report "iniciando la escritura de archivo" 
            severity note;
        --if not file_is_open then
        file_open(estado, report_result, "coordic_tb_file.txt", write_mode);
        file_is_open := true;
        --end if;
     
        assert estado = open_ok
            report "No se pudo crear el archivo para escribir los resultados"
            severity failure;
        -- bucle "for con rising_edge" 
        while iteraciones <=50 loop
            wait until rising_edge(clk_tb); 
            iteraciones := iteraciones +1 ; 
            write(string_salx, bin(x0_tb) &" "&
                               bin(xn_tb) &" "& 
                               bin(y0_tb) &" "&
                               bin(yn_tb) &" "&
                               bin(z0_tb) &" "&
                               bin(zn_tb) ); 
            writeline(report_result,string_salx)  ;   
        end loop; 
        file_close(report_result) ; 
        report "exito"
            severity note ; 
        wait ; 
        end process ;  

end architecture;