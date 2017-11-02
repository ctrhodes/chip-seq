# chip-seq
workflow for bulk chip-seq

The scripts in this repository perform the main steps involved in aligning bulk ChIP-Seq files and visualizing in UCSC genome browser. The basic steps are below:

![Alt text](/ctrhodes/chip-seq/blob/master/workflows1.png?raw=true "Workflows")

The scripts assume each chip file has a control or "input" file for macs comparison to treatment groups.

Some of the commands, such as in the "macs callpeaks" script are written for broad peaks, such as those seen in H3K27me3 patterns in gene bodies. Adjust these commands as needed.

The scripts also require the following software be installed an in your path:
Bowtie aligner http://bowtie-bio.sourceforge.net/index.shtml

SAMtools http://samtools.sourceforge.net/

MACS2 peak caller https://github.com/taoliu/MACS

BEDOPS https://bedops.readthedocs.io/en/latest/

