# metagenomics_ARG

### **A current project and work in progress: last updated 12 Nov 2023**

- **Data Type:** using single end metagenomic data (as a simple example) to understand Antimicrobial Resistant Genes (ARGs, also known as AMR genes) in gut microbiome

- **Description of dataset:**
Streptomycin (treatment) given to wildtype mouse subjects to see metagenomic changes in bacterial community using partial 16S shotgun sequencing

    - The data used in this example is from Barroso-Batista et al. 2015 published in *Nature Communications*  (https://www.nature.com/articles/ncomms9945). I use a subset of the data, based on my research questions (based on antimicrobial resistant genes(ARGs)) and select only the control and antibiotic-influenced treatment to see the effect of ARGs using libraries prepped for metagenomics that give insight into a study on the gut microbiome of mice with and without Streptomycin treatments (https://zenodo.org/records/1040361).
*Ultimately scraping the surface of HGT vs haploid-centric genetic recombination approaches, where the latter would be better parsed using genome-resolved transcriptomic data. Bioinformatically, conserved bacterial genes that mutate to become AMR genes are analysed using different AMR gene databases (ie. dbs exclusively for AMR gene point-mutations).*
  
- **Description of Methods**:In surveying ARGs, there are two general bioinformatic methods that can be used once sequencing is performed: (1) read-based metagenomics and mapping against ARG databases (2) genome-resolved metagenomics and comparison to functional annotation databases. In this example, I will use the first method mentioned.
  
- **Statement about choosing an AMR gene db**: Depending on the features and functionality that you are looking     to understand based on your research questions, it is important to choose an AMR gene db for the purpose of your designed study. For more information, there is a very nice review by Xavier et al. that discusses the advantages and disadvantages of each AMR gene db and the features and functionalities behind choosing one versus the other: Xavier et al., 2016. Consolidating and exploring antibiotic resistance gene data resources. J Clin Microbiol, 54, 851–859. 
https://doi.org/10.1128/JCM.02717-15


### Example Study:
     
### Research Q: 
Do the metagenomic profiles of the mouse gut microbiome show differences in the expression of Antimicrobial Resistant Genes (ARGs) in response to Streptomycin exposure? 


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

#### (NOTE) Installation tips for Kraken2 using MacOS
You may run into errors that mention gcc, clang,  or -fopenmp. 
To resolve this you have to change kraken2/src/Makefile's first line CXX=g++ to the version of g++ that you have (ie. CXX=g++-13), which can be found at usr/local/bin.
See my shell script in this repo for example. *will clean this up with a link to script in the future*


```bash
# run installation script
./install_kraken2.sh installed_k2
# alter executable path by creating symb link (as suggested after installation)
ln -s /Users/ShabanaH/Desktop/github_repositories/03_metagenomic_ARG/kraken/kraken2/installed_k2/kraken2 /usr/local/bin/kraken2 
```


#### (NOTE) Using pre-compiled databases(dbs):
https://benlangmead.github.io/aws-indexes/k2

- Here, I use an old version of minikraken2 for simplicity (for a low-storage space solution if running locally).
  
- If I wanted to compile my own db because I was working on a server or HPC, I would do the following to compile a **standard** kraken db:

```bash
# Build kraken database 
kraken2-build --standard --db my_new_database
```

- Ideally for ARG, I would create a custom Kraken 2 database, integrating ARG annotations from databases like MegaRes or CARD (Comprehensive Antibiotic Resistance Database) for a more bioinformatically efficient pipeline, if taxonomic profiling is not a major concern. I hope to have example code for this in the future if I gain access to an HPC-cluster.

#### Classification
You would want to run the following command on a loop. 
```bash
kraken2 --db $DBNAME seqs.fa
```
##### to create/edit shell script
To be sure that my variables are consistantly defined, I wrote a shell script with a loop (see run_classification_on_fastq.sh in this repo) *will clean this up with a link to script in the future*

Here are some basic commands for creating and running the script to loop through all samples:
```bash
# to create script
touch run_classification_on_fastq.sh
# to edit script
nano run_classification_on_fastq.sh
# edit permissions
chmod +x run_classification_on_fastq.sh
# to execute script
./run_classification_on_fastq.sh
```

### Step 3: Antimicrobial Resistance Gene Identification with MegaRes
https://www.meglab.org/megares/download/ - zip file from v3.0.0 used

~~### Step 4:Metagenomic Assembly and Binning with MEGAHIT and MAGpy~~
**note** assembly and binning mostly used for metagenomic analyses aimed to discover new taxa and is more qualitatively rich as a bioinformatic analysis than quantitatively

### Step 4: Taxonomic Profiling of MAGs with Kraken2 Database

### Step 5: Data Analysis and Viz

