transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/intelFPGA_lite/17.1/xbar_stage_8/xbar_stage_8.vhd}
vcom -93 -work work {C:/intelFPGA_lite/17.1/xbar_stage_8/xbar_gen.vhd}
vcom -93 -work work {C:/intelFPGA_lite/17.1/xbar_stage_8/xbar_v2.vhd}

