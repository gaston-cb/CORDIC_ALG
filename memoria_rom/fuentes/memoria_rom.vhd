library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memoria_rom is
    generic (
        data_width : natural := 16;
        addr_length : natural := 10  
        );
     port (
     address :in std_logic_vector(addr_length-1 downto 0);
     data_out:out std_logic_vector(data_width-1 downto 0)
     );
end memoria_rom;

architecture memoria_rom_arq of memoria_rom is
    constant mem_size : natural := 2**addr_length;
    type mem_type is array (mem_size-1 downto 0) of std_logic_vector (data_width-1 downto 0);
 constant mem : mem_type := ( 
    1  => "001100100100001111" ,
    2  => "000111011010110001" , 
    3  => "000011111010110110" ,
    4  => "000001111111010101" ,
    5  => "000000111111111010" ,
    6  => "000000011111111111" ,
    7  => "000000001111111111" ,
    8  => "000000000111111111" ,
    9  => "000000000011111111" ,
    10  => "000000000001111111" ,
    11 => "000000000000111111", 
    12 => "000000000000011111", 
    13 => "000000000000001111", 
    14 => "000000000000000111", 
    15 => "000000000000000011", 
 others => std_logic_vector(to_unsigned (0,data_width)));

 begin
    rom : process (address)
    begin       
            data_out <=mem(to_integer(unsigned(address)));
    end process rom;



end architecture;