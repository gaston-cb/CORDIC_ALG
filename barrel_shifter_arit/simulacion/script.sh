ghdl -a ../../mux2x1/fuentes/mux2x1.vhd ../fuentes/barrel_shifter_arit.vhd ../fuentes/barrel_shifter_arit_tb.vhd
ghdl -s ../../mux2x1/fuentes/mux2x1.vhd ../fuentes/barrel_shifter_arit.vhd ../fuentes/barrel_shifter_arit_tb.vhd
ghdl -e barrel_shifter_arit_tb 
ghdl -r barrel_shifter_arit_tb --vcd=barrel_shifter_arit_tb.vcd --stop-time=1000ns
gtkwave barrel_shifter_arit_tb.vcd 