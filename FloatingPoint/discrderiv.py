# A concrete demosntration of the effect of catastrophic cancellation
# in the evaluation of the discrete derivatives -- cannot take the parameter h too small!
# You can run this script from the CLI with <matlab -nosplash -nodesktop -r "run discrderiv.m">

from math import sin
from math import cos
import matplotlib.pyplot as plt

def dsin(x,h):
    return (sin(x+h)-sin(x))/h;

def dsin2(x,h):
    return (sin(x+h)-sin(x-h))/(2*h);

N=14
h = [0]*N;
dder = [0]*N;
dder2 = [0]*N;
err = [0]*N;
err2 = [0]*N;

for i in xrange(0,N):
    h[i]=10**(-i);
    dder[i]=dsin(1,h[i]);
    err[i]=abs(dder[i]-cos(1));
    dder2[i]=dsin2(1,h[i]);
    err2[i]=abs(dder2[i]-cos(1));

plt.title('Error in the evaluation of the Discrete Derivative')
plt.xlabel('h')
plt.ylabel('Error')
plt.loglog(h, err, 'ro--', basex=10) 
plt.loglog(h, err2,'b*--', basex=10)
plt.show()
