ghdl -a ../fuentes/mux2x1.vhd ../fuentes/mux2x1_tb.vhd 
ghdl -s ../fuentes/mux2x1.vhd ../fuentes/mux2x1_tb.vhd 
ghdl -e mux2x1_tb 
ghdl -r mux2x1_tb --vcd=mux2x1_tb.vcd --stop-time=1000ns
gtkwave mux2x1_tb.vcd 