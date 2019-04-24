# You need to assemble a source code file to make instr.rom before
# you run 'make' to run the Verilog version of the CPU

# Always run the Verilog simulation
run: a.out instr.rom ucode.rom alu.rom
	vvp a.out
	

# Run the Verilog simulation if the assembled program or any of the
# Verilog files have changed
test.vcd: a.out instr.rom ucode.rom alu.rom

# Build the Verilog simulation
a.out: 74138.v 74139.v 74161.v 74251.v 74574.v 74593.v \
			icarus_tb.v ram.v rom.v tbhelper.v ttlcsvon8.v uart.v
	iverilog -g2012 icarus_tb.v

# Generate the ALU ROM's contents
alu.rom: gen_alu
	./gen_alu

# Generate the Decode ROM's contents
ucode.rom: microcode gen_ucode
	./gen_ucode

# Clean out the Verilog simulation and the assembled program
# but keep the ALU and Decode ROMs
clean:
	rm -rf a.out *.vcd instr.rom

# Clean out everything
realclean: clean
	rm -rf *.rom
