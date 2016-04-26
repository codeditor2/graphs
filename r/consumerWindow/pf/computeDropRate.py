#!/usr/bin/env python
# -*- Mode: python; py-indent-offset: 4; indent-tabs-mode: nil; coding: utf-8; -*-
import string 


f_out = open ("averageDropRatePF.txt" , "w")

f_out.write ("Type\tTime\tAverageDrop\n")

types = ["BestRoute","MDPF3", "EPF3"]
for t in types:

    f_in = open ("/home/rudy/ns-dev/experimentResult/results/congestion-zoom-ndn-%s-100-drop-trace.txt" % t , "r")
    now_time = 1
    dropData = 0.0
    for line in f_in:
        a=line.split('\t')
        if a[3] == "Drop": 
            time = string.atoi(a[0])
            if time == now_time:
	        dropData += string.atof(a[5])
	    else:
                f_out.write("%s\t%d\t%f\n"%(t, now_time,dropData))
                now_time = time
                dropData = 0.0
    f_out.write("%s\t%d\t%f\n"%(t, now_time,dropData))  
   
f_out.close
