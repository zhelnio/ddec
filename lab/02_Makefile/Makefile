

first:
	echo "This is a first target"

second:
	echo "This is a second target"

third: first second
	echo "This is a third target"
	echo "It depends on first and second"

fourth: \
	first \
	second

fifth:
	$(info This is a way to print some message from Makefile)
	@true

SIXTH_OPT = Just_some_program_option

sixth:
	echo $(SIXTH_OPT)

SEVENTH_OPT  = An options can be
SEVENTH_OPT += concatinated
SEVENTH_ARG  = end mixed

seventh:
	echo $(SEVENTH_OPT) $(SEVENTH_ARG)

EIGHTH_OPT ?= default_arg

eighth:
	echo $(EIGHTH_OPT)

eighth_and_half: EIGHTH_OPT = some_other_arg
eighth_and_half: eighth

NINTH_OPT = de10_lite de0_cv

$(NINTH_OPT):
	echo $@

TENTH_OPT = $(wildcard test_*.v)
tenth:
ifneq (,$(wildcard test_*.v))
	echo "Verilog files found:"
endif
	echo $(TENTH_OPT)
