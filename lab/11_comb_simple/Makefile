

PWD     := $(shell pwd)
SIM_DIR  = $(PWD)/sim
SRC_DIR  = $(PWD)
TCL_DIR  = $(PWD)/../../common/tcl

BOARDS_SUPPORTED := de10_lite de0_cv
BOARDS_DEFAULT   := de10_lite

########################################################
# common make targets

clean:
	rm -rf $(SIM_DIR)

simdir: sim_clean
	rm -rf $(SIM_DIR)
	mkdir  $(SIM_DIR)

sim: modelsim_cmd

mrproper: \
	clean \
	synth_clean

########################################################
# simulation - Modelsim

VLIB_BIN = cd $(SIM_DIR) && vlib
VLOG_BIN = cd $(SIM_DIR) && vlog
VSIM_BIN = cd $(SIM_DIR) && vsim

VSIM_OPT_COMMON  = -novopt 
VSIM_OPT_COMMON +=  work.testbench
VSIM_OPT_COMMON += -do $(TCL_DIR)/modelsim.tcl

VSIM_OPT_CMD     = -c
VSIM_OPT_CMD    += -onfinish exit

VSIM_OPT_GUI     = -onfinish stop

modelsim_compile: simdir
	$(VLIB_BIN) work
	$(VLOG_BIN) $(SRC_DIR)/*.v

modelsim_cmd: modelsim_compile
	$(VSIM_BIN) $(VSIM_OPT_COMMON) $(VSIM_OPT_CMD)

modelsim_gui: modelsim_compile
	$(VSIM_BIN) $(VSIM_OPT_COMMON) $(VSIM_OPT_GUI)


########################################################
# simulation - Icarus Verilog

IVER_BIN = cd $(SIM_DIR) && iverilog
VVP_BIN  = cd $(SIM_DIR) && vvp
GTK_BIN  = cd $(SIM_DIR) && gtkwave

IVER_OPT  = -s testbench
IVER_OPT += $(SRC_DIR)/*.v

iverilog_cmd: simdir
	$(IVER_BIN) $(IVER_OPT)
	$(VVP_BIN) -la.lst -n a.out -vcd

iverilog_gui: iverilog_cmd
	$(GTK_BIN) dump.vcd

########################################################
# synthesis - default board only

synth_create:
	make -C synthesis/$(BOARDS_DEFAULT) create

synth_build:
	make -C synthesis/$(BOARDS_DEFAULT) build

synth_open:
	make -C synthesis/$(BOARDS_DEFAULT) open

synth_load:
	make -C synthesis/$(BOARDS_DEFAULT) load

synth_clean:
	make -C synthesis/$(BOARDS_DEFAULT) clean

########################################################
# synthesis - all the supported boards

$(BOARDS_SUPPORTED):
	make -C synthesis/$@ $(SYNTH_TARGET)

synth_all: SYNTH_TARGET := all
synth_all: $(BOARDS_SUPPORTED)

synth_clean: SYNTH_TARGET = clean
synth_clean: $(BOARDS_SUPPORTED)
