# bacteriaphagecourse
data and scripts for T5 phage experiment 

To launch it on binder [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/MikheyevLab/bacteriaphagecourse/master?urlpath=rstudio)
 
## When you're done with the analysis

- **download all the .vcf, .bam and .bai files** The virtual machine is not persistent and will delete them.

To visualize the outout, we will use "IGV" software. 
You can download it on your local computers using this link-https://software.broadinstitute.org/software/igv/download
Go to File->Open session->Load the "igv_session_mutant1.xml" file
You can scroll through the bacterial genome to find variants/mutations in the resistant bam file.

To create your own IGV session-
1. Open IGV software
2. Genomes->Load Genomes from File->Load the "sequence.fasta" file from /working_data/
3. File->load from file->Load the "mutant1.bam" file from /working_data/
4. File->load from file->Load the "sorted_mutant1.vcf" from /working_data/
5. File->load from file->Load the "filtered_sorted_mutant1.vcf" from /working_data/
5. File->save session->Assign a name
