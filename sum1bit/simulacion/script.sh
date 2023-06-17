ghdl -a ../fuentes/sumador1bit.vhd ../fuentes/sumador1bit_tb.vhd 
ghdl -s ../fuentes/sumador1bit.vhd ../fuentes/sumador1bit_tb.vhd 
ghdl -e sumador1bit_tb 
ghdl -r sumador1bit_tb --vcd=sumador1bit_tb.vcd --stop-time=1000ns
gtkwave sumador1bit_tb.vcd 