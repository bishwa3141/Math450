#!/usr/local/sage/local/bin/python

from scipy.optimize import newton
from numpy import sin,cos

def f(x):
    return x*x-4*sin(x)
def df(x):
    return 2*x-4*cos(x)

def dx(f, x):
    return abs(0-f(x))

x0=1.8
x = newton(f, x0, df, tol=1e-5, maxiter=100)
print 'x = ', x
