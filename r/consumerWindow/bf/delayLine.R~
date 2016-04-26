#!/usr/bin/env Rscript

suppressPackageStartupMessages (library(ggplot2))
suppressPackageStartupMessages (library(reshape2))
## suppressPackageStartupMessages (library(doBy))

source ("averageFlow-style.R")

entropyRouting.data = read.table ('delay.txt', header = TRUE, sep = "\t")
entropyRouting.data$Type = factor (entropyRouting.data$Type)

g <- ggplot (data=entropyRouting.data, aes(x=Delay, group =Type, color = Type)) + stat_ecdf() + scale_color_manual (values = c('blue2', 'red', 'darkgreen')) +
  xlab ("时延 [秒]") + theme_custom () + theme(legend.position=c(0.8,0.2)) + theme(legend.key.height=unit(0.9,'cm'))
#  plot(ecdf(entropyRouting.data), do.p=FALSE, main = "Empirical CDF of X", xlab = "X", ylab = "CDF")

cat ("Writing graph to [delayLine.pdf]\n")
pdf (file = "./graphs/delayLine.pdf",width=9,height=6)
g
x = dev.off ();

