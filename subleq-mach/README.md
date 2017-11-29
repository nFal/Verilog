A project aiming to simulate a basic one instruction set machine, able to execute only the 'subleq' instruction.

Compile and simulate with icarus verilog. View waveform with gtkwave.

Relevant commands:
1. iverilog -o <op_file_name> <inp_design/tb_files>   --- compilation
2. vvp <compiled_file>                                --- simulation
3. gtkwave <vcd_file>                                 --- waveform viewing

e.g:
1. iverilog -o pcreg tb_PC_reg.v PC_reg.v
2. vvp pcreg (assume generates output.vcd)
3. gtkwave output.vcd

