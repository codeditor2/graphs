#!/usr/bin/env Rscript

suppressPackageStartupMessages (library(ggplot2))
suppressPackageStartupMessages (library(reshape2))
## suppressPackageStartupMessages (library(doBy))

source ("face-flow-style.R")

# this is used to draw tcp line
#tcp.data = read.table ('results/congestion-zoom-tcp-rate-trace.txt', header = TRUE, sep = "\t")
#tcp.data$Node = factor (tcp.data$Node)
#tcp.data$Type = factor (tcp.data$Type)
#tcp.data$Interface = factor (tcp.data$Interface-1)

#tcp.data = subset (tcp.data, Type == "In")[,c(1,2,3,6)]

# this is used to draw ndn with deviation3 routing
deviationRouting3.data = read.table ('/home/rudy/ns-dev/experimentResult/results/congestion-zoom-ndn-deviation2BestRouting-100-rate-trace.log', header = TRUE, sep = "\t")
deviationRouting3.data$Node = factor (deviationRouting3.data$Node)
deviationRouting3.data$Type = factor (deviationRouting3.data$Type)
deviationRouting3.data = subset (deviationRouting3.data, Type == "InData" & Node == "clientProvider" & FaceId != "0")[,c(1,2,3,7)]

# this is used to draw ndn with deviation routing
deviationRouting.data = read.table ('/home/rudy/ns-dev/experimentResult/results/congestion-zoom-ndn-deviationRouting3-100-rate-trace.log', header = TRUE, sep = "\t")
deviationRouting.data$Node = factor (deviationRouting.data$Node)
deviationRouting.data$Type = factor (deviationRouting.data$Type)
deviationRouting.data = subset (deviationRouting.data, Type == "InData" & Node == "clientProvider" & FaceId != "0")[,c(1,2,3,7)]

# this is used to draw ndn with entropy routing
entropyRouting.data = read.table ('/home/rudy/ns-dev/experimentResult/results/congestion-zoom-ndn-optimalRouting-100-rate-trace.log', header = TRUE, sep = "\t")
entropyRouting.data$Node = factor (entropyRouting.data$Node)
entropyRouting.data$Type = factor (entropyRouting.data$Type)
entropyRouting.data = subset (entropyRouting.data, Type == "InData" & Node == "clientProvider" & FaceId != "0")[,c(1,2,3,7)]

# this is used to draw ndn with best routing
#ndn.data = read.table (bzfile('results/figure-9-one-flow-congestion-ndn.txt.bz2'), header = TRUE, sep = "\t")
ndn_bestRouting.data = read.table ('/home/rudy/ns-dev/experimentResult/results/congestion-zoom-ndn-bestRouting-100-rate-trace.log', header = TRUE, sep = "\t")
ndn_bestRouting.data$Node = factor (ndn_bestRouting.data$Node)
ndn_bestRouting.data$Type = factor (ndn_bestRouting.data$Type)
ndn_bestRouting.data = subset (ndn_bestRouting.data, Type == "InData" & Node == "clientProvider" & FaceId != "0")[,c(1,2,3,7)]

names (ndn_bestRouting.data) = names (entropyRouting.data)
#names (ndn_bestRouting.data) =names (tcp.data)

deviationRouting.data$Type = "MDPF-2"
ndn_bestRouting.data$Type = "BestRoute"
entropyRouting.data$Type = "PI-based"
# deviationRouting3.data$Type = "MDBF-2"
#tcp.data$Type = "TCP"

data = rbind (ndn_bestRouting.data,deviationRouting.data,entropyRouting.data)


g <- ggplot (data=data ,aes(x=Time, y=Kilobytes,color = factor(FaceId),shape = factor(FaceId)) ) +
  geom_point(size=2) +

  ylab ("Link utilization [Kilobytes/s]") +
  xlab ("Time [second]")+

  facet_wrap (~ Type) +
  stat_smooth(se = FALSE)+

  scale_shape_discrete(name="Link")+
  

  scale_color_manual (name="Link", values = c('blue2', 'red4','darkgreen')) +

  theme_custom ()





cat ("Writing graph to [103face-flow.pdf]\n")
pdf (file = "extend_face-flow.pdf",width=9,height=6)
g+theme(legend.position=c(0.9,0.8))
g
x = dev.off ();

