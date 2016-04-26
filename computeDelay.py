#!/usr/bin/env python
# -*- Mode: python; py-indent-offset: 4; indent-tabs-mode: nil; coding: utf-8; -*-
import string 




runs = range(15,16)
for run in runs:

    f_out = open ("bestDelay.txt" , "w")
#    f_out.write ("Type\tSeqNo\tFullDelay\n")
    
    count = 0;
    max_delay = 0.0;
    min_delay = 10000000.0;
    f_in = open ("/home/rudy/ns-dev/experimentResult/results/congestion-zoom-ndn-bestRouting-%d-app-delays-trace.log" % run , "r")

    for line in f_in:
        #f_out.write ("%s" % line)
        a = line.split('\t')
        if a[1]=='client' and a[2] == '1' and a[4]=='FullDelay': #and tring.atoi(a[3])>700 and string.atoi(a[3])<1500:
            if a[7] == '1':
	      f_out.write ("%f\t%s\n" % ((string.atof(a[5])*1000.0), a[3]))
	    else:
	      f_out.write ("%f\t%s\n" % (0.0, a[3]))
            count += 1
            if string.atof(a[5])*1000.0 > max_delay:
	      max_delay = string.atof(a[5])*1000.0
	    if string.atof(a[5])*1000.0 < min_delay:
	      min_delay = string.atof(a[5])*1000.0
    print "BestRoute"
    print "count=%d " % count
    print "max delay=%f " % max_delay
    print "min delay=%f\n" % min_delay
    f_in.close()
    f_out.close()
         
    f_out = open ("optimalDelay.txt" , "w")
#    f_out.write ("Type\tSeqNo\tFullDelay\n")
    count = 0;
    max_delay = 0.0;
    min_delay = 10000000.0;
    f_in = open ("/home/rudy/ns-dev/experimentResult/results/congestion-zoom-ndn-optimalRouting-%d-app-delays-trace.log" % run , "r")

    for line in f_in:
        #f_out.write ("%s" % line)
        a = line.split('\t')
        if a[1]=='client' and a[2] == '1' and a[4]=='FullDelay': #and string.atoi(a[3])>700 and string.atoi(a[3])<1500:
            if a[7] == '1':
	      f_out.write ("%f\t%s\n" % ((string.atof(a[5])*1000.0), a[3]))
	    else:
	      f_out.write ("%f\t%s\n" % (0.0, a[3]))
            count += 1
            if string.atof(a[5])*1000.0 > max_delay:
	      max_delay = string.atof(a[5])*1000.0
	    if string.atof(a[5])*1000.0 < min_delay:
	      min_delay = string.atof(a[5])*1000.0
    print "OptimalRoute"
    print "count=%d " % count
    print "max delay=%f " % max_delay
    print "min delay=%f\n" % min_delay
    f_in.close()
    f_out.close()
    
    f_out = open ("deviationDelay.txt" , "w")
#    f_out.write ("Type\tSeqNo\tFullDelay\n")
    count = 0;
    max_delay = 0.0;
    min_delay = 10000000.0;
    f_in = open ("/home/rudy/ns-dev/experimentResult/results/congestion-zoom-ndn-deviationRouting-%d-app-delays-trace.log" % run , "r")
    for line in f_in:
        #f_out.write ("%s" % line)
        a = line.split('\t')
        if a[1]=='client' and a[2] == '1' and a[4]=='FullDelay': # and string.atoi(a[3])>700 and string.atoi(a[3])<1500:
            if a[7] == '1':
	      f_out.write ("%f\t%s\n" % ((string.atof(a[5])*1000.0), a[3]))
	    else:
	      f_out.write ("%f\t%s\n" % (0.0, a[3]))
            count += 1
            if string.atof(a[5])*1000.0 > max_delay:
	      max_delay = string.atof(a[5])*1000.0
	    if string.atof(a[5])*1000.0 < min_delay:
	      min_delay = string.atof(a[5])*1000.0
    print "DeviationRoute"
    print "count=%d " % count
    print "max delay=%f " % max_delay
    print "min delay=%f\n" % min_delay
    f_in.close()
    f_out.close()