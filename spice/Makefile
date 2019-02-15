#all: powersection-v17.plot
#all: powersection-v188.plot
all: powersection-v20.plot2

#SPICE=spice3
#SCOPE=rlwrap nutmeg

SPICE=ngspice
SCOPE=rlwrap ngnutmeg

OBJS=switch.o
bin:	switch.m

# run spice in batch mode, generate raw waveform file
%.raw: %.spice
	$(SPICE) < $< -r $@

# plot raw waveform file
%.plot: %.raw
	$(SCOPE) $<

# running spice interactively, plot waveform from its .CONTROL card
%.plot2: %.spice
	$(SPICE) $<

clean:
	rm -f *.raw *~ DEADJOE
