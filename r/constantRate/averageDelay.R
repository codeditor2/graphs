#!/usr/bin/env Rscript

suppressPackageStartupMessages (library(ggplot2))
suppressPackageStartupMessages (library(reshape2))
## suppressPackageStartupMessages (library(doBy))

source ("averageFlow-style.R")

entropyRouting.data = read.table ('averageDelay.txt', header = TRUE, sep = "\t")
entropyRouting.data$Type = factor (entropyRouting.data$Type)

g <- ggplot (data=entropyRouting.data, aes(x=Frequency, y=AverageDelay, group =Type , shape = Type,color = Type,linetype = Type)) +

  geom_point(size=2.5)+
  geom_line(size=0.5)+
  scale_color_manual (values = c('blue2', 'red4', 'darkgreen','black')) +

  scale_x_continuous(limits=c(0, 5000),breaks=seq(0,5000,500))+
  xlab ("Interest sending frequency [Packets/second]") +
  ylab ("Average full delay [millisecond]") +

  theme_custom () + theme(legend.position=c(0.22,0.8)) + theme(legend.key.height=unit(0.9,'cm'))


cat ("Writing graph to [DelayLine.pdf]\n")
pdf (file = "DelayLine.pdf",width=9,height=6)
g
x = dev.off ();
