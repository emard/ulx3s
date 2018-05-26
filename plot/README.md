# Submitting for production

From NewPCB open PCB, view it and menu File->Plot
Click "Plot" and click "Generate Drill File"
another window will open. Click "Drill file".
ZIP seeedstudio to a file

    zip -r /tmp/ulx3s-pcb.zip seeedstudio

Open [Seeedstudio PCB production](https://www.seeedstudio.com/fusion_pcb.html)
page, select:

    Size: 94x51 mm
    Layer: 4-layer board
    Min Solder Mask: 0.1 mm
    Min Hole size: 0.2 mm
    Min Tracking/Spacing: 5/5 mils
    Quality: IPC Class 3

click "Add your gerber file" and upload this zip file then
click on "Gerber Viewer" to see what will be produced.
