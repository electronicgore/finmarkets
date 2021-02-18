#!/bin/sh
# Take a tex file for a slide deck and compile:
# - slides
# - handout (slides compiled on a4 paper, with fewer redundant slides)
# - lecturer notes (handout with notes)
# Note: receives input file name without an extension!
# Optionally accepts output file name (without an extension),
# if none is specified then output name same as input name.

OUT=${2:-$1}

cp $1.tex $1.tex.bak

#sed -i 's/%,notes/,notes/' $1.tex

#sed -i 's/,notes/%,notes/' $1.tex
sed -i 's/%,handout/,handout/' $1.tex
pdflatex -synctex=1 -interaction=nonstopmode $1.tex
pdflatex -synctex=1 -interaction=nonstopmode $1.tex
pdfjam $1.pdf --nup '1x2' --frame 'true' --outfile ${OUT}_handout.pdf
echo 'Handout compiled.'

#sed -i 's/%,notes/,notes/' $1.tex
#pdflatex -synctex=1 -interaction=nonstopmode $1.tex
#pdfjam $1.pdf --nup '2x2' --frame 'true' --landscape --outfile $1_lecture.pdf
#echo 'Lecturer notes compiled.'

#sed -i 's/,notes/%,notes/' $1.tex
sed -i 's/,handout/%,handout/' $1.tex
pdflatex -synctex=1 -interaction=nonstopmode $1.tex
pdflatex -synctex=1 -interaction=nonstopmode $1.tex
cp $1.pdf ${OUT}_slides.pdf
echo 'Slides compiled.'

echo 'All done.'




