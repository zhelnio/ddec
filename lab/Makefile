
PWD      := $(shell pwd)
LAB_LIST := $(wildcard [1-3]*/.)

.PHONY: $(LAB_LIST)

################################################
# global tasks

$(LAB_LIST):
	make -C $@ $(LAB_TARGET)

clean: LAB_TARGET = clean
clean: $(LAB_LIST)

synth: LAB_TARGET = synth
synth: $(LAB_LIST)

sim: LAB_TARGET = sim
sim: $(LAB_LIST)

icarus: LAB_TARGET = icarus
icarus: $(LAB_LIST)

board_all: LAB_TARGET = board_all
board_all: $(LAB_LIST)

################################################
# remote programmer settings

JTAG_REMOTE_HOST = 10.0.110.213
JTAG_REMOTE_PASS = 123

jtag_remote:
	jtagconfig --addserver $(JTAG_REMOTE_HOST) $(JTAG_REMOTE_PASS)
