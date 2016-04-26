#!/usr/bin/env Rscript

suppressPackageStartupMessages (library(ggplot2))
suppressPackageStartupMessages (library(reshape2))
## suppressPackageStartupMessages (library(doBy))

source ("averageFlow-style.R")

entropyRouting.data = read.table ('averageDropRate.txt', header = TRUE, sep = "\t")
entropyRouting.data$Type = factor (entropyRouting.data$Type)

g <- ggplot (data=entropyRouting.data, aes(x=PairSize, y=AverageDrop, group =Type , shape = Type,color = Type,linetype = Type)) +

  geom_point(size=2.5)+
  geom_line(size=0.5)+
  scale_color_manual (values = c('blue2', 'red4', 'darkgreen','black')) +

#   scale_x_continuous(limits=c(0, 50),breaks=seq(0,50,10))+
  xlab ("Number of node pairs") +
  ylab ("Packet drop rate [Kilobytes/s]") +

  theme_custom () + theme(legend.position=c(0.22,0.8)) + theme(legend.key.height=unit(0.9,'cm'))


cat ("Writing graph to [6DropData.pdf]\n")
pdf (file = "6DropData.pdf",width=9,height=6)
g
x = dev.off ();