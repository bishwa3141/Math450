#!/usr/local/sage/local/bin/python
import sys
from math import *
from numpy import sign
import numpy as np

def f(x):
    return tan(x)
	
def bisection(a,b,tol):
    i = 1
    hl = (b-a)/2.0
    c = a+hl
    seq=[c];
    while hl > tol:
        print("iter %d --> c=%1.10e, f(c) = %1.10e\n" % (i,c,f(c)) )
        if sign(f(a)) != sign(f(c)):
            b=c
        else:
            a=c
        hl=(b-a)/2.0
        c = a+hl
        i += 1
        seq.append(c)
    print("iter %d --> c=%1.10e, f(c) = %1.10e\n" % (i,c,f(c)) )
    return seq
	
if len(sys.argv) != 4:
    sys.exit('Usage: bisection.py <a> <b> <tol>')

x = bisection(float(sys.argv[1]),float(sys.argv[2]),float(sys.argv[3]))
print("x = %1.10e\n" % x[-1]);

