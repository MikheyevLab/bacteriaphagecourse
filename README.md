# bacteriaphagecourse
data and scripts for T5 phage experiment 

To launch it on binder [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/MikheyevLab/bacteriaphagecourse/master)

 
 Note-Click on the binder image to begin the exercises virtually. Please note, it takes ~35 minutes for the binder image to load. Alternatively, you can install the softwares on your local computer. Just follow the commands in environment.yml and install.R files. 

Instructions-
Day1- Introduction to ecology of bacteria-phage interactions
Day2- R analysis of E.coli resistance to T5 phage
Day3- Discussion of student results (as presentations)

Day2- To run the Day2 exercise,  run BINDER, on the top right corner open "R-studio", and open "Day2_analysis.R" in virtual R-studio. 
Each analysis is broken down into "Steps" in the R script.
Home-work- Please perform the same analysis on mutant2, mutant3, mutant4 and wild-type. The raw fastq files are in /raw_data/ folder. We will discuss the analysis on Day3.

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
