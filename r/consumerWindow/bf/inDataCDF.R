#!/usr/bin/env Rscript

suppressPackageStartupMessages (library(ggplot2))
suppressPackageStartupMessages (library(reshape2))
## suppressPackageStartupMessages (library(doBy))

source ("averageFlow-style.R")

inData = read.table ('averageInData.txt', header = TRUE, sep = "\t")
inData$Type = factor (inData$Type)

g <- ggplot (data=inData, aes(x=Time, group =Type, color = Type)) + stat_ecdf() + scale_color_manual (values = c('blue2', 'red', 'darkgreen')) +
  xlab ("Delay [ms]") + theme_custom () + theme(legend.position=c(0.8,0.2)) + theme(legend.key.height=unit(0.9,'cm'))
#  plot(ecdf(inData), do.p=FALSE, main = "Empirical CDF of X", xlab = "X", ylab = "CDF")

cat ("Writing graph to [inDataCDF.pdf]\n")
pdf (file = "inDataCDF.pdf",width=9,height=6)
g
x = dev.off ();