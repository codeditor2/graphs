#!/usr/bin/env python
# -*- Mode: python; py-indent-offset: 4; indent-tabs-mode: nil; coding: utf-8; -*-
import string 


f_out = open ("averageDropRate.txt" , "w")

f_out.write ("Type\tPairSize\tAverageDrop\n")

runs = range(1,21)
for run in runs:
    for subtype in ["bestRouting","MDF2BestRouting","MDPF2Routing"]:
        f_in = open("/home/wangjiawei/experimentResult/results/congestion-pop-run-%d-ndn-%s-drop-trace.txt" % (run,subtype), "r")

	dropData = 0.0
	for line in f_in:
	    a=line.split('\t')
	    if a[3] == "Drop": 
		dropData += string.atof(a[5])
	f_out.write("%s\t%d\t%f\n"%(subtype,run,dropData))
   
f_out.close
