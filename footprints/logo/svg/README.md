# Logos

Use [SVG2MOD](https://github.com/mtl/svg2mod) to convert from SVG to kicad
footprint.

In short before conversion srawing layer in the SVG file has to be
renamed usually "Layer 1" to "Cu" or "SilkS" (case insensitive). Renaming can be
done from SVG editor like "Inkscape" but in most case, "sed" will work too.

At convertsion usually some floating point scale factor is needed to make
object of desired size e.g "-f 1.5"

It can help if file is opened and saved from inkscape.
