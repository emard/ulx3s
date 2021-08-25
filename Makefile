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
KIKIT_VERSION = $(shell pip3 show kikit | grep Version | cut -d ":" -f 2)
TITLE = ULX3S panelized by kikit$(KIKIT_VERSION)

BOARDSFILES = $(addprefix $(DESTINATION)/, $(BOARDS:=.kicad_pcb))
# GERBERS = $(addprefix $(DESTINATION)/, $(BOARDS:=-panel-gerber))
# stencil bug workaround:
GERBERS = $(addprefix $(DESTINATION)/, $(BOARDS:=-panel-gerber)) $(addprefix $(DESTINATION)/, $(BOARDS:=-stencil-gerber))
RAR = $(addprefix $(DESTINATION)/, $(BOARDS:=-panel-gerber.rar))
KIKIT = ~/.local/bin/kikit

all: $(GERBERS) $(RAR)

# extract the board for panelization
$(DESTINATION)/ulx3s.kicad_pcb: ulx3s.kicad_pcb $(DESTINATION)
	$(KIKIT) panelize \
		$< $@

# panelization
# hwidth is board height minus 0.01 mm (50.8-0.01=50.79)
# BUG: mill lines also cut stencil while they shouldn't
$(DESTINATION)/ulx3s-panel.kicad_pcb: $(DESTINATION)/ulx3s.kicad_pcb
	$(KIKIT) panelize \
		--layout 'grid; rows: 4; cols: 2; space: 9mm;' \
		--tabs 'fixed; hwidth: 50.79mm; vcount: 0;' \
		--post 'millradius: 1mm; copperfill: true' \
		--cuts vcuts \
		--framing 'tightframe; width: 5mm; space: 3mm;' \
		--text 'simple; text: $(TITLE); anchor: mt; voffset: 3mm; hjustify: center; vjustify: center;' \
		$< $@

# BUG workaround for stencil:
# stencil would be cut by mill lines while it shouldn't.
# To avoid stencil cuts,
# run panelization again with too large millradius: 2mm
# mill cuts will disappear, making clean stencil files
$(DESTINATION)/ulx3s-stencil.kicad_pcb: $(DESTINATION)/ulx3s.kicad_pcb
	$(KIKIT) panelize \
		--layout 'grid; rows: 4; cols: 2; space: 9mm;' \
		--tabs 'fixed; hwidth: 50.79mm; vcount: 0;' \
		--post 'millradius: 2mm; copperfill: true' \
		--cuts vcuts \
		--framing 'tightframe; width: 5mm; space: 3mm;' \
		--text 'simple; text: $(TITLE); anchor: mt; voffset: 3mm; hjustify: center; vjustify: center;' \
		$< $@

%-gerber: %.kicad_pcb
	$(KIKIT) export gerber $< $@

%-gerber.rar: %-gerber
        # copy files generated for stencil bug workaround
	cp $(DESTINATION)/ulx3s-stencil-gerber/ulx3s-stencil-PasteTop.gbr    $(DESTINATION)/ulx3s-panel-gerber/ulx3s-panel-PasteTop.gbr
	cp $(DESTINATION)/ulx3s-stencil-gerber/ulx3s-stencil-PasteBottom.gbr $(DESTINATION)/ulx3s-panel-gerber/ulx3s-panel-PasteBottom.gbr
	rar a $@ $<

$(DESTINATION):
	mkdir -p $(DESTINATION)

view: $(DESTINATION)/ulx3s-panel.kicad_pcb
	pcbnew $<

clean:
	rm -f *~
	rm -rf $(DESTINATION)
