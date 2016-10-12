#!/usr/local/sage/local/bin/python
import sys
from math import *

def f(x):
    return x**2 - 4*sin(x)
	
def bisection(a,b,tol):
    i = 1
    c = (a+b)/2.0
    while (b-a)/2.0 > tol:
        print("iter %d --> a=%e, b=%e, f(a) = %e, f(b) = %e\n" % (i,a,b,f(a),f(b)))
        i += 1
	if f(c) == 0:
	    return c
	elif f(a)*f(c) < 0:
	    b = c
	else :
	    a = c
	c = (a+b)/2.0
    print("iter %d --> a=%e, b=%e, f(a) = %e, f(b) = %e\n" % (i,a,b,f(a),f(b)))
    return c
	
if len(sys.argv) != 4:
    sys.exit('Usage: bisection.py <a> <b> <tol>')

x = bisection(float(sys.argv[1]),float(sys.argv[2]),float(sys.argv[3]))
print("x = %e\n" % x);
