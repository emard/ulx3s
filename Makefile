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
# GERBERS = $(addprefix $(DESTINATION)/, $(BOARDS:=-panel-gerber))
# stencil bug workaround:
GERBERS = $(addprefix $(DESTINATION)/, $(BOARDS:=-panel-gerber)) $(addprefix $(DESTINATION)/, $(BOARDS:=-stencil-gerber))
RAR = $(addprefix $(DESTINATION)/, $(BOARDS:=-panel-gerber.rar))
KIKIT = ~/.local/bin/kikit

# writing on the panel
KIKIT_VERSION = $(shell $(KIKIT) --version)
TITLE = ULX3S panelized by $(KIKIT_VERSION)

all: $(GERBERS) $(RAR)

# extract the board for panelization
$(DESTINATION)/ulx3s.kicad_pcb: ulx3s.kicad_pcb $(DESTINATION)
	$(KIKIT) panelize \
		$< $@

# panelization run
# fiducials voffset experimentally placed at the middle of tabs
# BUG: mill lines also cut stencil while they shouldn't
$(DESTINATION)/ulx3s-panel.kicad_pcb: $(DESTINATION)/ulx3s.kicad_pcb
	$(KIKIT) panelize \
		--layout    'grid; rows: 4; cols: 2; space: 9mm;' \
		--framing   'tightframe; width: 5mm; space: 3mm;' \
		--tabs      'fixed; hwidth: 50.79mm; vcount: 0;'  \
		--cuts      'vcuts;'                              \
		--post      'millradius: 1mm; copperfill: true;'  \
		--fiducials '3fid; hoffset: 10mm; voffset: 63.34mm; coppersize: 2mm; opening: 2.5mm;' \
		--text      'simple; text: $(TITLE); anchor: mt; voffset: 3mm; hjustify: center; vjustify: center;' \
		$< $@

# BUG workaround for stencil:
# stencil would be cut by mill lines while it shouldn't.
# To avoid stencil cuts,
# run panelization again with full tabs
# mill cuts from tabs will disappear, making clean stencil files
# calculate frame edges width/height to generate standard framed stencil 370x470 mm
# width  = 370 - ( 2*94.98+1*9+2*3 ) = 165.04
# height = 470 - ( 4*50.80+3*9+2*3 ) = 233.80
# but currently I don't know how to set different width/height at the frame
$(DESTINATION)/ulx3s-stencil.kicad_pcb: $(DESTINATION)/ulx3s.kicad_pcb
	$(KIKIT) panelize \
		--layout    'grid; rows: 4; cols: 2; space: 9mm;' \
		--framing   'tightframe; width: 5mm; space: 3mm;' \
		--tabs      'full;'                               \
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
