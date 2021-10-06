# Hands on training with R

## Introductive message

Welcome on this hands on workshop dedicated to R. I am Yedomon. 

I am going to share some scripts regarding data analysis with R.

For reproducibility the datasets are [here](https://github.com/Yedomon/hands_on_training_r/tree/main/data). A recording of this tutorial is available on [youtube](https://youtu.be/NVNwBO7hXV4)


**Notice**: Please visit the hyperlink (in blue) for installation and settings.

**Pre-requisites**: 

* Install [R](https://cran.r-project.org/bin/windows/base/) and [RStudio](https://rstudio.com/products/rstudio/download/) on Windows 7, 8 or 10. A tutorial for a beginner is [here](https://medium.com/@GalarnykMichael/install-r-and-rstudio-on-windows-5f503f708027).

A tutorial for package installation in RStudio is [here](https://subscription.packtpub.com/book/big_data_and_business_intelligence/9781783980246/1/ch01lvl1sec11/installing-libraries-in-r-and-rstudio).

We will use three packages in the present hands on session. Here is how to install it via command line:

  - package agricolae : `install.packages("agricolae", depencies = TRUE)`

  - package ggplot2: `install.packages("ggplot2", depencies = TRUE)`

  - package pachwork: `install.packages("patchwork", depencies = TRUE)`
  - package ggsignif : `install.packages("ggsignif, dependencies = TRUE)`

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



![fig4](https://github.com/Yedomon/hands_on_training_r/blob/main/img/tree.jpeg) 

Figure 4: Phylogenetic tree showing a clear monophyletic branch for Fusarium oxysporum isolates. Maximum boostrap values are on each node.

Afterwards, the assessment of the pathogeneicity test of the isolates was scheduled. 

The purpose here is to screen Korean cultivar and observe how they react to the fungal isolates. 

Some data were recorded. Here we are going to perform an analysis of variance of each data following the tested cultivars.


Before we start, we should set our working directory


### Check your working directory

```r
getwd()

```

### Set your own working directory

```r
setwd("C:/Users/ange_/Downloads/r_tuto") 

```


## Analysis of variance and means comparison

### Package loading 

```r
library(agricolae)
library(ggplot2)
library(ggsignif)

```

### Data importation
```r
data_y = read.csv("YS3386.csv",sep = "," , h = T)
```

### Get an overview of the varaibles IDs 
```r
names(data_y)
```
### ANOVA and LSD test of means comparison for plant height

```r
model<-aov(Height~Type, data=data_y)
anova(model)
LSD.test(model, "Type", group=FALSE, p.adj= "bon",console=TRUE)
```

### ANOVA and LSD test of means comparison for stem diameter

```r
model<-aov(Diameter~Type, data=data_y)
anova(model)
LSD.test(model, "Type", group=FALSE, p.adj= "bon",console=TRUE)
```

### ANOVA and LSD test of means comparison for leaf length
```r
model<-aov(Leaf_length~Type, data=data_y)
anova(model)
LSD.test(model, "Type", group=FALSE, p.adj= "bon",console=TRUE)
```

### ANOVA and LSD test of means comparison for leaf width
```r
model<-aov(Leaf_wide~Type, data=data_y)
anova(model)
LSD.test(model, "Type", group=FALSE, p.adj= "bon",console=TRUE)
```

### ANOVA and LSD test of means comparison for Chlorophyll content

```r
model<-aov(Chlorophyll_content~Type, data=data_y)
anova(model)
LSD.test(model, "Type", group=FALSE, p.adj= "bon",console=TRUE)
```

Using the ANOVA and comparison results, we made data table in order to plot bar graphs


## Drawing plot 

### Plant height

```r

data_h = read.csv("height.csv",sep = "," , h = T)


h = ggplot(data_h, aes(x = Type, y = Mean, fill = Type)) +
  geom_bar(stat = "identity", width = 0.8, show.legend = FALSE) +
  labs(x = "Treatment", y = "Plant height (cm)")+
  geom_errorbar(aes(ymin = Mean-sd, ymax = Mean + sd), width = 0.2)+
  geom_signif(comparisons = list(c("Control", "Infected")), annotations="***", y_position = 10, tip_length = 0.03) +
  theme_bw()+
  theme(axis.text = element_text(colour = "black", face = "bold"), 
        axis.title = element_text(colour = "black", face = "bold") ) +
  ggtitle('A')+
  scale_fill_manual(values=c("#0E6251", "#FF5733"))

h
```


### Diameter

```r
data_d = read.csv("diameter.csv",sep = "," , h = T)


d = ggplot(data_d, aes(x = Type, y = Mean, fill = Type)) +
  geom_bar(stat = "identity", width = 0.8, show.legend = FALSE) +
  labs(x = "Treatment", y = "Stem diameter (mm)")+
  geom_errorbar(aes(ymin = Mean-sd, ymax = Mean + sd), width = 0.2)+
  geom_signif(comparisons = list(c("Control", "Infected")), annotations="***", y_position = 3.5, tip_length = 0.03) +
  theme_bw()+
  theme(axis.text = element_text(colour = "black", face = "bold"), 
        axis.title = element_text(colour = "black", face = "bold") ) +
  ggtitle('B')+
  scale_fill_manual(values=c("#0E6251", "#FF5733"))


d

```


### Leaf length


```r

data_ll = read.csv("leaf_length.csv",sep = "," , h = T)


ll = ggplot(data_ll, aes(x = Type, y = Mean, fill = Type)) +
  geom_bar(stat = "identity", width = 0.8, show.legend = FALSE) +
  labs(x = "Treatment", y = "Leaf length (cm)")+
  geom_errorbar(aes(ymin = Mean-sd, ymax = Mean + sd), width = 0.2)+
  geom_signif(comparisons = list(c("Control", "Infected")), annotations="***", y_position = 5.7, tip_length = 0.03) +
  theme_bw()+
  theme(axis.text = element_text(colour = "black", face = "bold"), 
        axis.title = element_text(colour = "black", face = "bold") ) +
  ggtitle('C')+
  scale_fill_manual(values=c("#0E6251", "#FF5733"))

ll
```






### Leaf width


```r

data_lw = read.csv("leaf_width.csv",sep = "," , h = T)


lw = ggplot(data_lw, aes(x = Type, y = Mean, fill = Type)) +
  geom_bar(stat = "identity", width = 0.8, show.legend = FALSE) +
  labs(x = "Treatment", y = "Leaf width (cm)")+
  geom_errorbar(aes(ymin = Mean-sd, ymax = Mean + sd), width = 0.2)+
  geom_signif(comparisons = list(c("Control", "Infected")), annotations="***", y_position = 4, tip_length = 0.03) +
  theme_bw()+
  theme(axis.text = element_text(colour = "black", face = "bold"), 
        axis.title = element_text(colour = "black", face = "bold") ) +
  ggtitle('D')+
  scale_fill_manual(values=c("#0E6251", "#FF5733"))

lw

```


### chloro_content

```r

data_cc = read.csv("chloro_content.csv",sep = "," , h = T)


cc = ggplot(data_cc, aes(x = Type, y = Mean, fill = Type)) +
  geom_bar(stat = "identity", width = 0.8, show.legend = FALSE) +
  labs(x = "Treatment", y = "Chlorophyll content")+
  geom_errorbar(aes(ymin = Mean-sd, ymax = Mean + sd), width = 0.2)+
  geom_signif(comparisons = list(c("Control", "Infected")), annotations="***", y_position = 35, tip_length = 0.03) +
  theme_bw()+
  theme(axis.text = element_text(colour = "black", face = "bold"), 
        axis.title = element_text(colour = "black", face = "bold") ) +
  ggtitle('E') +
  scale_fill_manual(values=c("#0E6251", "#FF5733"))

cc
```


### combine all graphs in one 

```r

library(patchwork)

figure = (h | d | ll) /
  (lw | cc | cc)
```
### Save a high quality figure for publication


```r
ggsave(figure, file = "bar_plot.png", limitsize = FALSE, width = 10, height = 9.5, type = "cairo-png", dpi=500)


```


The final output should be:




![img](https://github.com/Yedomon/hands_on_training_r/blob/main/img/bar_plot.png)

Have a question? Drop it [here](https://github.com/Yedomon/hands_on_training_r/issues/new/choose) or write me an e-mail via `yedomon@jbnu.ac.kr`

