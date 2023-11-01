# metagenomics_ex
- using single end reads (as a simple example) for AMR genes
- data from https://www.nature.com/articles/ncomms9945, 
subset of data = antibiotic influence on gut microbiome of mice (https://zenodo.org/records/1040361)

Streptomycin given to wildtype mouse subjects to see metagenomic changes in bacterial community using partial 16S shotgun sequencing

### Step 1: Quality Control
- Fastqc
  
  fastqc 16S_*.fastq 
- Cutadapt (ie)
  
cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCAC -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -o output_16S*.fastq -u 10 -U 10 -q 20 --minimum-length 36 input_R1.fastq input_R2.fastq

- Fastqc (again) to check to ensure improved quality

### Step 2: Taxonomic profiling with Kraken2
https://benlangmead.github.io/aws-indexes/k2

Here, I use the Standard-8 version for simplicity


### Step 3: Dereplication
VSEARCH
###

