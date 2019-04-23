test: icarus_tb.out alu.rom ucode.rom instr.rom
	vvp icarus_tb.out

icarus_tb.out: icarus_tb.v cscvon8.v counter.v ram.v register.v rom.v uart.v \
		alu.rom ucode.rom instr.rom
	iverilog -o icarus_tb.out icarus_tb.v

clean:
	rm -f *.vcd *.out
