#!/usr/bin/env Rscript

suppressPackageStartupMessages (library(ggplot2))
suppressPackageStartupMessages (library(reshape2))
## suppressPackageStartupMessages (library(doBy))

source ("averageFlow-style.R")



# this is used to draw ndn with entropy routing
entropyRouting.data = read.table ('averageFlow.txt', header = TRUE, sep = "\t")
entropyRouting.data$Type = factor (entropyRouting.data$Type)
#entropyRouting.data$Frequency = factor (entropyRouting.data$Frequency)


## group =Type is used to group the line by Type

g <- ggplot (data=entropyRouting.data, aes(x=Frequency, y=AverageFlow, group =Type , shape = Type,color = Type,linetype = Type)) +

  geom_point(size=2.5)+
  geom_line(size=0.5)+
  scale_color_manual (values = c('blue2', 'red4', 'darkgreen')) +

  scale_x_continuous(limits=c(0, 5000),breaks=seq(0,5000,500))+
  xlab ("Interest sending frequency [Packets/second]") +
  ylab ("Average Data flow [Kilobytes/s]") +

  theme_custom () + theme(legend.position=c(0.78,0.25)) + theme(legend.key.height=unit(0.9,'cm'))


cat ("Writing graph to [averageFlow.pdf]\n")
pdf (file = "averageFlow.pdf",width=9,height=6)
g
x = dev.off ();
