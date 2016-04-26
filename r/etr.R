#!/usr/bin/env Rscript

suppressPackageStartupMessages (library(ggplot2))
suppressPackageStartupMessages (library(reshape2))
## suppressPackageStartupMessages (library(doBy))

source ("averageFlow-style.R")

entropyRouting.data = read.table ('../3averageETR.txt', header = TRUE, sep = "\t")
entropyRouting.data$Type = factor (entropyRouting.data$Type)

g <- ggplot (data=entropyRouting.data, aes(x=Frequency, y=AverageETR, group =Type , shape = Type,color = Type,linetype = Type)) +

  geom_point(size=2)+
  geom_line(size=0.2)+
  scale_color_manual (values = c('blue2', 'red4', 'black','green')) +

  scale_x_continuous(limits=c(0, 5000),breaks=seq(0,5000,500))+
  xlab ("Interest Sending Frequency [Packets/second]") +
  ylab ("Effective Transmission Ratio") +

  theme_custom ()


cat ("Writing graph to [103ETRLine.pdf]\n")
pdf (file = "103ETRLine.pdf",width=9,height=6)
g
x = dev.off ();
