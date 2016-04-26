#!/usr/bin/env python
# -*- Mode: python; py-indent-offset: 4; indent-tabs-mode: nil; coding: utf-8; -*-
import string 


f_out = open ("averageFlow.txt" , "w")

f_out.write ("Type\tFrequency\tAverageFlow\n")

runs = range(1,51)
for run in runs:

    f_in = open ("/home/rudy/ns-dev/experimentResult/results/congestion-zoom-ndn-bestRouting-%d-rate-trace.log" % run , "r")
    count=0
    sum_flow=0.0
    frequency=0

    for line in f_in:
        #f_out.write ("%s" % line)
        a=line.split('\t')
        if a[1]=='client' and a[2]=='0' and a[4]=='InData':
            #print a[1]+" "+a[2]+" "+a[4]+" "+a[6]
            count+=1
            sum_flow+=string.atof(a[6])
    
    #print "Type= bestRouting:"
    #print "frequency=%d" % (run*100)
    #print "count=%d " % count
    #print "sum_flow=%f" % sum_flow
    #print "average flow : %f" % (sum_flow/count)
    f_out.write ("BestRoute\t%d\t%s\n" % ((run*100),((sum_flow/count))))   
    
    
    f_in = open ("/home/rudy/ns-dev/experimentResult/results/congestion-zoom-ndn-deviationRouting2Rtt-%d-rate-trace.log" % run , "r")
    count=0
    sum_flow=0.0
    frequency=0

    for line in f_in:
	#f_out.write ("%s" % line)
	a=line.split('\t')
	if a[1]=='client' and a[2]=='0' and a[4]=='InData':
	  #print a[1]+" "+a[2]+" "+a[4]+" "+a[6]
	  count+=1
	  sum_flow+=string.atof(a[6])
    
    #print "Type= deviationRouting:"
    #print "frequency=%d" % (run*100)
    #print "count=%d " % count
    #print "sum_flow=%f" % sum_flow
    #print "average flow : %f" % (sum_flow/count)
    f_out.write ("MDPF-2\t%d\t%s\n" % ((run*100),((sum_flow/count))))
    
    
    #f_in = open ("/home/rudy/ns-dev/experimentResult/results/congestion-zoom-ndn-deviationRouting3-%d-rate-trace.log" % run , "r")
    #count=0
    #sum_flow=0.0
    #frequency=0

    #for line in f_in:
	##f_out.write ("%s" % line)
	#a=line.split('\t')
	#if a[1]=='client' and a[2]=='0' and a[4]=='InData':
	  ##print a[1]+" "+a[2]+" "+a[4]+" "+a[6]
	  #count+=1
	  #sum_flow+=string.atof(a[6])
    
    ##print "Type= deviationRouting3:"
    ##print "frequency=%d" % (run*100)
    ##print "count=%d " % count
    ##print "sum_flow=%f" % sum_flow
    ##print "average flow : %f" % (sum_flow/count)
    #f_out.write ("MDPF-3\t%d\t%s\n" % ((run*100),((sum_flow/count))))
    

    f_in = open ("/home/rudy/ns-dev/experimentResult/results/congestion-zoom-ndn-deviationRouting2-%d-rate-trace.log" % run , "r")
    count=0
    sum_flow=0.0
    frequency=0

    for line in f_in:
        #f_out.write ("%s" % line)
        a=line.split('\t')
        if a[1]=='client' and a[2]=='0' and a[4]=='InData':
            #print a[1]+" "+a[2]+" "+a[4]+" "+a[6]
            count+=1
            sum_flow+=string.atof(a[6])
    
    #print "Type= bestRouting:"
    #print "frequency=%d" % (run*100)
    #print "count=%d " % count
    #print "sum_flow=%f" % sum_flow
    #print "average flow : %f" % (sum_flow/count)
    f_out.write ("MDPF-3\t%d\t%s\n" % ((run*100),((sum_flow/count))))  