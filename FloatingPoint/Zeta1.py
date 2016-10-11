#!/usr/bin/python

import sys
N = 10**int(sys.argv[1]);
sum = 0
for i in xrange(N,1,-1):
    sum += 1/float(i)
print('sum(%d) = %f' % (N , sum))
