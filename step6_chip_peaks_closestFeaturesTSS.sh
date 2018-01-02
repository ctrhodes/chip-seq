#!/bin/bash

IN_DIR = "/home/chris/project/chip/s3_peaks"
OUT_DIR = "/home/chris/project/chip/s6_closestTSS"
GENOME_ANNOTATION_DIR = "/genomes/annotation"

cd $IN_DIR

#if using MACS to perform peak calling:
#pre-sorting peaks in not necessary, as MACS stdout is sorted using same scheme as bedops/bedtools
#but its always nice to have genomic files sorted by chrom and position, if possible

#sort files
sort-bed chipSeq_macs_out.broadPeak > chipSeq_peaks_sorted.bed

#call closest tss
closest-features --closest chipSeq_peaks_sorted.bed $GENOME_ANNOTATION_DIR/hg38_annotation.bed > $OUT_DIR/peaks_with_closestTSS.bed

#optional remove sorted peak file
#rm chipSeq_peaks_sorted.bed

