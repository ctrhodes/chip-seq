#!/bin/bash

IN_DIR = "/home/chris/project/chip/s2_aligned"
OUT_DIR = "/home/chris/project/chip/s3_peaks"

cd $IN_DIR

#select file, must have equal numbers of treatment and controls
treat=$(ls | grep .*BV27.*bam)
input=$(ls | grep .*BVH3.*bam)

describer=$(echo ${treat} | sed 's/.bam//')
echo $describer

echo $treat
echo $input


macs2 callpeak -t ${treat} -c ${input} -f BAM -g 2.7e9 --broad -n ${describer}_broad --outdir $OUT_DIR 2> $OUT_DIR/${describer}_broad.txt

#alternatively, if you want to generate BedGraph file for building signal track in UCSC genome browser, uncomment the command below
#Building BedGraphs takes more compute time, so fine-tune peak calling then, proceed on to building BedGraph/UCSC tracks

#macs2 callpeak -t ${treat} -c ${input} -f BAM -g 2.7e9 --broad -B --SPMR -n ${describer}_broad_bdg --outdir $OUT_DIR 2> $OUT_DIR${describer}_broad_bdg.txt


echo end_Macs_${describer}
