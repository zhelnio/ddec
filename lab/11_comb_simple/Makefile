

PWD     := $(shell pwd)
SIM_DIR  = $(PWD)/sim
SRC_DIR  = $(PWD)
BRD_DIR  = $(PWD)/../../common/board

BOARDS_SUPPORTED := de10_lite de0_cv
BOARDS_DEFAULT   := de10_lite

########################################################
# common make targets

clean: \
	modelsim_clean \
	iverilog_clean \
	board_clean

sim: modelsim_cmd

########################################################
# simulation - Modelsim

VSIM_DIR = $(PWD)/sim_modelsim

VLIB_BIN = cd $(VSIM_DIR) && vlib
VLOG_BIN = cd $(VSIM_DIR) && vlog
VSIM_BIN = cd $(VSIM_DIR) && vsim

VSIM_OPT_COMMON += -do ../script_modelsim.tcl

VSIM_OPT_CMD     = -c
VSIM_OPT_CMD    += -onfinish exit

VSIM_OPT_GUI     = -onfinish stop

modelsim_clean:
	rm -rfd $(VSIM_DIR)

modelsim_dir: modelsim_clean
	mkdir $(VSIM_DIR)

modelsim_cmd: modelsim_dir
	$(VSIM_BIN) $(VSIM_OPT_COMMON) $(VSIM_OPT_CMD)

modelsim_gui: modelsim_dir
	$(VSIM_BIN) $(VSIM_OPT_COMMON) $(VSIM_OPT_GUI)


########################################################
# simulation - Icarus Verilog

ISIM_DIR = $(PWD)/sim_icarus

IVER_BIN = cd $(ISIM_DIR) && iverilog
VVP_BIN  = cd $(ISIM_DIR) && vvp
GTK_BIN  = cd $(ISIM_DIR) && gtkwave

IVER_OPT  = -s testbench
IVER_OPT += $(SRC_DIR)/*.v
IVER_OPT += $(SRC_DIR)/*.sv

iverilog_clean:
	rm -rfd $(ISIM_DIR)

iverilog_cmd:
	mkdir $(ISIM_DIR)
	$(IVER_BIN) $(IVER_OPT)
	$(VVP_BIN) -la.lst -n a.out -vcd

iverilog_gui: iverilog_cmd
	$(GTK_BIN) dump.vcd

########################################################
# synthesis - default board only

SYNTH_DIR      = $(PWD)/synth_$(BOARDS_DEFAULT)
SYNTH_TEMPLATE = $(BRD_DIR)/$(BOARDS_DEFAULT)

synth_all: \
	synth_clean \
	synth_create \
	synth_build

synth_clean:
	rm -rfd $(SYNTH_DIR)

synth_create: synth_clean
	cp -r  $(SYNTH_TEMPLATE) $(SYNTH_DIR)

synth_build:
	make -C $(SYNTH_DIR) build

synth_open:
	make -C $(SYNTH_DIR) open

synth_load:
	make -C $(SYNTH_DIR) load

########################################################
# synthesis - all the supported boards

BOARD_NAME         = $@
BOARD_TEMPLATE_DIR = $(BRD_DIR)/$(BOARD_NAME)
BOARD_BUILD_DIR    = $(PWD)/synth_$(BOARD_NAME)

$(BOARDS_SUPPORTED):
	rm -rfd $(BOARD_BUILD_DIR)
	cp -r  $(BOARD_TEMPLATE_DIR) $(BOARD_BUILD_DIR)
	make -C $(BOARD_BUILD_DIR) $(SYNTH_TARGET)

board_all: SYNTH_TARGET := all
board_all: $(BOARDS_SUPPORTED)

board_clean:
	rm -rfd $(PWD)/synth_*
