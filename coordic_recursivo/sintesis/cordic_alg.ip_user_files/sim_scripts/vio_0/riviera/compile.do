transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vmap -link {/home/gvaldez/cordic_clp_final/coordic_tpfinal/coordic_recursivo/sintesis/cordic_alg.cache/compile_simlib/riviera}
vlib riviera/xil_defaultlib

vcom -work xil_defaultlib -93  -incr \
"../../../../cordic_alg.gen/sources_1/ip/vio_0/sim/vio_0.vhd" \


