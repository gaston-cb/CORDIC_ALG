transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vmap -link {}
vlib activehdl/xil_defaultlib

vcom -work xil_defaultlib -93  \
"../../../../cordic_alg.gen/sources_1/ip/vio_0/sim/vio_0.vhd" \


