#!/usr/bin/env Rscript

suppressPackageStartupMessages (library(ggplot2))
suppressPackageStartupMessages (library(reshape2))
## suppressPackageStartupMessages (library(doBy))

source ("averageFlow-style.R")

entropyRouting.data = read.table ('averageInData.txt', header = TRUE, sep = "\t")
entropyRouting.data$Type = factor (entropyRouting.data$Type)

g <- ggplot (data=entropyRouting.data, aes(x=Time, y=AverageInData, group =Type , shape = Type,color = Type,linetype = Type)) +

  geom_point(size=2.5)+
  geom_line(size=0.5)+
  scale_color_manual (values = c('blue2', 'red4', 'darkgreen','black')) +

  scale_x_continuous(limits=c(0, 70),breaks=seq(0,70,10))+
  xlab ("时间 [秒]") +
  ylab ("收到Data包的累计分布函数") +

  theme_custom () + theme(legend.position=c(0.8,0.2)) + theme(legend.key.height=unit(0.9,'cm'))


cat ("Writing graph to [accumulatedData-bf.pdf]\n")
pdf (file = "./graphs/accumulatedData-bf.pdf",width=9,height=6)
g
x = dev.off ();