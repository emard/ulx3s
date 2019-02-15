#all: powersection-v17.plot
#all: powersection-v188.plot
all: powersection-v20.plot2

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

%.plot2: %.spice
	$(SPICE) < $<

clean:
	rm -f *.raw *~ DEADJOE
