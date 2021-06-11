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
		--radius    4      \
		--vcuts            \
		--railsLr   1.0    \
		--railsTb   8.0    \
		--tolerance 20     \
		--fiducials 5.0 5.0 1.0 2.0 \
		$< $@

#		--framecutV        \
#		--framecutH        \
#		--htabs     1      \
#		--tabheight 30     \
# kikit panelize grid --gridsize 5 4 --hspace 8 --vspace 0 --vcuts --htabs 0 --vtabs 0 --tabsfrom Eco1.User 6 --tabsfrom Eco2.User 3 --radius 1 --railsTb 6 --copperfill ./temp.kicad_pcb ./temp_panel_CLI.kicad_pcb

%-gerber: %.kicad_pcb
	$(KIKIT) export gerber $< $@

$(DESTINATION):
	mkdir -p $(DESTINATION)

clean:
	rm -f *~
	rm -rf $(DESTINATION)
