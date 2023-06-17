ghdl -a ../../sum1bit/fuentes/sumador1bit.vhd ../fuentes/sumador_restador_Nbits.vhd ../fuentes/sumador_restador_Nbits_tb.vhd 
ghdl -s ../../sum1bit/fuentes/sumador1bit.vhd ../fuentes/sumador_restador_Nbits.vhd ../fuentes/sumador_restador_Nbits_tb.vhd 
ghdl -e sumador_restador_Nbits_tb 
ghdl -r sumador_restador_Nbits_tb --vcd=sumador_restador_Nbits_tb.vcd --stop-time=1000ns
gtkwave sumador_restador_Nbits_tb.vcd 