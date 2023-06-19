ghdl -a ../../sum1bit/fuentes/sumador1bit.vhd ../../sumRestNbits/fuentes/sumador_restador_Nbits.vhd \
        ../../registroN/fuentes/registroPPNbits.vhd ../../countNmodMbit/fuentes/countNmodMbit.vhd \
        ../../mux2x1/fuentes/mux2x1.vhd ../../muxInputN/fuentes/muxInputN.vhd     \
        ../../memoria_rom/fuentes/memoria_rom.vhd \
        ../../barrel_shifter_arit/fuentes/barrel_shifter_arit.vhd     \
        ../fuentes/coordic_recursivo.vhd  \
        ../fuentes/coordic_recursivo_tb.vhd
ghdl -s ../../sum1bit/fuentes/sumador1bit.vhd ../../sumRestNbits/fuentes/sumador_restador_Nbits.vhd \
        ../../registroN/fuentes/registroPPNbits.vhd ../../countNmodMbit/fuentes/countNmodMbit.vhd \
        ../../mux2x1/fuentes/mux2x1.vhd ../../muxInputN/fuentes/muxInputN.vhd     \
        ../../memoria_rom/fuentes/memoria_rom.vhd \
       ../../barrel_shifter_arit/fuentes/barrel_shifter_arit.vhd     \
        ../fuentes/coordic_recursivo.vhd  \
        ../fuentes/coordic_recursivo_tb.vhd
ghdl -e coordic_recursivo_tb 
ghdl -r coordic_recursivo_tb --vcd=coordic_recursivo_tb.vcd --stop-time=2000ns
gtkwave coordic_recursivo_tb.vcd 


