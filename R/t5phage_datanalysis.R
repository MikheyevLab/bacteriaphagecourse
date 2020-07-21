
#title: "t5phage_ecoli_bioinformatics"
#author: "Jigyasa_Arora and Sasha Mikheyev"
#date: "7/20/2020"
#output: html_document




#install and load the R packages-

#NOTE: If you cannot install softwares viaBiocManaager, try this option #https://community.rstudio.com/t/install-packages-unable-to-access-index-for-repository-try-disabling-secure-download-method-for-http/16578


library(BiocManager)
library(Rbowtie2)
library(Rsamtools)
library(dplyr)
library(VariantTools)
library(devtools)
library(vcfR)
library(ape)



##Step1: Visualize the read quality via fastQC <optional>
  #Download link-https://www.bioinformatics.babraham.ac.uk/projects/download.html <available for windows and Mac users>
  #Check the output file-"mutant1_OIST-2015-03-28_fastqc.html"

##Step2: Generate an index for the reference genome- We will be using "gi|254160123|ref|NC_012967.1| Escherichia coli B str. REL606" as the reference.


td<-"../working_data"
refs <- dir("../working_data", "sequence.fasta",full.names =TRUE)[1]
(cmdout<-bowtie2_build(references = refs,bt2Index=file.path(td, "sequence"), "--threads 4 --quiet",overwrite=TRUE))



#Step3: Map the mutant E.coli reads to the reference genome. This generates a sam file.
#ref-https://www.bioconductor.org/packages/devel/bioc/vignettes/Rbowtie2/inst/doc/Rbowtie2-Introduction.html

#run a systems command to unzip the fastq file-
system("tar -zxvf ../working_data/mutant1_OIST-2015-03-28.fq.tar.gz")

#generate the sam file-
reads_1 <- dir("../working_data", "mutant1_OIST-2015-03-28.fq",full.names =TRUE)
cmdout2<-bowtie2(bt2Index = file.path(td, "sequence"),samOutput = file.path(td, "mutant1.sam"),seq1 = reads_1,overwrite = TRUE)

head(readLines(file.path(td, "mutant1.sam"))) #examine how the sam file looks like.



#Step4:Create a Bam file from Sam file.

sam_1 <- dir("../working_data", "mutant1.sam",full.names =TRUE)
asBam(sam_1, destination=sub("\\.sam(\\.gz)?", "", sam_1),overwrite=TRUE) #.bam extension is automatically added to the output.


##Question: Why is Step4 important? Hint: compare the size of Sam file with Bam file

#Step5:Sort the Bam file according to reference genome's chromosomal position.

bam_1<-dir("../working_data", "mutant1.bam",full.names =TRUE)[1]
#sorted_bam_1<-dir("../working_data", "sorted_mutant1.bam",full.names =TRUE)

sorted <- sortBam(bam_1, destination=sub("mutant1.bam","sorted_mutant1",bam_1),overwrite=TRUE)

#index the sorted bam file-
indexBam(sorted)



#Step6:Variant Calling- generated using "Freebayes" software.

#make sure to add your system path to laod freebayes
system("freebayes -f ../working_data/sequence.fasta ../working_data/sorted_mutant1.bam -p 1 -v ../working_data/sorted_mutant1.vcf")
#-p 1 is ploidy set to haploid species


#Step6.5:Visualize the variant calling file (.vcf file) and filter it.
#https://knausb.github.io/vcfR_documentation/filtering_data.html

#visualize the VCF file-
vcf_file <- dir("../working_data", "sorted_mutant1.vcf",full.names = TRUE)[2]
dna_file <- dir("../working_data/", "sequence.fasta", full.names = TRUE)[1]
gff_file <- dir("../raw_data/", "GCF_000005845.2_ASM584v2_genomic.gff", full.names = TRUE)

vcf <- read.vcfR(vcf_file, verbose = FALSE)
dna <- ape::read.dna(dna_file, format = "fasta")
gff <- read.table(gff_file, sep="\t", quote="")

chrom <- create.chromR(name="Supercontig", vcf=vcf, seq=dna, ann=gff, verbose=FALSE)
chrom <- proc.chromR(chrom, verbose = TRUE)

head(chrom)
plot(chrom) #plots the quality scores
chromoqc(chrom, dp.alpha = 22) #plots the mapped variants on the reference genome.

#filter the variants-
chrom <- masker(chrom, min_QUAL=10)
chrom <- proc.chromR(chrom, verbose = FALSE)
chromoqc(chrom, dp.alpha = 22) #plots the mapped variants on the reference genome.

write.vcf(chrom, file="../working_data/filtered_sorted_mutant1.vcf.gz",mask = TRUE)
system("gunzip ../working_data/filtered_sorted_mutant1.vcf.gz")



#Step7- Use IGV to visualize the variants against the reference genome-https://igv.org/app/ OR have a look at the saved session "igv_session_mutant1.xml".
#Load on Firefox web-browser

#1.click on the IGV link above
#2.load the "sequence.fasta" + "sequence.fasta.fai" file through "Genomes" tab.
#3.load the "sorted_mutant1.bam" +"sorted_mutant1.bam.bai" through "File" tab.
#4.load the "sorted_mutant1.vcf" file through "File" tab.
#5.type "4160123|ref|NC_012967.1|:171,050-171,850" in the search column to examine the FhuA gene in E.coli


###Question: Repeat all the above steps with the remaining E.coli mutant and wild-type reads. 
#Q1/Are the mutation profile similar for all the mutants?
#Q2/What is the difference between the mutants and wild-type sample? Is the wild-type more similar to the reference genome?
