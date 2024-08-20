vlib work
vlog main_decoder.v alu_decoder.v control_unit.v ALU.v MUX.v shift_left_by2.v adder.v sign_extend.v DFF.v register_file.v data_path.v instruction_memory.v data_memory.v MIPS.v ARCH.v ARCH_tb.v
vsim -voptargs=+acc work.ARCH_tb
add wave *
run -all
#quit -sim