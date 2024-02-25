# Makefile
VERILATOR = verilator
VERILATOR_FLAGS = -Wall -cc --exe 
SIM_MAIN = ./sim_main.cpp
TOP_MODULE = icecream_pkg

# Target for building and running the simulation
all: run

sim: ../../src/$(TOP_MODULE).sv $(SIM_MAIN)
	$(VERILATOR) $(VERILATOR_FLAGS) ../../src/$(TOP_MODULE).sv  ../test_icecream.sv $(SIM_MAIN)
	make -C obj_dir -f V$(TOP_MODULE).mk V$(TOP_MODULE)

# New target for running the simulation
run: clean sim
	obj_dir/V$(TOP_MODULE)

clean:
	rm -fr obj_dir

.PHONY: clean run
