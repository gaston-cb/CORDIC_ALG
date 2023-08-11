ghdl -a ../../registroN/fuentes/registroPPNbits.vhd ../../countNmodMbit/fuentes/countNmodMbit.vhd \
        ../fuentes/control_logic.vhd  ../fuentes/control_logic_tb.vhd
ghdl -s ../../registroN/fuentes/registroPPNbits.vhd ../../countNmodMbit/fuentes/countNmodMbit.vhd \
        ../fuentes/control_logic.vhd  ../fuentes/control_logic_tb.vhd
ghdl -e control_logic_tb 
ghdl -r control_logic_tb --vcd=control_logic_tb.vcd --stop-time=1000ns
gtkwave control_logic_tb.vcd 
