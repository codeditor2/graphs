#!/usr/bin/env Rscript

suppressPackageStartupMessages (library(ggplot2))
suppressPackageStartupMessages (library(reshape2))
## suppressPackageStartupMessages (library(doBy))

source ("averageFlow-style.R")



# this is used to draw ndn with entropy routing
entropyRouting.data = read.table ('30packetDelay.txt', header = TRUE, sep = "\t")
entropyRouting.data$Type = factor (entropyRouting.data$Type)
#entropyRouting.data$Frequency = factor (entropyRouting.data$Frequency)


## group =Type is used to group the line by Type

g <- ggplot (data=entropyRouting.data, aes(x=SeqNo, y=FullDelay, group =Type , shape = Type,color = Type,linetype = Type)) +

 # curve(pnorm, xlim=c(0,25000), col=2)
  geom_point(size=2)+
  geom_line(size=0.2)+
  scale_color_manual (values = c('blue2', 'red4', 'black')) +

  scale_x_continuous(limits=c(700, 1500),breaks=seq(700,1500,100))+
  xlab ("Sequence Number") +
  ylab ("Packet Delay [ms]") +

  theme_custom ()





cat ("Writing graph to [30delayLine.pdf]\n")
pdf (file = "30delayLine.pdf",width=9,height=6)
g
x = dev.off ();
