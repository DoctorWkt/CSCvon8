Verilog/ucode.rom: microcode gen_ucode
	./gen_ucode; cp ucode.rom Verilog/ucode.rom

clean:
	rm -rf *.rom
