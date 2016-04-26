#!/usr/bin/env python
# -*- Mode: python; py-indent-offset: 4; indent-tabs-mode: nil; coding: utf-8; -*-
import string

f_out = open ("/home/nebula/result/delay_result.txt" , "w")
f_out.write ("Type\tDelay\tNumber\n")

now_time = 123.0
count = 0
all_count = 0
f_in = open ("bestDelay_sort.txt", "r")

for line in f_in:
    #f_out.write ("%s" % line)
    a = line.split('\t')
    time = string.atof(a[0])
    if time > 1000000.00:
        f_out.write("bestRouting\t%f\t%d\n"%(now_time,count)) 
        all_count += count
        break
            
    if time >= (now_time-20.0) and time <= now_time:
        count += 1
    else:
        f_out.write("bestRouting\t%f\t%d\n"%(now_time,count))
	all_count += count
	now_time += 20.0
	count = 1
	
now_time = 123.0
count = 0
all_count = 0
f_in = open ("deviationDelay_sort.txt", "r")

for line in f_in:
    #f_out.write ("%s" % line)
    a = line.split('\t')
    time = string.atof(a[0])
    if time > 1000000.00:
        f_out.write("deviationRouting\t%f\t%d\n"%(now_time,count)) 
        all_count += count
        break
            
    if time >= (now_time-20.0) and time <= now_time:
        count += 1
    else:
        f_out.write("deviationRouting\t%f\t%d\n"%(now_time,count))
	all_count += count
	now_time += 20.0
	count = 1
	
now_time = 123.0
count = 0
all_count = 0
f_in = open ("optimalDelay_sort.txt", "r")

for line in f_in:
    #f_out.write ("%s" % line)
    a = line.split('\t')
    time = string.atof(a[0])
    if time > 1000000.00:
        f_out.write("optimalRouting\t%f\t%d\n"%(now_time,count)) 
        all_count += count
        break
            
    if time >= (now_time-20.0) and time <= now_time:
        count += 1
    else:
        f_out.write("optimalRouting\t%f\t%d\n"%(now_time,count))
	all_count += count
	now_time += 20.0
	count = 1	
	

f_out.close()