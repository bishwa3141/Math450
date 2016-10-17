#!/usr/local/sage/local/bin/python
from pylab import plot,show
from numpy import array,linspace,sqrt,sin,exp
from numpy.linalg import norm

def fixedp(f,x0,tol=10e-6,maxiter=100):
    """ Fixed point algorithm """
    e = 1
    l=.99
    i = 0
    xp = []
    while(e > tol and i < maxiter):
        print("iter %d --> x = %e\n" % (i,x0) )
        x = l*x0+(1-l)*f(x0)      # fixed point equation
        l = .99*l
        e = norm(x0-x) # error at the current step
        x0 = x         # update the current point
        xp.append(x0)  # save the solution of the current step
        i += 1
    print("Done! Plotting the points...\n")
    return x,xp
    
f = lambda x : exp((x-2)**2)-2
    
x_start = .95
xf,xp = fixedp(f,x_start)
    
x = linspace(1.75,2.,100)
y = f(x)
plot(x,y,xp,f(xp),'bo',x_start,f(x_start),'ro',xf,f(xf),'go',x,x,'k')
show()
