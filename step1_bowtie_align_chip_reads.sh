#!/bin/bash

IN_DIR = "/home/chris/project/chip/s1_fastq"
OUT_DIR = "/home/chris/project/chip/s2_aligned"

cd $IN_DIR

genome="hg38_NoMito"

#select file
for sample in *fastq
do
describer=$(echo ${sample} | sed 's/.fastq//')_${genome}
echo $sample
echo $describer
echo $genome

#select analysis
bowtie --mm -p 8 -S -m 1 --best --phred33-quals $genome $sample > $OUT_DIR/${describer}.sam 2> $OUT_DIR/${describer}_alignment_stats.txt
echo $describer endBowtie

done

