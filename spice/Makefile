all: powersection.plot

#SPICE=spice3
#SCOPE=rlwrap nutmeg

SPICE=ngspice
SCOPE=rlwrap ngnutmeg

OBJS=switch.o
bin:	switch.m

%.raw: %.spice
	$(SPICE) < $< -r $@

%.plot: %.raw
	$(SCOPE) $<

clean:
	rm -f *.raw *~ DEADJOE
