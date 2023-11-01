# metagenomics_ex
### ** work in progress: last updated 01 Nov 2023
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

Here, I use the Standard-8 version for simplicity. But, ideally for ARG, I would create a custom Kraken 2 database, integrating ARG annotations from databases like MegaRes or CARD (Comprehensive Antibiotic Resistance Database) for a more bioinformatically efficient pipeline, if taxonomic profiling is not a major concern.


### Step 3: Antimicrobial Resistance Gene Identification with MegaRes

### Step 4:Metagenomic Assembly and Binning with MEGAHIT and MAGpy

### Step 5: Taxonomic Profiling of MAGs with Kraken2 Database

### Step 6: Data Analysis and Viz

