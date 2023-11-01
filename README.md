# metagenomics_ex
using data from https://www.nature.com/articles/ncomms9945, 
subset of data = antibiotic influence on gut microbiome of mice (https://zenodo.org/records/1040361)

Streptomycin given to wildtype mouse subjects to see metagenomic changes in bacterial community using partial 16S shotgun sequencing

### Step 1: Quality Control
-Fastqc and cutadapt
fastqc 16S_*.fastq 


### Step 2: Error Correction and Read Merging via denovo-assembly
SPAdes/**shovill**
### Step 3: Dereplication
VSEARCH
###

