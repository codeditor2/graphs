#!/usr/bin/env python
# -*- Mode: python; py-indent-offset: 4; indent-tabs-mode: nil; coding: utf-8; -*-
import string 


f_out = open ("3averageDropRate.txt" , "w")

f_out.write ("Type\tFrequency\tDropRate\n")

runs = range(1,47)
for run in runs:
    
    f_in = open ("/home/rudy/ns-dev/experimentResult/results/congestion-zoom-ndn-bestRouting-%d-drop-trace.txt" % run , "r")

    count=30
    drop_rate=0.0
    frequency=0
    firstline = f_in.readline ()

    for line in f_in:
	#f_out.write ("%s" % line)
	a=line.split('\t')
	drop_rate+=string.atof(a[5])
    
    print "Type= bestRouting:"
    print "frequency=%d" % (run*100)
    print "drop_rate=%f" % drop_rate
    print "average drop rate : %f" % (drop_rate/count)
    f_out.write ("bestRouting\t%d\t%s\n" % ((run*100),((drop_rate/count))))
    
    #f_in = open ("/home/rudy/ns-dev/experimentResult/results/congestion-zoom-ndn-entropyRouting-%d-drop-trace.txt" % run , "r")

    #count=30
    #drop_rate=0.0
    #frequency=0
    #firstline = f_in.readline ()

    #for line in f_in:
	##f_out.write ("%s" % line)
	#a=line.split('\t')
	#drop_rate+=string.atof(a[5])
    
    #print "Type= entropyRouting:"
    #print "frequency=%d" % (run*100)
    #print "drop_rate=%f" % drop_rate
    #print "average drop rate : %f" % (drop_rate/count)
    #f_out.write ("entropyRouting\t%d\t%s\n" % ((run*100),((drop_rate/count))))
    
    f_in = open ("/home/rudy/ns-dev/experimentResult/results/congestion-zoom-ndn-deviationRouting-%d-drop-trace.txt" % run , "r")

    count=30
    drop_rate=0.0
    frequency=0
    firstline = f_in.readline ()

    for line in f_in:
	#f_out.write ("%s" % line)
	a=line.split('\t')
	drop_rate+=string.atof(a[5])
    
    print "Type= deviationRouting:"
    print "frequency=%d" % (run*100)
    print "drop_rate=%f" % drop_rate
    print "average drop rate : %f" % (drop_rate/count)
    f_out.write ("deviationRouting\t%d\t%s\n" % ((run*100),((drop_rate/count))))
    
    f_in = open ("/home/rudy/ns-dev/experimentResult/results/congestion-zoom-ndn-deviationRouting3-%d-drop-trace.txt" % run , "r")
    count=30
    drop_rate=0.0
    frequency=0
    firstline = f_in.readline ()

    for line in f_in:
	#f_out.write ("%s" % line)
	a=line.split('\t')
	drop_rate+=string.atof(a[5])
    
    print "Type= deviationRouting3:"
    print "frequency=%d" % (run*100)
    print "drop_rate=%f" % drop_rate
    print "average drop rate : %f" % (drop_rate/count)
    f_out.write ("deviationRouting3\t%d\t%s\n" % ((run*100),((drop_rate/count))))
    
    
    #f_in = open ("/home/rudy/ns-dev/experimentResult/results/congestion-zoom-ndn-randomRouting-%d-drop-trace.txt" % run , "r")

    #count=30
    #drop_rate=0.0
    #frequency=0
    #firstline = f_in.readline ()

    #for line in f_in:
	##f_out.write ("%s" % line)
	#a=line.split('\t')
	#drop_rate+=string.atof(a[5])
    
    #print "Type= randomRouting:"
    #print "frequency=%d" % (run*100)
    #print "drop_rate=%f" % drop_rate
    #print "average drop rate : %f" % (drop_rate/count)
    #f_out.write ("randomRouting\t%d\t%s\n" % ((run*100),((drop_rate/count))))
    
    f_in = open ("/home/rudy/ns-dev/experimentResult/results/congestion-zoom-ndn-optimalRouting-%d-drop-trace.txt" % run , "r")

    count=30
    drop_rate=0.0
    frequency=0
    firstline = f_in.readline ()

    for line in f_in:
	#f_out.write ("%s" % line)
	a=line.split('\t')
	drop_rate+=string.atof(a[5])
    
    print "Type= optimalRouting:"
    print "frequency=%d" % (run*100)
    print "drop_rate=%f" % drop_rate
    print "average drop rate : %f" % (drop_rate/count)
    f_out.write ("optimalRouting\t%d\t%s\n" % ((run*100),((drop_rate/count))))
    
    
