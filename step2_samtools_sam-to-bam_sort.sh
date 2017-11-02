#!/bin/bash

IN_DIR = "/home/chris/project/chip/s2_aligned"

cd $IN_DIR

for sample in *sam
do
describer=$(echo ${sample} | sed 's/.sam//')
echo $sample
echo $describer

samtools view -bS ${describer}.sam > ${describer}.bam
echo $describer endSamtoolsView

samtools sort ${describer}.bam ${describer}_STsort.bam
echo $describer endSamtoolsSort

done

#if need to remove non-compressed sam files, uncomment line below
#rm *sam
