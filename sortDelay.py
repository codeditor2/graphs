#!/usr/bin/env python
# -*- Mode: python; py-indent-offset: 4; indent-tabs-mode: nil; coding: utf-8; -*-
import string

f=open('bestDelay.txt')
aa={}
bb=[]
k=[]

for i in f.readlines():
    bb.append(i.split('\n'))
    k.append(i.split('\t')[0])

for i in range(0,len(bb)):
    aa[bb[i][0]]=string.atof(k[i])
f.close()

cc=sorted(aa.items(),key=lambda aa:aa[1])
g=open('bestDelay_sort.txt','w+')
#g.write ("FullDelay\tSeqNo\n")
for i in range(0,len(cc)):
    g.write(cc[i][0] + "\n")
    
g.write("10000000.00")
g.close()

f=open('optimalDelay.txt')
aa={}
bb=[]
k=[]

for i in f.readlines():
    bb.append(i.split('\n'))
    k.append(i.split('\t')[0])

for i in range(0,len(bb)):
    aa[bb[i][0]]=string.atof(k[i])
f.close()

cc=sorted(aa.items(),key=lambda aa:aa[1])
g=open('optimalDelay_sort.txt','w+')
#g.write ("FullDelay\tSeqNo\n")
for i in range(0,len(cc)):
    g.write(cc[i][0] + "\n")
    
g.write("10000000.00")
g.close()

f=open('deviationDelay.txt')
aa={}
bb=[]
k=[]

for i in f.readlines():
    bb.append(i.split('\n'))
    k.append(i.split('\t')[0])

for i in range(0,len(bb)):
    aa[bb[i][0]]=string.atof(k[i])
f.close()

cc=sorted(aa.items(),key=lambda aa:aa[1])
g=open('deviationDelay_sort.txt','w+')
#g.write ("FullDelay\tSeqNo\n")
for i in range(0,len(cc)):
    g.write(cc[i][0] + "\n")

g.write("10000000.00")
g.close()