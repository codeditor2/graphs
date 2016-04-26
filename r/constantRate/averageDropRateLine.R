#!/usr/bin/env Rscript

suppressPackageStartupMessages (library(ggplot2))
suppressPackageStartupMessages (library(reshape2))
## suppressPackageStartupMessages (library(doBy))

source ("averageDropRate-style.R")



# this is used to draw ndn with entropy routing
entropyRouting.data = read.table ('averageDropRate.txt', header = TRUE, sep = "\t")
entropyRouting.data$Type = factor (entropyRouting.data$Type)
#entropyRouting.data$Frequency = factor (entropyRouting.data$Frequency)


## group =Type is used to group the line by Type

g <- ggplot (data=entropyRouting.data, aes(x=Frequency, y=DropRate, group =Type , shape = Type,color = Type,linetype = Type)) +
  ##geom_line (size = 0.8) +
  ##geom_histogram(position = 'identity',stat="identity")+
  geom_point(size=2.5)+
  geom_line(size=0.5)+
  scale_color_manual (values = c('blue2', 'red4', 'darkgreen')) +
  ##scale_fill_manual (values = c('blue2', 'red4')) +
  ##scale_color_manual(values = rainbow(5))+
  ##scale_y_continuous(limits=c(0, 1400),breaks=seq(0,1400,200))+
  scale_x_continuous(limits=c(0, 5000),breaks=seq(0,5000,500))+
  xlab ("Interest sending frequency [Packets/second]") +
  ylab ("Average packet drop rate [Kilobytes/s]") +
  ##geom_line()+
  ##scale_y_continuous(limits=c(0, 5000))+
  ##scale_x_discrete(limits=c(1.0,4.2))+
  ##scale_y_continuous() +
  ##facet_wrap (~ Type) +
  theme_custom () + theme(legend.position=c(0.22,0.8)) + theme(legend.key.height=unit(0.9,'cm'))
  ##coord_cartesian(ylim=c(100,150))




cat ("Writing graph to [averageDropRate.pdf]\n")
pdf (file = "averageDropRate.pdf",width=9,height=6)
g
x = dev.off ();
