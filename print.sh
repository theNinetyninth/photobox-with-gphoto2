#!/bin/bash 

# https://roboloco.net/blog/photo-prints-from-the-command-line/

INFILE=$1
OUTFILE="/tmp/to_print.jpg"

echo "Converting $INFILE -> $OUTFILE, rotating and resizing as needed"
convert $INFILE -rotate '90>' -units PixelsPerInch -density 600 -background white -gravity center -resize 3000x4200 -extent 3000x4200 -colorspace cmyk $OUTFILE

echo "Printing $OUTFILE"
lpr -o resolution=600dpi -o media-type=GlossyPaper -o media=Custom.5x7in -o orientation-requested=3 -o size=one-sided -o fit-to-page -o InputSlot=Rear -o color-model=CMYK -P Canon_MG6200_series $OUTFILE

echo "Deleting $OUTFILE"
rm -f $OUTFILE