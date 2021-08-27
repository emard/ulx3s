# makefile for panelization
# just demo example, not yet ready for production

# pip3 uninstall kikit
# pip3 install git+https://github.com/yaqwsx/KiKit@master
# pip3 install --upgrade git+https://github.com/yaqwsx/KiKit@master
# pip3 show kikit
# Version: 0.99-pre1.0+35.g4fe4b78

.PHONY: all clean

BOARDS = ulx3s
DESTINATION = plot/panel

BOARDSFILES = $(addprefix $(DESTINATION)/, $(BOARDS:=.kicad_pcb))
GERBERS = $(addprefix $(DESTINATION)/, $(BOARDS:=-panel-gerber))
# stencil bug workaround (if mill lines cut stencil):
# GERBERS = $(addprefix $(DESTINATION)/, $(BOARDS:=-panel-gerber)) $(addprefix $(DESTINATION)/, $(BOARDS:=-stencil-gerber))
RAR = $(addprefix $(DESTINATION)/, $(BOARDS:=-panel-gerber.rar))
KIKIT = ~/.local/bin/kikit

# writing on the panel
KIKIT_VERSION = $(shell $(KIKIT) --version)
PANELIZATION_DATE = $(shell date +%F)
TITLE = ULX3S panelized $(PANELIZATION_DATE) with $(KIKIT_VERSION)

all: $(GERBERS) $(RAR)

# extract the board for panelization
$(DESTINATION)/ulx3s.kicad_pcb: ulx3s.kicad_pcb $(DESTINATION)
	$(KIKIT) panelize \
		--source    'tolerance: 20mm;'                    \
		$< $@

# panelization run
# fiducials voffset experimentally placed at the middle of tabs
# hwidth is 0.01mm less than board y-size 50.8-0.01 = 50.79 mm
# millradius must be 1mm, if larger, mill cut will disappear.
$(DESTINATION)/ulx3s-panel.kicad_pcb: $(DESTINATION)/ulx3s.kicad_pcb
	$(KIKIT) panelize \
		--source    'tolerance: 20mm;'                    \
		--layout    'grid; rows: 4; cols: 2; space: 9mm;' \
		--framing   'tightframe; width: 6mm; space: 2mm;' \
		--tabs      'fixed; hwidth: 50.79mm; vcount: 0;'  \
		--cuts      'vcuts;'                              \
		--post      'millradius: 1mm; copperfill: true;'  \
		--fiducials '3fid; hoffset: 15mm; voffset: 3mm; coppersize: 2mm; opening: 2.5mm;' \
		--text      'simple; text: $(TITLE); anchor: mt; voffset: 3mm; hjustify: center; vjustify: center;' \
		$< $@

# BUG workaround for stencil:
# if stencil is cut by mill lines while it shouldn't.
# To avoid stencil cuts,
# run panelization again with full tabs
# mill cuts from tabs will disappear, making clean stencil files
# calculate frame hspace/vspace to fit standard framed stencil 370x470 mm
# hspace = (370 - (2*94.98+1*9+2*6))/2 =  79.52
# vspace = (470 - (4*50.80+3*9+2*6))/2 = 113.9
$(DESTINATION)/ulx3s-stencil.kicad_pcb: $(DESTINATION)/ulx3s.kicad_pcb
	$(KIKIT) panelize \
		--source    'tolerance: 20mm;'                    \
		--layout    'grid; rows: 4; cols: 2; space: 9mm;' \
		--framing   'tightframe; width: 6mm; hspace: 79.52mm; vspace: 113.9mm;' \
		--tabs      'full;'                               \
		$< $@

%-gerber: %.kicad_pcb
	$(KIKIT) export gerber $< $@

%-gerber.rar: %-gerber
        # copy stencil bug workaround files if mill lines cut stencil
	#cp $(DESTINATION)/ulx3s-stencil-gerber/ulx3s-stencil-PasteTop.gbr    $(DESTINATION)/ulx3s-panel-gerber/ulx3s-panel-PasteTop.gbr
	#cp $(DESTINATION)/ulx3s-stencil-gerber/ulx3s-stencil-PasteBottom.gbr $(DESTINATION)/ulx3s-panel-gerber/ulx3s-panel-PasteBottom.gbr
	rar a -ep -ap$(BOARDS)-panel-gerber $@ $<

$(DESTINATION):
	mkdir -p $(DESTINATION)

view: $(DESTINATION)/ulx3s-panel.kicad_pcb
	pcbnew $<

clean:
	rm -f *~
	rm -rf $(DESTINATION)
