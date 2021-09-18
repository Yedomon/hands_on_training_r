# Hands on training with R

## Introductive message

Welcome on this hands on workshop dedicated to R. I am Yedomon. 

I am going to share some scripts regarding data analysis with R.

The datasets are [here]()

If you have any questions, feel free to reach me via mail: ``yedomon@jbnu.ac.kr`` or click [here]()


**Notice**: Please visit the hyperlink (in blue) for installation and settings.

**Pre-requisites**: 

* Install [R](https://cran.r-project.org/bin/windows/base/) and [RStudio](https://rstudio.com/products/rstudio/download/) on Windows 7, 8 or 10. A tutorial for a beginner is [here](https://medium.com/@GalarnykMichael/install-r-and-rstudio-on-windows-5f503f708027).

A tutorial for package installation in RStudio is [here](https://subscription.packtpub.com/book/big_data_and_business_intelligence/9781783980246/1/ch01lvl1sec11/installing-libraries-in-r-and-rstudio).

We will use three packages in the present hands on session. Here is how to install it via command line:

  - package agricolae : `install.packages("agricolae", depencies = TRUE)`

  - package ggplot2: `install.packages("ggplot2", depencies = TRUE)`

  - package pachwork: `install.packages("patchwork", depencies = TRUE)`

## Context

At a part of a project relative to wilt disease of sesame caused by Fusarium oxysporum f.sp. sesami, a fungal sample collection was performed in four locations in Korea (See Figure 1).

![fig1](https://github.com/Yedomon/hands_on_training_r/blob/main/img/map.jpeg)

Figure 1: Geographic positions of sample colllection sites.

Once, at laboratory, routine observation of the fungal was done(See Figure 2).

![fig2](https://github.com/Yedomon/hands_on_training_r/blob/main/img/morpho.png).

Figure 2: Symptome of sesame wilt disease (a, b and C), growth of the fungal in petri dish (d,e),  microscopic view of micro and macro conidia (f, g, h)

A genetic characterization of using ITS markers was done via PCR (See Figure 3) in order to check if the isolate belong to Fusarium genus.


![fig3](https://github.com/Yedomon/hands_on_training_r/blob/main/img/pcr.png)

Figure 3: PCR result based on genus-based marker showing visible bands for all isolate exept from outgroups.


Then with the available ITS markers available in NCBI, we infer the phylogenetic position  of the collected isolates (See Figure 4)



![fig4](https://github.com/Yedomon/hands_on_training_r/blob/main/img/tree.png) 

Figure 4: Phylogenetic tree showing a clear monophyletic branch for Fusarium oxysporum isolates. Maximum boostrap values are on each node.

Afterwards, the assessment of the pathogeneicity test of the isolates was scheduled. 

The purpose here is to screen Korean cultivar and observe how they react to the fungal isolates.



