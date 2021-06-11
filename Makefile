# makefile for panelization experiments
# just demo example, not yet ready for production

# pip3 install kikit
# pip3 install --upgrade kikit
# pip3 show kikit
# Version: 0.7

.PHONY: all clean

BOARDS = ulx3s
DESTINATION = plot/panel

BOARDSFILES = $(addprefix $(DESTINATION)/, $(BOARDS:=.kicad_pcb))
GERBERS = $(addprefix $(DESTINATION)/, $(BOARDS:=-panel-gerber))
KIKIT = ~/.local/bin/kikit

# milling tool diameter mm
RADIUS=2

# help panelizer locate board
# this design has a single board
# so area is oversized to include everything
X_ORIGIN=83
Y_ORIGIN=54
X_SIZE=115
Y_SIZE=70

all: $(GERBERS)

$(DESTINATION)/ulx3s.kicad_pcb: ulx3s.kicad_pcb $(DESTINATION)
	$(KIKIT) panelize extractboard \
		--sourcearea $(X_ORIGIN) $(Y_ORIGIN) $(X_SIZE) $(Y_SIZE) \
		$< $@

$(DESTINATION)/ulx3s-panel.kicad_pcb: $(DESTINATION)/ulx3s.kicad_pcb
	$(KIKIT) panelize grid     \
		--space     10     \
		--gridsize  4 2    \
		--vtabs     1      \
		--tabwidth  25     \
		--vcuts            \
		--framecutV        \
		--framecutH        \
		--railsLr   1.0    \
		--railsTb   8.0    \
		--fiducials 5.0 5.0 1.0 2.0 \
		--radius $(RADIUS) \
		--tolerance 20     \
		$< $@

#		--htabs     0      \
#		--tabheight 30     \

%-gerber: %.kicad_pcb
	$(KIKIT) export gerber $< $@

$(DESTINATION):
	mkdir -p $(DESTINATION)

clean:
	rm -f *~
	rm -rf $(DESTINATION)
