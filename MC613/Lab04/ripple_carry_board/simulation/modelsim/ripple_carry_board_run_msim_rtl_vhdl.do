transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/intelFPGA_lite/17.1/ripple_carry_board/ripple_carry_board.vhd}
vcom -93 -work work {C:/intelFPGA_lite/17.1/ripple_carry_board/ripple_carry.vhd}
vcom -93 -work work {C:/intelFPGA_lite/17.1/ripple_carry_board/full_adder.vhd}
vcom -93 -work work {C:/intelFPGA_lite/17.1/ripple_carry_board/bin2hex.vhd}

