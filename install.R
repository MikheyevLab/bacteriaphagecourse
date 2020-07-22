install.packages("BiocManager")

BiocManager::install("Rbowtie2")
BiocManager::install("Rsamtools")
BiocManager::install("BBCAnalyzer")


install.packages("dplyr")

#source("https://bioconductor.org/biocLite.R")
#biocLite("VariantTools") #OR
BiocManager::install("VariantTools")



##If you are installing on local computer-
#devtools::install_github(repo="knausb/vcfR") 
#For Mac- make sure "checkbashisms" is installed <https://brewinstall.org/install-checkbashisms-on-mac-with-brew/>
#For Windows- make sure "Rtools" is installed <https://cran.r-project.org/bin/windows/Rtools/>
install.packages("devtools")
devtools::install_github(repo="knausb/vcfR")
#install.packages("https://cran.r-project.org/src/contrib/Archive/vcfR/vcfR_1.11.0.tar.gz", repos = NULL, type="source")
install.packages("ape")

