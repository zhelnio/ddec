
PWD = $(shell pwd)
PROJECT_PATH = $(PWD)/project
PROJECT_NAME = system

all: \
	clean \
	create \
	build

create:
	mkdir -p $(PROJECT_PATH)
	cp $(PWD)/$(PROJECT_NAME).qpf_ $(PROJECT_PATH)/$(PROJECT_NAME).qpf
	cp $(PWD)/$(PROJECT_NAME).qsf  $(PROJECT_PATH)/$(PROJECT_NAME).qsf

clean:
	rm -rf $(PROJECT_PATH)

open:
	cd $(PROJECT_PATH) && quartus $(PROJECT_NAME).qpf &

build:
	cd $(PROJECT_PATH) && quartus_sh --flow compile $(PROJECT_NAME)

load:
	cd $(PROJECT_PATH) && quartus_pgm -c USB-Blaster -m JTAG -o "p;$(PROJECT_NAME).sof"
