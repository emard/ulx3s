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

RADIUS=0

all: $(GERBERS)

$(DESTINATION)/ulx3s.kicad_pcb: ulx3s.kicad_pcb $(DESTINATION)
	$(KIKIT) panelize extractboard -s 94 51 94 112 $< $@

$(DESTINATION)/ulx3s-panel.kicad_pcb: $(DESTINATION)/ulx3s.kicad_pcb
	$(KIKIT) panelize grid     \
		--space     10     \
		--gridsize  4 2    \
		--vcuts            \
		--framecutV        \
		--framecutH        \
		--railsLr   5.0    \
		--railsTb   2.0    \
		--fiducials 5.0 5.0 1.0 2.0 \
		--radius $(RADIUS) \
		$< $@

%-gerber: %.kicad_pcb
	$(KIKIT) export gerber $< $@

$(DESTINATION):
	mkdir -p $(DESTINATION)

clean:
	rm -f *~
	rm -rf $(DESTINATION)
