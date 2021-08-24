# makefile for panelization
# just demo example, not yet ready for production

# pip3 uninstall kikit
# pip3 install git+https://github.com/yaqwsx/KiKit@master
# pip3 show kikit
# Version: 0.99-pre1.0-33.g2e56d48

.PHONY: all clean

BOARDS = ulx3s
DESTINATION = plot/panel

BOARDSFILES = $(addprefix $(DESTINATION)/, $(BOARDS:=.kicad_pcb))
GERBERS = $(addprefix $(DESTINATION)/, $(BOARDS:=-panel-gerber))
RAR = $(addprefix $(DESTINATION)/, $(BOARDS:=-panel-gerber.rar))
KIKIT = ~/.local/bin/kikit

all: $(GERBERS) $(RAR)

# extract the board for panelization
$(DESTINATION)/ulx3s.kicad_pcb: ulx3s.kicad_pcb $(DESTINATION)
	$(KIKIT) panelize \
		$< $@

# panelization
# we would like straight mill lines but
# current workaround is experimentally determined hwidth
# which makes small "bends" at the ends of mill lines
$(DESTINATION)/ulx3s-panel.kicad_pcb: $(DESTINATION)/ulx3s.kicad_pcb
	$(KIKIT) panelize      \
		--layout 'grid; rows: 4; cols: 2; space: 9mm;' \
		--tabs 'fixed; hwidth: 50.3mm; vcount: 0;' \
		--post 'millradius: 1mm;' \
		--cuts vcuts \
		--framing 'tightframe; width: 5mm; space: 3mm;' \
		$< $@

%-gerber: %.kicad_pcb
	$(KIKIT) export gerber $< $@

%-gerber.rar: %-gerber
	rar a $@ $<

$(DESTINATION):
	mkdir -p $(DESTINATION)

view: $(DESTINATION)/ulx3s-panel.kicad_pcb
	pcbnew $<

clean:
	rm -f *~
	rm -rf $(DESTINATION)
