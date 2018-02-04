format long e

x0=1
t0=0
tf=2
K=1
h=1e-1
x=x0;
X = [];
T = t0:h:tf;
% T = linspace(t0,h,tf)
for t = T
  X = [X x];
  x = x + h*K*x;
end
X(end)
exp(K*tf)
abs(X(end)-exp(K*tf))
plot(T,exp(K*T),'r-',T,X,'b--')
legend('Exact solution','Numerical solution','Location','northwest')
