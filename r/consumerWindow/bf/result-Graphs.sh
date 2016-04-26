#! /bin/bash

# throughput
./inData.R

# drop rate
python computeDropRate.py
./dropRateWindow.R

# load balance
./face-flow.R

# CDF of received Data
python computeInData.py
./accumulatedData.R

# CDF of delay
python collectDelay.py
./delayLine.R
#./rtt-line.R