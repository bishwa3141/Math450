#!/usr/local/sage/local/bin/python

from numpy import sin,cos

def dx(f, x):
    return abs(0-f(x))

def newtons_method(f, df, x0, e):
    delta = dx(f, x0)
    i=0
    while delta > e:
        print 'iter ', i, ' --> x = ', x0
        i += 1
        x0 = x0 - f(x0)/df(x0)
        delta = dx(f, x0)
    print 'Root is at: ', x0
    print 'f(x) at root is: ', f(x0) , ' iterations = ', i

def f(x):
    return x*x-4*sin(x)

def df(x):
    return 2*x-4*cos(x)

x0 = 1.5
newtons_method(f,df,x0,1e-5)
