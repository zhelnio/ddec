
PWD = $(shell pwd)
PROJECT_NAME = system

CABLE_NAME ?= "USB-Blaster"

all: build

create:
	@true

open:
	quartus $(PROJECT_NAME).qpf &

build:
	quartus_sh --flow compile $(PROJECT_NAME)

load:
	quartus_pgm -c $(CABLE_NAME) -m JTAG -o "p;$(PROJECT_NAME).sof"
