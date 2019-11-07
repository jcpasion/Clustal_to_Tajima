#!/usr/bin/python

#Program used to split a Clustal file containing multiple loci alignments into separate files. Use header_cut.sh afterwards to delete headers from each file and obtain correct CLUSTAL format.

#set up argparse
import sys
import argparse
import re

p = argparse.ArgumentParser()

p.add_argument('--file', '-f', required = True)

args = p.parse_args()

in_file= args.file

#initialize library and open the file

fh = open ( in_file, "r")
fho = "foo"

#extract the goods

current_gene="foo"

for line in fh:
    if line.startswith("B"):
        line = line.strip("\n")
        if line != current_gene:
            current_gene = line
            fho = open(current_gene + ".aln", "w")
    elif line.startswith("-"):
        continue           
    else:    
        fho.write(line)
