# Read the data in "count_matrix_sub.txt" 
# and run a DESeq2 experiment comparing the transcriptome 
# of untreated MCF-7 tumor cells to those treated with estrogen. 
# There are 7 replicates for each of the conditions (untreated, treated) 

### RUN next two lines once 
source("http://bioconductor.org/biocLite.R")
biocLite("DESeq2")
biocLite("vsn")
library("DESeq2")
library("vsn")
library("RColorBrewer")
library("gplots")

setwd("/Users/LittleBird/Desktop")
countTable <- read.table("count_matrix_sub.txt", header=TRUE, sep="\t", row.names=1)

# These substrings of column names indicate the 7 replicates for control sample: 
ControlCistrackID <- c("2012.562","2012.563","2012.564","2012.565","2012.566","2012.568","2012.569")

# These substrings of column names indicate the 7 replicates for sample treated with estrogen:
E2CistrackID <- c("2012.570","2012.571","2012.572","2012.574","2012.575","2012.576","2012.577" )

# These substrings of column names indicate the 3 different depth of reads 
#   for each of the replicates of both untreated and treated:
readDepth <- c("2.5M","10M","30M")  # bases sequenced per sample (actually down-sampled from 30M)
numRep <- 7   # 7 repetitions each of untreated, treated

# Produce  dataset for read depth
# The dataset should include 7 replicates of untreated and 7 replicates oftreated.
makeDataSet<- function ( data, controlIDs, E2IDs, readDepth){
  controlReplicates <- paste( "X", controlIDs, ".subsamp.", sep="")
  controlReplicates_readDepth <- paste(controlReplicates, readDepth, sep="")
  E2Replicates <- paste( "X", E2IDs, ".subsamp.", sep="")
  E2Replicates_readDepth <- paste(E2Replicates, readDepth, sep="")  
  dataSet <- data[, c(controlReplicates_readDepth, E2Replicates_readDepth)]
  return(dataSet)
}

listofdfs <- list()
for (i in 1:length(readDepth)) {
  dataset <- makeDataSet(countTable, ControlCistrackID, E2CistrackID, readDepth[i])
  sampleCondition<- c(rep("untreated",numRep), rep("treated",numRep) )
  sampleTable<-data.frame(sampleName=colnames(dataset), condition=sampleCondition)
  deseq2dataset <- DESeqDataSetFromMatrix(countData = dataset,
                                          colData = sampleTable,
                                          design = ~ condition)
  listofdfs[i] <- deseq2dataset
}

head(listofdfs[[1]])  #2.5M
head(listofdfs[[2]])  #10M
head(listofdfs[[3]])  #30M

for (i in 1:length(listofdfs)) {
  for (j in 1:length(readDepth)) {
    if (i == j){
      colData(listofdfs[[i]])$condition <- factor(colData(listofdfs[[i]])$condition, levels=c("untreated","treated"))
      dds<-DESeq(listofdfs[[i]])     # *** stats for differential expression done here
      res<-results(dds)  
      res<-res[order(res$padj),]
      resSig <- subset(res, res$padj < 0.05 ) # significant fold changes
      genesUp = subset(resSig, resSig$log2FoldChange >=2 )    # up-regulated genes at log2FoldChange >= 2
      genesUp <- genesUp[order(genesUp$log2FoldChange),]
      genesDown = subset(resSig, resSig$log2FoldChange <= -1.5 )  # down-regulated genes at log2FoldChange <= -1.5
      genesDown <-genesDown[order(genesDown$log2FoldChange),]
      par(mfrow= c(1,1))
      
      #pvalue is the Wald test p-value: condition treated vs untreated
      #padj is BH (Benjamini-Hochberg) adjusted p-values <- adjusted to control the false discovery rate
      hist(res$pvalue, breaks=50, col="grey")
      hist(res$padj, breaks=50, col="grey")
      
      # MA plot is application of a Bland-Altman plot for visual representation of two channel gene expression data
      #  which has been transformed onto the M (log ratios) and A (mean average) scale.
      # M vs. A plots of each pair (untreated, treated) is produced.
      plotMA(dds,ylim=c(-3,3),main = paste("DESeq2 ", readDepth[i]), alpha=.05)
      
      #transform the raw counts for clustering:
      #choose blind so that conditions does not influence the outcome, 
      # to see if conditions cluster based purely on the individual datasets, in an unbiased way.
      rld <- rlogTransformation(dds, blind=TRUE) # regularized log
      vsd <- varianceStabilizingTransformation(dds, blind=TRUE) # DESeq's variance stabilisation
      
      par(mfrow=c(1,3))
      notAllZero <- (rowSums(counts(dds))>0)
      #log2 doesn't do well for low read counts (SD is high, varies)
      meanSdPlot(log2(counts(dds,normalized=TRUE)[notAllZero,] + 1))
      #regularized log (center) and DESeq's variance stabilisation (right)
      #transformations do better across the  range of counts
      meanSdPlot(assay(rld[notAllZero,]))
      meanSdPlot(assay(vsd[notAllZero,]))
      
      par(mfrow= c(1,1))
      distsRL <- dist(t(assay(rld)))   
      mat <- as.matrix(distsRL)
      rownames(mat) <- colnames(mat) <- with(colData(dds),
                                  paste(condition,sampleName , sep=" : "))
  
  	  #visualizes distances and clusters:
  	  #From the Apr 2015 vignette
	    select <- order(rowMeans(counts(dds,normalized=TRUE)),decreasing=TRUE)[1:30]
      hmcol <- colorRampPalette(brewer.pal(9, "GnBu"))(100)
      hc <- hclust(distsRL)
      heatmap.2(mat, Rowv=as.dendrogram(hc),
          symm=TRUE, trace="none",
          col = rev(hmcol), margin=c(13, 13))
      #PCA
      colours <-c(rgb(1:3/4,0,0),rgb(0,1:3/4,0),rgb(0,0,1:3/4),rgb(1:3/4,0,1:3/4))
      plt <- plotPCA(rld, intgroup = c("sampleName","condition"))
      print (plt)
    }
  }
}
dev.off()
