
PWD = $(shell pwd)
PROJECT_NAME = system

OPT_VIVADO = -mode batch

all: build

create:
	vivado $(OPT_VIVADO) -source system_create.tcl

open:
	vivado $(PROJECT_NAME).xpr

build:
	vivado $(OPT_VIVADO) -source system_synth.tcl

load:
	vivado $(OPT_VIVADO) -source system_load.tcl
