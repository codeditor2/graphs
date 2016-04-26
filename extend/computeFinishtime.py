#!/usr/bin/env python
# -*- Mode: python; py-indent-offset: 4; indent-tabs-mode: nil; coding: utf-8; -*-
import string 


f_out = open ("finishTime.txt" , "w")

f_out.write ("Type\tPairSize\tTime\n")

runs = range(1,21)
for run in runs:
    for subtype in ["bestRouting","MDF2BestRouting","MDPF2Routing"]:
        f_in = open("/home/wangjiawei/experimentResult/results/congestion-pop-run-%d-ndn-%s-consumers-seqs.log" % (run,subtype), "r")
        finishTime = 0.0

	for line in f_in:
	    #f_out.write ("%s" % line)
	    a=line.split('\t')
	    if a[4]=='FullDelay':
		time = string.atof(a[0])
		if finishTime < time:
		    finishTime = time
    
	print "Type= %s:"% subtype
	print "PairSize=%d" % run
	print "FinishTime=%f " % finishTime
	f_out.write ("%s\t%d\t%f\n" % (subtype,run,finishTime))
    

f_out.close()