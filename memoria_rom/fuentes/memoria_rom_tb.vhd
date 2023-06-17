library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memoria_rom_tb is
end memoria_rom_tb;

architecture memoria_rom_tb_arq of memoria_rom_tb is

    constant size_memory:natural:=4 ; 
    constant widht_tb:natural:=18 ; 
    signal q_out_tb: std_logic_vector(widht_tb-1 downto 0) ; 
    signal address_tb:std_logic_vector(size_memory-1 downto 0) ;

    signal clk : std_logic := '0';
    signal rst : std_logic := '0';

begin

    clk <= not clk after 10 ns;
    address_tb <= std_logic_vector(to_unsigned(0,size_memory)) after 40 ns, 
                std_logic_vector(to_unsigned(1,size_memory)) after   80 ns, 
                std_logic_vector(to_unsigned(2,size_memory)) after  120 ns,
                std_logic_vector(to_unsigned(3,size_memory)) after  160 ns,
                std_logic_vector(to_unsigned(4,size_memory)) after  200 ns,
                std_logic_vector(to_unsigned(5,size_memory)) after  240 ns,
                std_logic_vector(to_unsigned(6,size_memory)) after  280 ns,
                std_logic_vector(to_unsigned(7,size_memory)) after  320 ns,
                std_logic_vector(to_unsigned(8,size_memory)) after  360 ns,
                std_logic_vector(to_unsigned(9,size_memory)) after  400 ns,
                std_logic_vector(to_unsigned(10,size_memory)) after 440 ns,
                std_logic_vector(to_unsigned(11,size_memory)) after 480 ns,
                std_logic_vector(to_unsigned(12,size_memory)) after 520 ns;
                 

    DUT : entity work.memoria_rom
    generic map(
        data_width  =>  widht_tb, 
        addr_length => size_memory
    )
    port map (
        clk  =>clk,
        address =>address_tb,
        data_out => q_out_tb
        
    );

    
end architecture;