#!/usr/bin/env Rscript

suppressPackageStartupMessages (library(ggplot2))
suppressPackageStartupMessages (library(reshape2))
## suppressPackageStartupMessages (library(doBy))

source ("inData-style.R")

# this is used to draw tcp line
#tcp.data = read.table ('results/congestion-zoom-tcp-rate-trace.txt', header = TRUE, sep = "\t")
#tcp.data$Node = factor (tcp.data$Node)
#tcp.data$Type = factor (tcp.data$Type)
#tcp.data$Interface = factor (tcp.data$Interface-1)

#tcp.data = subset (tcp.data, Type == "In")[,c(1,2,3,6)]

# this is used to draw ndn with entropy routing
# entropyRouting2.data = read.table ('/home/rudy/ns-dev/experimentResult/results/congestion-zoom-ndn-deviation2BestRouting-100-rate-trace.log', header = TRUE, sep = "\t")
# entropyRouting2.data$Node = factor (entropyRouting2.data$Node)
# entropyRouting2.data$Type = factor (entropyRouting2.data$Type)
# entropyRouting2.data = subset (entropyRouting2.data, Type == "InData" & Node =="client" & FaceId=="0")[,c(1,2,3,7)]

# this is used to draw ndn with entropy routing
entropyRouting.data = read.table ('/home/rudy/ns-dev/experimentResult/results/congestion-zoom-ndn-deviationRouting3-100-rate-trace.log', header = TRUE, sep = "\t")
entropyRouting.data$Node = factor (entropyRouting.data$Node)
entropyRouting.data$Type = factor (entropyRouting.data$Type)
entropyRouting.data = subset (entropyRouting.data, Type == "InData" & Node =="client" & FaceId=="0")[,c(1,2,3,7)]

# this is used to draw ndn with entropy routing
optimalRouting.data = read.table ('/home/rudy/ns-dev/experimentResult/results/congestion-zoom-ndn-optimalRouting-100-rate-trace.log', header = TRUE, sep = "\t")
optimalRouting.data$Node = factor (optimalRouting.data$Node)
optimalRouting.data$Type = factor (optimalRouting.data$Type)
optimalRouting.data = subset (optimalRouting.data, Type == "InData" & Node =="client" & FaceId=="0")[,c(1,2,3,7)]

# this is used to draw ndn with best routing
#ndn.data = read.table (bzfile('results/figure-9-one-flow-congestion-ndn.txt.bz2'), header = TRUE, sep = "\t")
ndn_bestRouting.data = read.table ('/home/rudy/ns-dev/experimentResult/results/congestion-zoom-ndn-bestRouting-100-rate-trace.log', header = TRUE, sep = "\t")
ndn_bestRouting.data$Node = factor (ndn_bestRouting.data$Node)
ndn_bestRouting.data$Type = factor (ndn_bestRouting.data$Type)
ndn_bestRouting.data = subset (ndn_bestRouting.data, Type == "InData" & Node =="client" & FaceId=="0")[,c(1,2,3,7)]

names (ndn_bestRouting.data) = names (entropyRouting.data)
#names (ndn_bestRouting.data) =names (tcp.data)

ndn_bestRouting.data$Type = "BestRoute"
entropyRouting.data$Type = "MDPF-2"
# entropyRouting2.data$Type = "MDBF-2"
optimalRouting.data$Type = "PI-based"
#tcp.data$Type = "TCP"

data = rbind (entropyRouting.data,ndn_bestRouting.data,optimalRouting.data)
# data = rbind (entropyRouting.data,ndn_bestRouting.data, entropyRouting2.data)

g <- ggplot (data=data, aes(x=Time, y=Kilobytes, color = Type, linetype = Type)) +
  geom_line (size = 0.8) +
  scale_color_manual (values = c('blue2', 'red4', 'darkgreen','black')) +
  xlab ("Time [second]") +
  ylab ("Throughput [Kilobytes/s]") +
  #facet_wrap (~ Node + Interface) +
  facet_wrap (~ Node + FaceId) +
  ##scale_color_manual (values = c("red", "blue")) +
  theme_custom ()


cat ("Writing graph to [inData.pdf]\n")
pdf (file = "extend_inData.pdf",width=9,height=6)
g+theme(legend.position=c(0.8,0.8))
g
x = dev.off ();
