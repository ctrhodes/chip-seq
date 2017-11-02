#!/bin/bash

IN_DIR = "/home/chris/project/chip/s3_peaks"
OUT_DIR = "/home/chris/project/chip/s4_signal_tracks"

cd $IN_DIR


#select file
treat=$(ls | grep .*treat_pileup.bdg)
input=$(ls | grep .*control_lambda.bdg)

describer=$(echo ${treat} | sed 's/_treat_pileup.bdg//')
echo $describer

echo $treat
echo $input

#if you have not done so yet, generate a BedGraph using MACS
#uncomment the last macs2 command in "step3_macs_callpeaks.sh" script (the one with the -B option)

macs2 bdgcmp -t ${treat} -c ${input} -m FE --o-prefix ${describer} --outdir $OUT_DIR 2> $OUT_DIR/${describer}_FE_macs2bdgcmp.txt

echo endMacs_${describer}_FE

