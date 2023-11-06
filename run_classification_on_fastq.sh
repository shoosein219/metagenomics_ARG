 #!/bin/bash

      # Specify the directory path where the FASTQ files are located
      fastq_dir="../fastq"

      # Specify the Kraken 2 database directory
      db_dir="../MiniKraken2/minikraken2_v2_8GB_201904_UPDATE"

      # Specify the number of threads to use
      num_threads=9

      # Navigate to the directory containing the FASTQ files
      cd "$fastq_dir"

      # Loop through all FASTQ files in the specified directory
      for fastq_file in *.fastq; do
      # Generate an output file name based on the input file
      output_file="../MiniKraken2/classification_out_$(basename "$fastq_file" .fastq).txt"


      # Run Kraken 2 on the current FASTQ file
      kraken2 --db "$db_dir" --threads $num_threads --output "$output_file" "$fastq_file"

      #echo "Kraken 2 analysis completed for $fastq_file. Results saved to $output_file"
      done
