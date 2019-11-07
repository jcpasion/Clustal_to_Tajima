#!/bin/bash

#Delete header from Clustal files obtained from BIGSDb Genome Comparator and separated by gene_splitter.py.

for f in *.aln
do
  echo "Processing $f file..."
  # take action on each file. $f store current file name
  tail +2 $f > ./Genes/$f
done
