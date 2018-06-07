#!/bin/sh

# fix for stray "%" in gerbers
# G04 Created by KiCad (PCBNEW 5.0.0-rc2+dfsg1-2) date Wed Jun  6 21:24:22 2018*

for file in plot/*.g[btm]?
do
  sed -i -f tools/gerbfix5.sed $file
done
