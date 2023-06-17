ghdl -a ../fuentes/registroPPNbits.vhd ../fuentes/registroPPNbits_tb.vhd 
ghdl -s ../fuentes/registroPPNbits.vhd ../fuentes/registroPPNbits_tb.vhd 
ghdl -e registroPPNbits_tb 
ghdl -r registroPPNbits_tb --vcd=registroPPNbits_tb.vcd --stop-time=1000ns
gtkwave registroPPNbits_tb.vcd 