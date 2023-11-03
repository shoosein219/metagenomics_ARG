# metagenomics_ARG
### ** work in progress: last updated 02 Nov 2023
- using single end reads (as a simple example) for Antimicrobial resistant genes (ARG)
- data from https://www.nature.com/articles/ncomms9945, 
subset of data = antibiotic influence on gut microbiome of mice (https://zenodo.org/records/1040361)

Description of dataset:
Streptomycin given to wildtype mouse subjects to see metagenomic changes in bacterial community using partial 16S shotgun sequencing

### Step 1: Quality Control
- Fastqc
  ```bash
  fastqc 16S_*.fastq
  ```
- Cutadapt (ie)
```bash  
cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCAC -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -o output_16S*.fastq -u 10 -U 10 -q 20 --minimum-length 36 input_R1.fastq input_R2.fastq
```
- Fastqc (again) to check to ensure improved quality

### Step 2: Taxonomic profiling with Kraken2

#### Note installation tips for Kraken2 using MacOS
```bash
./install_kraken2.sh installed_k2   
```

You may run into errors that mention gcc, clang,  or -fopenmp. 
To resolve this you have to change kraken2/src/Makefile's first line CXX=g++ to the version of g++ that you have (ie. CXX=g++-13), which can be found at usr/local/bin.

## altering path by creating symb link

Example:
```bash
ln -s /Users/ShabanaH/Desktop/github_repositories/03_metagenomic_ARG/kraken/kraken2/installed_k2/kraken2 /usr/local/bin/kraken2
```
#### using pre-compiled dbs found at:
https://benlangmead.github.io/aws-indexes/k2

Here, I use an old version of minikraken2 for simplicity. But, ideally for ARG, I would create a custom Kraken 2 database, integrating ARG annotations from databases like MegaRes or CARD (Comprehensive Antibiotic Resistance Database) for a more bioinformatically efficient pipeline, if taxonomic profiling is not a major concern. 


### Step 3: Antimicrobial Resistance Gene Identification with MegaRes
https://www.meglab.org/megares/download/ - zip file from v3.0.0 used

### Step 4:Metagenomic Assembly and Binning with MEGAHIT and MAGpy

### Step 5: Taxonomic Profiling of MAGs with Kraken2 Database

### Step 6: Data Analysis and Viz

