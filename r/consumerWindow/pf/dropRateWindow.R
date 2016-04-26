#!/usr/bin/env Rscript

suppressPackageStartupMessages (library(ggplot2))
suppressPackageStartupMessages (library(reshape2))
## suppressPackageStartupMessages (library(doBy))

source ("averageFlow-style.R")

entropyRouting.data = read.table ('averageDropRatePF.txt', header = TRUE, sep = "\t")
entropyRouting.data$Type = factor (entropyRouting.data$Type)

g <- ggplot (data=entropyRouting.data, aes(x=Time, y=AverageDrop, group =Type , shape = Type,color = Type,linetype = Type)) +

  geom_point(size=2.5)+
  geom_line(size=0.5)+
  scale_color_manual (values = c('blue2', 'red4', 'darkgreen','black')) +
  scale_y_continuous(limits=c(0, 400),breaks=seq(0,400,50))+
  scale_x_continuous(limits=c(0, 70),breaks=seq(0,70,10))+
  xlab ("时间 [秒]") +
  ylab ("丢包率 [Kilobytes/s]") +

  theme_custom () + theme(legend.position=c(0.8,0.8)) + theme(legend.key.height=unit(0.9,'cm'))


cat ("Writing graph to [DropData-pf.pdf]\n")
pdf (file = "./graphs/DropData-pf.pdf",width=9,height=6)
g
x = dev.off ();