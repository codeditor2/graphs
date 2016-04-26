#!/usr/bin/env python
# -*- Mode: python; py-indent-offset: 4; indent-tabs-mode: nil; coding: utf-8; -*-
import string 

f_out = open ("hitRatio.txt" , "w")
f_out.write ("Type\tTime\tRatio\n")
runs = range(1, 8)
types = ["bestRouting","MDPF3", "MDBF3"]

for t in types:

    f_in = open ("/home/rudy/ns-dev/experimentResult/results/congestion-zoom-ndn-%s-15-cs-trace.txt" % t , "r")
    
    first_line = 1
    now_time = 1 
    hit = 0.0
    miss = 0.0
    for line in f_in:
        if first_line == 1:
            first_line = 0
        else:
            a = line.split('\t')
            time = string.atoi(a[0])
            time = string.atoi(a[0])
            if time == now_time:
                if a[2] == 'CacheHits':
                    hit += string.atof(a[3])
                else:
                    miss += string.atof(a[3])
            else:
                f_out.write("%s\t%d\t%f\n" % (t, now_time, (hit/(hit+miss))*100))
                now_time = time
                hit = 0.0
                miss = 0.0
    f_out.write("%s\t%d\t%f\n" % (t, now_time, (hit/(hit+miss))*100))