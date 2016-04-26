#!/usr/bin/env Rscript

suppressPackageStartupMessages (library(ggplot2))
suppressPackageStartupMessages (library(reshape2))
## suppressPackageStartupMessages (library(doBy))

source ("face-flow-style.R")
processedFile = "preprocess.data"


load (file=processedFile)

g <- ggplot (data=data.run ,aes(x=Time, y=Kilobytes )) +
  geom_point(size=3) +
  ylab ("Link utilization [Kilobytes]") +
  stat_smooth(se = FALSE)+
  theme_custom ()

cat ("Writing graph to [per-flow.pdf]\n")
pdf (file = "per-flow.pdf",width=9,height=6)
g
x = dev.off ();
