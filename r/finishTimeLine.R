#!/usr/bin/env Rscript

suppressPackageStartupMessages (library(ggplot2))
suppressPackageStartupMessages (library(reshape2))
## suppressPackageStartupMessages (library(doBy))

source ("averageFlow-style.R")

entropyRouting.data = read.table ('../finishTime.txt', header = TRUE, sep = "\t")
entropyRouting.data$Type = factor (entropyRouting.data$Type)

g <- ggplot (data=entropyRouting.data, aes(x=Size, y=Time, group =Type , shape = Type,color = Type,linetype = Type)) +

  geom_point(size=2)+
  geom_line(size=0.2)+
  scale_color_manual (values = c('blue2', 'red4', 'darkgreen','black')) +

 # scale_x_continuous(limits=c(0, 5000),breaks=seq(0,5000,500))+
  xlab ("Size of Content [Megabytes]") +
  ylab ("Finishing Time [second]") +

  theme_custom ()


cat ("Writing graph to [FinishTimeLine.pdf]\n")
pdf (file = "FinishTimeLine.pdf",width=9,height=6)
g+theme(legend.position=c(0.2,0.8))
g
x = dev.off ();
