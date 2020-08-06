# Using re-sequencing to identify how *E.coli* bacteria evolve resistance to the T5 phage

You can see a walkthough for one of the mutants [here](https://mikheyevlab.github.io/bacteriaphagecourse/).

To launch the repository on Binder and carry out your own analyses click the tag [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/MikheyevLab/bacteriaphagecourse/master?urlpath=rstudio)

**For advanced users on Linux or MacOS:** You can also donwload the repository and create a conda environment using `conda env create --name bacteriaphagecourse -f environment.yml` and install the packages in `install.R`. You can then load the environment, and run `open bacteriaphagecourse.Rproj` from the command line and you'll load RStudio from the conda environment.
 
## When you're done with the analysis on Binder

- **Download all the .vcf, .bam and .bai files.** The virtual machine is not persistent and will delete them.
- You might as well download the reference and annotation files (`/ref/NC_012967.1.*`), which you will need for IGV

[Here](https://youtu.be/hhCeJD7HRdI) is a walkthough of how to load data into the IGV browser.