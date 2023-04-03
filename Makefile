
m=DE1_SoC
export m

simulate: simulate-alone clean

compile: compile-alone clean

simulate-alone:
	./scripts/simulate_module.sh $(m)

compile-alone:
	/mnt/c/intelFPGA_lite/17.0/quartus/bin64/quartus_sh.exe --flow compile src/$(m)

clean:
	./scripts/cleanup.sh