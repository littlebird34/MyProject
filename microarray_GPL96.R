#   Differential expression analysis with limma

### To load a library in R you will need to first install it, e.g.:
source("http://bioconductor.org/biocLite.R")
biocLite("affy")
biocLite("limma")
### You can then get information about various functions in these  
### packages, e.g. > limmaUsersGuide()
library(affy)
library(limma)

# If you'd like to replicate the example in Pevsner p 505-510 with the dataset hw used:
#  download and unpack Down_Syndrome-GE.zip, setwd below to your own path
#  then run these 4 lines line instead of the succeeding  4 lines of code: 
setwd("/Users/LittleBird/Desktop/Down_Syndrome-GE")
head(noquote(readLines("pheno.txt")), 11)
targets <- readTargets("pheno.txt", row.names="filename")


MyBioInfData <- ReadAffy(filenames=targets$fileName)
class(MyBioInfData)  # AffyBatch
MyBioInfData  # annotation = hgu133a
colnames(MyBioInfData)
rownames(MyBioInfData)
str(MyBioInfData)

head(pData(MyBioInfData))

# rma takes an AffyBatch as input and outputs an ExpressionSet,
#  eset, containing the log-expression values
eset <- rma(MyBioInfData)
# save the data to an output file to be used by other programs, etc
# (Data will be log2 transformed and normalized)
write.exprs(eset,file="data_trisomy21.txt")

hist(MyBioInfData)
hist(exprs(eset))
boxplot(MyBioInfData)
boxplot(exprs(eset)) 

# microarray: MA-plot compares two channels of intensity measurements
# can be the red and green channels of one single chip of a two-color platform or
# can be intensity measurements of two different arrays of a single-channel platform
# y islog ratio of two variables (M is from "minus" in the log scale)
# x is mean values of the same two variables (A is from "average")

par(mfrow=c(1,2))
MAplot(MyBioInfData, which=c(2,12))
#Blue line is reference
#Red line is average


####The median and IQR values appearing on each plot relate
#### to the center and vertical spread of the M values

colors =  c(rep("sienna",11), rep("dark green", 14))
boxplot(exprs(eset), ylab="log2 intensities", col=colors)

#RNA degradation
deg <- AffyRNAdeg(MyBioInfData)
deg
names(deg)
summaryAffyRNAdeg(deg)
mean(mm(MyBioInfData) > pm(MyBioInfData))


########################################################################################
#limma analysis for differential expression
#https://www.bioconductor.org/packages/devel/bioc/vignettes/limma/inst/doc/usersguide.pdf
########################################################################################

#section 9.2 of usersguide:
#There are two different ways to form the design matrix. We will use their
# first approach: treatment-contrasts parametrization
#1. create a design matrix which includes a coefficient for the mutant vs wild type difference
#model.matrix (from the stats package) creates a design matrix:

# To run with Pevsner dataset, uncomment these 3 lines and run instead of succeeding 3 lines
Group <- factor(targets$diagnosis, levels=c("Euploid","DownSyndrome"))
design <- model.matrix(~Group) # coeficient as difference from reference level
colnames(design) <- c("Euploid","DownSyndrome")

par(mfrow=c(1,1))
design
# the first coefficient estimates the mean log-expression for Euploid samples and plays the role
#  of an intercept. The second coefficient estimates the difference between DownSyndrome and Euploid.


# Differentially expressed genes can be found by lmfit
# lmFit (from the limma package) fits a linear model to the log-transformed
# expression values for each probe in a series of arrays.
fit <- lmFit(eset, design)

# eBayes (from the limma package) uses empirical Bayes statistics to 
# determine differential expression. For usage, details, references, examples
fit <- eBayes(fit)

fit_table <- topTable(fit, coef=2, adjust="BH") 
#topTable(fit, coef="androgen-independent", adjust="BH") 
#adjusted p-val is by BH (also called fdr): Benjamini & Hochberg method

#logFC - negative = down regulation



#Volcano plot
volcanoplot(fit, coef=2, style = "p-value", highlight = 0)
# colnames(coef(fit))
# limmares <- data.frame(dm=coef(fit)[,"DownSyndrome"], p.value=fit$p.value[,"DownSyndrome"])
# with(limmares, plot(dm, -log10(p.value),cex=.8, pch=16,
                    # xlab="difference in means",
                    # xlim=c(-1,1), ylim=c(0,5)))
abline(h=2,v=c(-.2,.2), lty=2)
