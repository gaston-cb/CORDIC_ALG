ghdl -a ../../registroN/fuentes/registroPPNbits.vhd  ../fuentes/countNmodMbit.vhd ../fuentes/countNmodMbit_tb.vhd
ghdl -s ../../registroN/fuentes/registroPPNbits.vhd  ../fuentes/countNmodMbit.vhd ../fuentes/countNmodMbit_tb.vhd
ghdl -e countNmodMbit_tb 
ghdl -r countNmodMbit_tb --vcd=countNmodMbit_tb.vcd --stop-time=1000ns
gtkwave countNmodMbit_tb.vcd 