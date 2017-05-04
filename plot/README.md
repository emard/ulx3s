# Submitting for production

From NewPCB open PCB, view it and menu File->Plot
Click "Plot" and click "Generate Drill File"
another window will open. Click "Drill file".
ZIP seeedstudio to a file

    zip -r /tmp/seeed.zip seeedstudio

Open [Seeedstudio PCB production](https://www.seeedstudio.com/fusion_pcb.html)
page, select 4-layer board, 
click "Add your gerber file" and upload this zip file then
click on "Gerber Viewer" to see what will be produced.
