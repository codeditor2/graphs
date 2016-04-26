#!/usr/bin/env python
# -*- Mode: python; py-indent-offset: 4; indent-tabs-mode: nil; coding: utf-8; -*-
import string 


f_out = open ("finishTime.txt" , "w")

f_out.write ("Type\tSize\tTime\n")

runs = range(2,9)
for run in runs:

    f_in = open ("/home/rudy/ns-dev/experimentResult/results/size/ndn-bestRouting-%d-app-delays-trace.log" % run , "r")
    finishTime = 0.0

    for line in f_in:
        #f_out.write ("%s" % line)
        a=line.split('\t')
        if a[1]=='client' and a[4]=='FullDelay':
            time = string.atof(a[0])
            if finishTime < time:
	        finishTime = time
    
    print "Type= BestRoute:"
    print "Size=%d" % (pow(2,run))
    print "FinishTime=%f " % finishTime
    f_out.write ("BestRoute\t%d\t%f\n" % (pow(2,run),finishTime))
    
    f_in = open ("/home/rudy/ns-dev/experimentResult/results/size/ndn-deviationRouting-%d-app-delays-trace.log" % run , "r")
    finishTime = 0.0

    for line in f_in:
        #f_out.write ("%s" % line)
        a=line.split('\t')
        if a[1]=='client' and a[4]=='FullDelay':
            time = string.atof(a[0])
            if finishTime < time:
	        finishTime = time
    
    print "Type= MDPF-2:"
    print "Size=%d" % (pow(2,run))
    print "FinishTime=%f " % finishTime
    f_out.write ("MDPF-2\t%d\t%f\n" % (pow(2,run),finishTime))
    
    
    #f_in = open ("/home/rudy/ns-dev/experimentResult/results/size/ndn-deviationRouting3-%d-app-delays-trace.log" % run , "r")
    #finishTime = 0.0

    #for line in f_in:
        ##f_out.write ("%s" % line)
        #a=line.split('\t')
        #if a[1]=='client' and a[4]=='FullDelay':
            #time = string.atof(a[0])
            #if finishTime < time:
	        #finishTime = time
    
    #print "Type= MDPF-3:"
    #print "Size=%d" % (pow(2,run))
    #print "FinishTime=%f " % finishTime
    #f_out.write ("MDPF-3\t%d\t%f\n" % (pow(2,run),finishTime)) 
    
    f_in = open ("/home/rudy/ns-dev/experimentResult/results/size/ndn-optimalRouting-%d-app-delays-trace.log" % run , "r")
    finishTime = 0.0

    for line in f_in:
        #f_out.write ("%s" % line)
        a=line.split('\t')
        if a[1]=='client' and a[4]=='FullDelay':
            time = string.atof(a[0])
            if finishTime < time:
	        finishTime = time
    
    print "Type= PI-based:"
    print "Size=%d" % (pow(2,run))
    print "FinishTime=%f " % finishTime
    f_out.write ("PI-based\t%d\t%f\n" % (pow(2,run),finishTime))

f_out.close()