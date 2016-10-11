import sys
import math

def f(x):
    return x**2 - 4*math.sin(x)
	
def bisection(a,b,tol):
    c = (a+b)/2.0
    while (b-a)/2.0 > tol:
        print("a=%e, b=%e, f(a) = %e, f(b) = %e\n" % (a,b,f(a),f(b)));
	if f(c) == 0:
	    return c
	elif f(a)*f(c) < 0:
	    b = c
	else :
	    a = c
	c = (a+b)/2.0
	    
    return c
	
def main(argv):
    if (len(sys.argv) != 4):
	sys.exit('Usage: bisection.py <a> <b> <tol>')
	
    print 'The root is: ',
    print bisection(int(sys.argv[1]),int(sys.argv[2]),float(sys.argv[3]))
        
if __name__ == "__main__":
   main(sys.argv[1:])
