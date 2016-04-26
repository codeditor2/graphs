#!/usr/bin/env python
# -*- Mode: python; py-indent-offset: 4; indent-tabs-mode: nil; coding: utf-8; -*-
import string 


f_out = open ("averageDropRate-100.txt" , "w")

f_out.write ("Type\tTime\tAverageDrop\n")

runs = range(100,101)
for run in runs:

    f_in = open ("/home/rudy/ns-dev/experimentResult/results/congestion-zoom-ndn-bestRouting-%d-drop-trace.txt" % run , "r")
    now_time = 1
    dropData = 0.0
    for line in f_in:
        a=line.split('\t')
        if a[3] == "Drop": 
            time = string.atoi(a[0])
            if time == now_time:
	        dropData += string.atof(a[5])
	    else:
                f_out.write("BestRoute\t%d\t%f\n"%(now_time,dropData))
                now_time = time
                dropData = 0.0
    f_out.write("BestRoute\t%d\t%f\n"%(now_time,dropData))
    
    f_in = open ("/home/rudy/ns-dev/experimentResult/results/congestion-zoom-ndn-optimalRouting-%d-drop-trace.txt" % run , "r")
    now_time = 1
    dropData = 0.0
    for line in f_in:
        a=line.split('\t')
        if a[3] == "Drop": 
            time = string.atoi(a[0])
            if time == now_time:
	        dropData += string.atof(a[5])
	    else:
                f_out.write("PI-based\t%d\t%f\n"%(now_time,dropData))
                now_time = time
                dropData = 0.0
    f_out.write("PI-based\t%d\t%f\n"%(now_time,dropData))
    
    f_in = open ("/home/rudy/ns-dev/experimentResult/results/congestion-zoom-ndn-deviationRouting3-%d-drop-trace.txt" % run , "r")
    now_time = 1
    dropData = 0.0
    for line in f_in:
        a=line.split('\t')
        if a[3] == "Drop": 
            time = string.atoi(a[0])
            if time == now_time:
	        dropData += string.atof(a[5])
	    else:
                f_out.write("MDPF-2\t%d\t%f\n"%(now_time,dropData))
                now_time = time
                dropData = 0.0
    f_out.write("MDPF-2\t%d\t%f\n"%(now_time,dropData))
    
    #f_in = open ("/home/rudy/ns-dev/experimentResult/results/congestion-zoom-ndn-deviationRouting3-%d-drop-trace.txt" % run , "r")
    #now_time = 1
    #dropData = 0.0
    #for line in f_in:
        #a=line.split('\t')
        #if a[3] == "Drop": 
            #time = string.atoi(a[0])
            #if time == now_time:
	        #dropData += string.atof(a[5])
	    #else:
                #f_out.write("MDPF-3\t%d\t%f\n"%(now_time,dropData))
                #now_time = time
                #dropData = 0.0
    #f_out.write("MDPF-3\t%d\t%f\n"%(now_time,dropData))
   
f_out.close
