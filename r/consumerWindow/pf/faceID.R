#!/usr/bin/env Rscript

suppressPackageStartupMessages (library(ggplot2))
suppressPackageStartupMessages (library(reshape2))
## suppressPackageStartupMessages (library(doBy))

source ("averageFlow-style.R")

entropyRouting.data = read.table ('faceID.data', header = TRUE, sep = "\t")

g <- ggplot (data=entropyRouting.data, aes(x=SeqNo, y=FaceID)) +

  geom_point(size=2.5)+
  geom_line(size=0.5)+
  scale_color_manual (values = c('blue2', 'red4')) +
  scale_y_continuous(limits=c(263, 268),breaks=seq(263,268,1))+
  scale_x_continuous(limits=c(0, 50),breaks=seq(0,50,10))+
  xlab ("Sequence Number") +
  ylab ("RTT [ms]") +

  theme_custom () + theme(legend.position=c(0.8,0.2)) + theme(legend.key.height=unit(0.9,'cm'))


cat ("Writing graph to [faceID.pdf]\n")
pdf (file = "faceID.pdf",width=9,height=6)
g
x = dev.off ();