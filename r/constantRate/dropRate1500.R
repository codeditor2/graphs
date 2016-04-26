#!/usr/bin/env Rscript

suppressPackageStartupMessages (library(ggplot2))
suppressPackageStartupMessages (library(reshape2))
## suppressPackageStartupMessages (library(doBy))

source ("averageFlow-style.R")

entropyRouting.data = read.table ('averageDropRate1500-2.txt', header = TRUE, sep = "\t")
entropyRouting.data$Type = factor (entropyRouting.data$Type)

g <- ggplot (data=entropyRouting.data, aes(x=Time, y=AverageDrop, group =Type , shape = Type,color = Type,linetype = Type)) +

  geom_point(size=2.5)+
  geom_line(size=0.5)+
  scale_color_manual (values = c('blue2', 'red4', 'darkgreen','black')) +
#   scale_y_continuous(limits=c(0, 70),breaks=seq(0,70,20))+
  scale_x_continuous(limits=c(0, 50),breaks=seq(0,50,10))+
  xlab ("Time [second]") +
  ylab ("Packet drop rate [Kilobytes/s]") +

  theme_custom () + theme(legend.position=c(0.8,0.7)) + theme(legend.key.height=unit(0.9,'cm'))


cat ("Writing graph to [DropData1500-2.pdf]\n")
pdf (file = "DropData1500-2.pdf",width=9,height=6)
g
x = dev.off ();