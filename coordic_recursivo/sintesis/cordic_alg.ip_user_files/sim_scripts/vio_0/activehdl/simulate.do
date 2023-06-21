transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+vio_0  -L xil_defaultlib -L secureip -O2 xil_defaultlib.vio_0

do {vio_0.udo}

run

endsim

quit -force
