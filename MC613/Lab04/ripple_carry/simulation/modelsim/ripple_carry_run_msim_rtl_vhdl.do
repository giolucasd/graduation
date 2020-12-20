transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/intelFPGA_lite/17.1/ripple_carry/ripple_carry.vhd}
vcom -93 -work work {C:/intelFPGA_lite/17.1/ripple_carry/full_adder.vhd}

