#!/usr/bin/env Rscript

suppressPackageStartupMessages (library(ggplot2))
suppressPackageStartupMessages (library(reshape2))
## suppressPackageStartupMessages (library(doBy))

source ("inData-style.R")



MDPF2.data = read.table ('/home/rudy/ns-dev/experimentResult/results/congestion-zoom-ndn-MDPF3-15-rate-trace.log', header = TRUE, sep = "\t")
MDPF2.data$Node = factor (MDPF2.data$Node)
MDPF2.data$Type = factor (MDPF2.data$Type)
MDPF2.data = subset (MDPF2.data, Type == "InData" & Node =="client" & FaceId=="0")[,c(1,2,3,7)]


MDPF3.data = read.table ('/home/rudy/ns-dev/experimentResult/results/congestion-zoom-ndn-bestRouting-15-rate-trace.log', header = TRUE, sep = "\t")
MDPF3.data$Node = factor (MDPF3.data$Node)
MDPF3.data$Type = factor (MDPF3.data$Type)
MDPF3.data = subset (MDPF3.data, Type == "InData" & Node =="client" & FaceId=="0")[,c(1,2,3,7)]


ndn_bestRouting.data = read.table ('/home/rudy/ns-dev/experimentResult/results/congestion-zoom-ndn-MDWRR3-15-rate-trace.log', header = TRUE, sep = "\t")
ndn_bestRouting.data$Node = factor (ndn_bestRouting.data$Node)
ndn_bestRouting.data$Type = factor (ndn_bestRouting.data$Type)
ndn_bestRouting.data = subset (ndn_bestRouting.data, Type == "InData" & Node =="client" & FaceId=="0")[,c(1,2,3,7)]

names (ndn_bestRouting.data) = names (MDPF2.data)


ndn_bestRouting.data$Type = "MD-WRR"
MDPF2.data$Type = "MD-PF"
MDPF3.data$Type = "BestRoute"

data = rbind (MDPF2.data,ndn_bestRouting.data,MDPF3.data)

g <- ggplot (data=data, aes(x=Time, y=Kilobytes, group =Type , shape = Type, color = Type, linetype = Type)) +
  geom_point(size=2.5)+
  geom_line(size=0.5)+
  scale_color_manual (values = c('blue2', 'red4', 'darkgreen','black')) +
  xlab ("Time [second]") +
  ylab ("Throughput [Kilobytes/s]") +
  #facet_wrap (~ Node + Interface) +
  facet_wrap (~ Node + FaceId) +
  ##scale_color_manual (values = c("red", "blue")) +
  
  
  theme_custom () + theme(legend.position=c(0.8,0.2)) + theme(legend.key.height=unit(0.9,'cm'))


cat ("Writing graph to [inData-2.pdf]\n")
pdf (file = "inData-2.pdf",width=9,height=6)
g
x = dev.off ();
