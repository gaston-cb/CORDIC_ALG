library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity coordic_recursivo is
    generic(
        N:natural:=18 
    ); 
    port (
        clk_in : in std_logic;
        rst_in : in std_logic;
        x0:in std_logic_vector (N-1 downto 0) ; 
        y0:in std_logic_vector (N-1 downto 0) ; 
        z0:in std_logic_vector (N-1 downto 0)  ; 
        xN:out std_logic_vector(N-1 downto 0)  ; 
        yN:out std_logic_vector(N-1 downto 0)  ; 
        zN:out std_logic_vector(N-1 downto 0)   
    );
end coordic_recursivo;

architecture rtl of coordic_recursivo is

    constant iter: natural := 10 ;                -- CANTIDAD DE ITERACIONES -- MATCHEA CON ROM TABLE
    constant nflip_flop_counter: natural := 10 ;  -- CANTIDAD DE ITERACIONES -- MATCHEA CON ROM TABLE
----  Entrada a los registros de x,y ,z ----------------------
    signal inputXReg:std_logic_vector(N-1 downto 0) ; --S1
    signal inputYReg:std_logic_vector(N-1 downto 0) ; --S2
    signal inputZReg:std_logic_vector(N-1 downto 0) ; --S3
----------------Entrada al MUXCOORDIC-------------------
    
    signal inputXnmux:std_logic_vector(N-1 downto 0) ; --s10
    signal inputYnmux:std_logic_vector(N-1 downto 0) ; --s11
    signal inputZnmux:std_logic_vector(N-1 downto 0) ; --s12
    signal select_input_mux:std_logic ; --s15
---------------------------------------------------------
-------Señales del contador -----------------------------
---------------------------------------------------------    
    signal sal_comparador:std_logic_vector(nflip_flop_counter-1 downto 0)  ;--s13

---------------------- señales entrada de FULL_ADDER DE X---------------
    signal inputXFA:std_logic_vector(N-1 downto 0) ;      --S4 
    signal inputYFASHIFT:std_logic_vector(N-1 downto 0) ; --S7 
    signal carry_out_x:std_logic; 
---------------------- señales entrada de FULL_ADDER DE Y---------------
    signal inputYFA:std_logic_vector(N-1 downto 0) ;   --S5
    signal inputXFASHIFT:std_logic_vector(N-1 downto 0) ; --S8
    signal carry_out_y:std_logic; 
---------------------- señales entrada de FULL_ADDER DE Z---------------
    signal inputZFAROM:std_logic_vector(N-1 downto 0) ; --S9
    signal carry_out_z:std_logic; 
    signal inputZFA:std_logic_vector(N-1 downto 0) ;  --S6 
    signal FA_select_op:std_logic; 


    --signal rst_register:std_logic ; 
------------------------------------------------------------------------     
--
   -- signal inputZReg:std_logic_vector(N-1 downto 0) ; 

begin
    Xn <= inputXnmux  ;
    Yn <= inputYnmux  ;
    Zn <= inputZnmux  ; 
   -- rst_register <= not  select_input_mux; 
-------------------------------MULTIPLEXORES DE ENTRADA ------------------------------------------------------------
    MUXXIN: entity work.muxInputN
        generic map(
            widht_bus_in => N
        )
        port map(
            sel => select_input_mux, 
            a   => x0,
            b   => inputXnmux,   
            sal => inputXReg
        ); 

    MUXYIN: entity work.muxInputN
        generic map(
            widht_bus_in => N
        )
        port map(
            sel => select_input_mux, 
            a   => y0,
            b   => inputYnmux,   
            sal => inputYReg
        ); 

    MUXZIN: entity work.muxInputN
        generic map(
            widht_bus_in => N
        )
        port map(
            sel => select_input_mux, 
            a   => z0,
            b   => inputZnmux,   
            sal => inputZReg
        );
    select_input_mux <= '1' when sal_comparador/= std_logic_vector(to_unsigned(0,nflip_flop_counter)) else '0' ; 
----------------------------------------------------------------------------------------------------------------------------
 ------ REGISTROS DE ENTRADA ------------------------------ REGX
-----------------------------------------------------------------------------------------------------------------------------
    REGX: entity work.registroPPNbits
        generic map(
            N =>N 
        )
        port map(
            clk => clk_in, 
            rst => rst_in , 
            ena =>'1', 
            D => inputXReg,
            Q => inputXFA 
        ); 
    
    REGY: entity work.registroPPNbits
        generic map(
            N =>N 
        )
        port map(
            clk => clk_in, 
            rst => rst_in, 
            ena =>'1', 
            D => inputYReg,
            Q => inputYFA 
        ); 
    
    REGZ: entity work.registroPPNbits
        generic map(
            N =>N 
        )
        port map(
            clk => clk_in, 
            rst => rst_in , 
            ena =>'1', 
            D => inputZReg,
            Q => inputZFA 
        ); 

--------------------------FULL_ADDER_XYZ---------------------------------------------------------------
    FA_select_op <= inputZFA(N-1) ; 
    FAZ:entity work.sumador_restador_Nbits
    generic map(
        N=> N
    )
    port map(
        a_in => inputZFA,
        b_in => inputZFAROM,
        sel  => FA_select_op,
        s_out =>inputZnmux, 
        c_out => carry_out_z
    );

    FAY:entity work.sumador_restador_Nbits
    generic map(
        N=> N
    )
    port map(
        a_in => inputYFA,
        b_in => inputXFASHIFT,
        sel  => FA_select_op,
        s_out =>inputYnmux, 
        c_out => carry_out_x
    );
    FAX:entity work.sumador_restador_Nbits
    generic map(
        N=> N
    )
    port map(
        a_in => inputXFA,
        b_in => inputYFASHIFT,
        sel  => FA_select_op,
        s_out =>inputXnmux, 
        c_out => carry_out_y
    ); 

------------------------------------shifter N bits ----------------------------------------------
    FAYSHIFT: entity work.barrel_shifter_arit
        generic map(
            stages      =>  iter, 
            widht_input => N 
        )
        port map(
            d =>  inputYFA,
            sel=> sal_comparador, 
            q=>   inputYFASHIFT
        ) ; 
    FAXSHIFT: entity work.barrel_shifter_arit
        generic map(
            stages      =>  iter, 
            widht_input => N 
        )
        port map(
            d =>  inputXFA,
            sel=> sal_comparador, 
            q=>   inputXFASHIFT
        ) ; 





---------------Contador General -----------------------------------------------------------------
    COUNT_ITER: entity work.countNmodMbit
        generic map(
            N => nflip_flop_counter,
            M => iter 
        )
        port map(
            clk_in => clk_in,
            ena_in => '1', 
            rst_in => rst_in, 
            q_out  => sal_comparador 
        ); 
    
    
------------------------Memoria ROM ----------------------------------------------------
    LOOKUP_TABLE:entity work.memoria_rom
        generic map(
            data_width  => N, 
            addr_length => nflip_flop_counter
        )
        port map(
            clk => clk_in, 
            address => sal_comparador, 
            data_out=>inputZFAROM 
        ); 
-----------------------------------------------------------------------------------------------

end architecture;