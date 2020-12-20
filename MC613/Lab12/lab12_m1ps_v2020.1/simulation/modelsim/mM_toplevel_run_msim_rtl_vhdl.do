transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlib Processor
vmap Processor Processor
vcom -93 -work Processor {C:/intelFPGA_lite/17.1/lab12_m1ps_v2020.1/Processor/dec5_to_32.vhd}
vcom -93 -work Processor {C:/intelFPGA_lite/17.1/lab12_m1ps_v2020.1/Processor/reg.vhd}
vcom -93 -work Processor {C:/intelFPGA_lite/17.1/lab12_m1ps_v2020.1/Processor/PC.vhd}
vcom -93 -work Processor {C:/intelFPGA_lite/17.1/lab12_m1ps_v2020.1/Processor/pack.vhd}
vcom -93 -work Processor {C:/intelFPGA_lite/17.1/lab12_m1ps_v2020.1/Processor/bank.vhd}
vcom -93 -work Processor {C:/intelFPGA_lite/17.1/lab12_m1ps_v2020.1/Processor/memory.vhd}
vcom -93 -work Processor {C:/intelFPGA_lite/17.1/lab12_m1ps_v2020.1/Processor/ALU.vhd}
vcom -93 -work work {C:/intelFPGA_lite/17.1/lab12_m1ps_v2020.1/Processor/zbuffer.vhd}
vcom -93 -work Processor {C:/intelFPGA_lite/17.1/lab12_m1ps_v2020.1/Processor/UC.vhd}

