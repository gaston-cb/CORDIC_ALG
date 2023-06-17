ghdl -a ../fuentes/memoria_rom.vhd ../fuentes/memoria_rom_tb.vhd 
ghdl -s ../fuentes/memoria_rom.vhd ../fuentes/memoria_rom_tb.vhd 
ghdl -e memoria_rom_tb 
ghdl -r memoria_rom_tb --vcd=memoria_rom_tb.vcd --stop-time=1000ns
gtkwave memoria_rom_tb.vcd 