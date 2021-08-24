# makefile for panelization
# just demo example, not yet ready for production

# pip3 uninstall kikit
# pip3 install git+https://github.com/yaqwsx/KiKit@master
# pip3 show kikit
# Version: 0.99-pre1.0-33.g2e56d48

.PHONY: all clean

BOARDS = ulx3s
DESTINATION = plot/panel

# writing on the panel
TITLE = ULX3S

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
# hwidth is board height minus 0.01 mm (50.8-0.01=50.79)
$(DESTINATION)/ulx3s-panel.kicad_pcb: $(DESTINATION)/ulx3s.kicad_pcb
	$(KIKIT) panelize      \
		--layout 'grid; rows: 4; cols: 2; space: 9mm;' \
		--tabs 'fixed; hwidth: 50.79mm; vcount: 0;' \
		--post 'millradius: 1mm;' \
		--cuts vcuts \
		--framing 'tightframe; width: 5mm; space: 3mm;' \
		--text 'simple; text: $(TITLE); anchor: mt; voffset: 2.5mm; hjustify: center; vjustify: center;' \
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
