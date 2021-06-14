# Submitting for production (panelized by manufacturer)

If manufacturer panelizes, we should create
gerber files for a single PCB.

From pcbnew open PCB, view it and menu

    File->Plot

Click "Plot" to create gerbers and click "Generate Drill File"
another window will open. Click "Drill file" to create drill files.

Generate footprint positions

    File->Fabrication Outputs->Footprint Position (.pos) File

Generate floorplan PDF for top and bottom side

    File->Print
    [x] F.Fab  [ ] Print Mirrored
    [x] B.Fab  [x] Print Mirrored

RAR or ZIP to a file

    cd plot
    rar c  /tmp/ulx3s-pcb.rar gerbers
    zip -r /tmp/ulx3s-pcb.zip gerbers

Open [Seeedstudio PCB production](https://www.seeedstudio.com/fusion_pcb.html)
page, select:

    Size: 94x51 mm
    Layer: 4-layer board
    Min Solder Mask: 0.1 mm
    Min Hole size: 0.2 mm
    Min Tracking/Spacing: 5/5 mils
    Quality: IPC Class 3

click "Add your gerber file" and upload this rar file then
click on "Gerber Viewer" to see what will be produced.

Exporting for production:

Drill file:
[x] Excellon format
[x] inch units
[x] suppress trailing zeros
[x] PTH and NPTH in the same file

Footprint position file:
[x] ASCII format
[x] mm units

# Submitting for production (panelized by us)

If we panelize, we should create gerbers for panel
and the stencil. Gerbers should have a file describing
depanelization cuts (vertical v-cuts and horizontal mill
lines).

Install [KiKit](https://github.com/yaqwsx/KiKit) (v0.7 used here) or upgrade

    pip3 install kikit
    pip3 install --upgrade kikit

Generate gerbers (needs "KiKit" installed)

    make

View panel gerbers with gerbv:

    cd plot
    gerbv (File->Open ulx3s-panel.gvp, F5 to refresh)

View panel design with pcbnew (try View->3D Viewer):

    pcbnew plot/panel/ulx3s-panel.kicad_pcb

Compress with rar (should fit max size 10 MB)

    cd plot/panel
    rar c /tmp/ulx3s-panel-gerber.rar ulx3s-panel-gerber

Upload .rar file to [JLCPCB](http://jlcpcb.com) and select options:

    PCB Panel
    -------------------
    Layers              : 1  2 [4] 6
    Dimensions [mm]     : 224 * 264
    PCB Qty             : 5 [10] 15  20
    Different Design    : [1] 2  3  4
    Delivery Format     : Single PCB [Panel by Customer] Panel by JLCPCB
    Panel Format        : Columns: 2  Rows: 4
    PCB Thickness       : 0.8  1.0  1.2 [1.6] 2.0 mm
    Impedance           : [No] Yes
    PCB Color           : [Green] Red Yellow Blue White Black
    Surface Finish      : HASL(with lead) LeadFree HASL-RoHS [ENIG-RoHS]
    Outer Copper Weight : [1 oz] 2 oz
    Inner Copper Weight : [0.5 oz] 2 oz
    Gold Fingers        : [No] Yes
    Confirm Production file : No [Yes]
    Flying Probe Test   : [Fully Test] Not Test
    Castellated Holes   : [No] Yes
    Remove Order Number : [No] Yes  Specify Location

    PCB Remark:         : 4 vertical V-CUTS, 16 horizontal MILL LINES of 2 mm width
                          Use external edges from "EdgeCuts.gbr" layer
                          Ignore internal edges from "EdgeCuts.gbr" layer

    SMT Assembly        : No

    Stencil             : Yes (Order together with PCB)
    -------------------
    Framework           : No [Yes]
    Dimensions [mm]     : 470*370 (valid area 290*190)
                          400*300 (valid area 240*140)
                         [520*420 (valid area 340*240)]
    Customized size     : [No] Yes
    Stencil Side        : Top+Bottom (On Single Stencil)
                          Top
                          Bottom 
                         [Top&Bottom (On Separate Stencil)]
    Electropolishing    : No [Yes]
    Fiducials           : No Fiducial
                         [Etched Through]
                          Etched Half into board

    Sending options     : EuroPacket
