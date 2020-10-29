#!/usr/bin/env bash
set -euo pipefail

FILES=/home/koji/UQ/MATH2401/notebook/img/tikz/src/*
mkdir temp
cd temp
for f in $FILES
do
    pdflatex $f
    mv *.pdf ../pdf/
done

cd ../
rm -rf ./temp
PDF=/home/koji/UQ/MATH2401/notebook/img/tikz/pdf/*
for f in $PDF
do
    # Get file prefix
    pdf2svg $f $(basename $f .pdf).svg
done
