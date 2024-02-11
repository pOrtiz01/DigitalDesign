transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/labComputer {C:/intelFPGA_lite/18.1/labComputer/register.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/labComputer {C:/intelFPGA_lite/18.1/labComputer/bus.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/labComputer {C:/intelFPGA_lite/18.1/labComputer/datapath.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/labComputer {C:/intelFPGA_lite/18.1/labComputer/alu.v}

vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/labComputer {C:/intelFPGA_lite/18.1/labComputer/ALU_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  ALU_tb

add wave *
view structure
view signals
run 500 ns
