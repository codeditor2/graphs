#!/usr/bin/env python
# -*- Mode: python; py-indent-offset: 4; indent-tabs-mode: nil; coding: utf-8; -*-
import string 


f_out = open ("/home/rudy/ns-dev/experimentResult/graphs/r/rate_result.txt" , "w")

f_out.write ("Type\tTime\tSendNum\n")

runs = range(15,16)
for run in runs:

    now_time = 1.0
    count = 0
    all_count = 0
    f_in = open ("/home/rudy/ns-dev/experimentResult/graphs/deviation_rate.log", "r")

    for line in f_in:
        #f_out.write ("%s" % line)
        a = line.split('\t')
        time = string.atof(a[0])
        if time > 100.0:
            f_out.write("deviationRouting\t%f\t%d\n"%(now_time,count)) 
            all_count += count
            break
            
        if time >= (now_time-1.0) and time <= now_time:
            count += 1
        else:
	    f_out.write("deviationRouting\t%f\t%d\n"%(now_time,count))
	    all_count += count
	    now_time += 1.0
	    count = 1
	 
    print "all number %d" % all_count
         
    now_time = 1.0
    count = 0
    all_count = 0
    f_in = open ("/home/rudy/ns-dev/experimentResult/graphs/best_rate.log", "r")

    for line in f_in:
        #f_out.write ("%s" % line)
        a = line.split('\t')
        time = string.atof(a[0])
        if time > 100.0:
            f_out.write("bestRouting\t%1f\t%d\n"%(now_time,count)) 
            all_count += count
            break
            
        if time >= (now_time-1.0) and time <= now_time:
            count += 1
        else:
	    f_out.write("bestRouting\t%f\t%d\n"%(now_time,count))
	    all_count += count
	    now_time += 1.0
	    count = 1
	if a[0] == "end":
            f_out.write("bestRouting\t%f\t%d\n"%(now_time,count))   
    print "all number %d" % all_count
      
    now_time = 1.0
    count = 0
    all_count = 0
    f_in = open ("/home/rudy/ns-dev/experimentResult/graphs/optimal_rate.log", "r")

    for line in f_in:
        #f_out.write ("%s" % line)
        a = line.split('\t')
        time = string.atof(a[0])
        if time > 100.0:
            f_out.write("optimalRouting\t%f\t%d\n"%(now_time,count)) 
            all_count += count
            break
            
        if time >= (now_time-1.0) and time <= now_time:
            count += 1
        else:
	    f_out.write("optimalRouting\t%f\t%d\n"%(now_time,count))
	    all_count += count
	    now_time += 1.0
	    count = 1
	if a[0] == "end":
            f_out.write("optimalRouting\t%f\t%d\n"%(now_time,count))         
    print "all number %d" % all_count