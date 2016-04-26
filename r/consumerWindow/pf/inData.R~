#!/usr/bin/env Rscript

suppressPackageStartupMessages (library(ggplot2))
suppressPackageStartupMessages (library(reshape2))
## suppressPackageStartupMessages (library(doBy))

source ("inData-style.R")

MDPF3.data = read.table ('/home/rudy/ns-dev/experimentResult/results/congestion-zoom-ndn-MDPF3-100-rate-trace.log', header = TRUE, sep = "\t")
MDPF3.data$Node = factor (MDPF3.data$Node)
MDPF3.data$Type = factor (MDPF3.data$Type)
MDPF3.data = subset (MDPF3.data, Type == "InData" & Node =="client" & FaceId=="0")[,c(1,2,3,7)]

BestRoute.data = read.table ('/home/rudy/ns-dev/experimentResult/results/congestion-zoom-ndn-BestRoute-100-rate-trace.log', header = TRUE, sep = "\t")
BestRoute.data$Node = factor (BestRoute.data$Node)
BestRoute.data$Type = factor (BestRoute.data$Type)
BestRoute.data = subset (BestRoute.data, Type == "InData" & Node =="client" & FaceId=="0")[,c(1,2,3,7)]

EPF2.data = read.table ('/home/rudy/ns-dev/experimentResult/results/congestion-zoom-ndn-EPF3-100-rate-trace.log', header = TRUE, sep = "\t")
EPF2.data$Node = factor (EPF2.data$Node)
EPF2.data$Type = factor (EPF2.data$Type)
EPF2.data = subset (EPF2.data, Type == "InData" & Node =="client" & FaceId=="0")[,c(1,2,3,7)]

names (BestRoute.data) = names (MDPF3.data)


BestRoute.data$Type = "BestRoute"
MDPF3.data$Type = "MDPF"
EPF2.data$Type = "EPF"

data = rbind (MDPF3.data, BestRoute.data, EPF2.data)
par(family='STKaiti')
g <- ggplot (data=data, aes(x=Time, y=Kilobytes, group =Type , shape = Type, color = Type, linetype = Type)) +
  geom_point(size=2.5)+
  geom_line(size=0.5)+
  scale_color_manual (values = c('blue2', 'red4', 'darkgreen','black')) +
  scale_x_continuous(limits=c(0, 70),breaks=seq(0,70,5))+
  xlab ("时间 [秒]") +
  ylab ("Throughput [Kilobytes/s]") +
  #facet_wrap (~ Node + Interface) +
  facet_wrap (~ Node + FaceId) +
  ##scale_color_manual (values = c("red", "blue")) +
  theme_custom () + theme(legend.position=c(0.8,0.8)) + theme(legend.key.height=unit(0.9,'cm')) + theme(text = element_text(family = 'STKaiti'))


cat ("Writing graph to [inData-pf.pdf]\n")
pdf (file = "./graphs/inData-pf.pdf",width=9,height=6)
g
x = dev.off ();
