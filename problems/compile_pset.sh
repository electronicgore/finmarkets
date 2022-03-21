#!/bin/sh
# ### Usage: 
# $ ./compile_pset.sh texfilename [outfilename]
# 
# ### Description:
# Take a tex file for a problem set and compile:
# - problem set without solutions
# - problem set with solutions
# Note: receives input file name without an extension!
# Optionally accepts output file name (without an extension),
# if none is specified then output name same as input name.

OUT=${2:-$1}

cp $1.tex $1.tex.bak

sed -i 's/%\\solutionstrue/\\solutionstrue/' $1.tex
pdflatex -synctex=1 -interaction=nonstopmode $1.tex
pdflatex -synctex=1 -interaction=nonstopmode $1.tex
#pdfjam $1.pdf --nup '1x2' --frame 'true' --outfile ${OUT}_handout.pdf
cp $1.pdf ${OUT}_solutions.pdf
echo 'Solutions compiled.'


sed -i 's/\\solutionstrue/%\\solutionstrue/' $1.tex
pdflatex -synctex=1 -interaction=nonstopmode $1.tex
pdflatex -synctex=1 -interaction=nonstopmode $1.tex
cp $1.pdf ${OUT}_p.pdf
echo 'Pset compiled.'

sed -i 's/%\\solutionstrue/\\solutionstrue/' $1.tex

echo 'All done.'




