from math import exp
import matplotlib.pyplot as plt

x0=1
t0=0
tf=2
K=1
h=1e-1
x=x0
t=t0
X=[]
T=[]
while t < tf:
    X.append(x)
    T.append(t)
    t = t+h
    x = x + h*K*x;
print('x = %e' % X[-1])
print('exp(K*tf) = %e' % exp(K*tf))
print('abs(x-exp(K*tf)) = %e' % abs(X[-1]-exp(K*tf)))
plt.plot(T,[exp(K*t) for t in T],'r-',T,X,'b--')
plt.legend(('Exact solution','Numerical solution'),loc='upper left')
plt.show()

