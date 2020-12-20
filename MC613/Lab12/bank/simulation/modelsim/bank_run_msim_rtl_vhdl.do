transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/intelFPGA_lite/17.1/bank/bank.vhd}
vcom -93 -work work {C:/intelFPGA_lite/17.1/bank/reg.vhd}
vcom -93 -work work {C:/intelFPGA_lite/17.1/bank/dec5_to_32.vhd}
vcom -93 -work work {C:/intelFPGA_lite/17.1/bank/zbuffer.vhd}

