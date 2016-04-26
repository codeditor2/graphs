#!/usr/bin/env python
# -*- Mode: python; py-indent-offset: 4; indent-tabs-mode: nil; coding: utf-8; -*-
import string 


f_out = open ("averageInData.txt" , "w")
f_out.write ("Type\tTime\tAverageInData\n")


types = ["BestRoute","MDPF3", "EPF3"]
for t in types:

    f_in = open ("/home/rudy/ns-dev/experimentResult/results/congestion-zoom-ndn-%s-100-rate-trace.log" % t , "r")
    inData = 0.0
    for line in f_in:
        a=line.split('\t')
        if a[4] == "InData" and a[1] =='client' and a[2]=="0": 
            time = string.atoi(a[0])
            inData += string.atof(a[7])
            f_out.write("%s\t%d\t%f\n"%(t, time,(inData/8066.0)))
   
f_out.close
