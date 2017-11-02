#!/bin/bash

IN_DIR = "/home/chris/project/chip/s4_signal_tracks"

cd $IN_DIR


#remove any regions with fold enrichment value of 0 to decrease file size
for sample in *bdg
do
describer=$(echo ${sample} | sed 's/.bdg//')
echo $sample
echo $describer

awk '$4 > 0' $sample > ${describer}NoZero.bdg
done


#BedOps sort BedGraphs by chromosome number and location as required by BedClip program

for sample in *NoZero.bdg
do
describer=$(echo ${sample} | sed 's/.bdg//')
echo $sample
echo $describer

sort-bed $sample > ${describer}BOsort.bdg
done


#remove spurius genomic coordiantes intruduced by macs

for sample in *BOsort.bdg
do
describer=$(echo ${sample} | sed 's/.bdg//')
echo $sample
echo $describer

bedClip $sample PapAnu2_chromInfo.txt ${describer}BedClip.bdg
done


#file is now OK to upload to UCSC genome browser!

#if you have a public facing web portal (i.e. website, Dropbox, Google Drive),
#best to convert BedGraph to BigWig format for easier uploading
#then call their public url from UCSC

for sample in *BedClip.bdg
do
describer=$(echo ${sample} | sed 's/.bdg//')
echo $sample
echo $describer

bedGraphToBigWig $sample PapAnu2_chromInfo.txt ${describer}.bw
done
