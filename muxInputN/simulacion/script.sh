ghdl -a ../../mux2x1/fuentes/mux2x1.vhd ../fuentes/muxInputN.vhd ../fuentes/muxInputN_tb.vhd
ghdl -s ../../mux2x1/fuentes/mux2x1.vhd ../fuentes/muxInputN.vhd ../fuentes/muxInputN_tb.vhd
ghdl -e muxInputN_tb 
ghdl -r muxInputN_tb --vcd=muxInputN_tb.vcd --stop-time=1000ns
gtkwave muxInputN_tb.vcd 