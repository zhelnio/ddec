
PWD = $(shell pwd)
PROJECT_NAME = system

all: build

open:
	quartus $(PROJECT_NAME).qpf &

build:
	quartus_sh --flow compile $(PROJECT_NAME)

load:
	quartus_pgm -c USB-Blaster -m JTAG -o "p;$(PROJECT_NAME).sof"
