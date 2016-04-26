#!/usr/bin/env Rscript

suppressPackageStartupMessages (library(ggplot2))
suppressPackageStartupMessages (library(reshape2))
## suppressPackageStartupMessages (library(doBy))

source ("face-flow-style.R")


MDPF2.data = read.table ('/home/rudy/ns-dev/experimentResult/results/congestion-zoom-ndn-MDPF3-15-rate-trace.log', header = TRUE, sep = "\t")
MDPF2.data$Node = factor (MDPF2.data$Node)
MDPF2.data$Type = factor (MDPF2.data$Type)
MDPF2.data = subset (MDPF2.data, Type == "InData" & Node == "clientProvider" & FaceId != "0")[,c(1,2,3,7)]

# this is used to draw ndn with entropy routing
optimalRouting.data = read.table ('/home/rudy/ns-dev/experimentResult/results/congestion-zoom-ndn-bestRouting-15-rate-trace.log', header = TRUE, sep = "\t")
optimalRouting.data$Node = factor (optimalRouting.data$Node)
optimalRouting.data$Type = factor (optimalRouting.data$Type)
optimalRouting.data = subset (optimalRouting.data, Type == "InData" & Node == "clientProvider" & FaceId != "0")[,c(1,2,3,7)]


ndn_bestRouting.data = read.table ('/home/rudy/ns-dev/experimentResult/results/congestion-zoom-ndn-MDWRR3-15-rate-trace.log', header = TRUE, sep = "\t")
ndn_bestRouting.data$Node = factor (ndn_bestRouting.data$Node)
ndn_bestRouting.data$Type = factor (ndn_bestRouting.data$Type)
ndn_bestRouting.data = subset (ndn_bestRouting.data, Type == "InData" & Node == "clientProvider" & FaceId != "0")[,c(1,2,3,7)]

names (ndn_bestRouting.data) = names (optimalRouting.data)


MDPF2.data$Type = "MD-PF"
ndn_bestRouting.data$Type = "MD-WRR"
optimalRouting.data$Type = "BestRoute"


data = rbind (ndn_bestRouting.data,MDPF2.data,optimalRouting.data)


g <- ggplot (data=data ,aes(x=Time, y=Kilobytes, color = factor(FaceId),shape = factor(FaceId)) ) +
  geom_point(size=1.5) +

  ylab ("Link utilization [Kilobytes/s]") +
  xlab ("Time [second]")+

  facet_wrap (~ Type) +
  stat_smooth(se = FALSE)+

  scale_shape_discrete(name="Link")+
  

  scale_color_manual (name="Link", values = c('blue2', 'red4','darkgreen')) +
  
  theme_custom () + theme(legend.position=c(0.9,0.25)) + theme(legend.key.height=unit(0.9,'cm')) 

#   theme_update()




cat ("Writing graph to [face-flow-2.pdf]\n")
pdf (file = "face-flow-2.pdf",width=9,height=6)

g
x = dev.off ();

