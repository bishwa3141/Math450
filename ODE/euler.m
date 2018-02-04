format long e

x0=1
K=1
h=1e-1
i=0;
x=x0;
t=0;
while t < 1
  i = i + 1;
  X(i) = x;
  t = t + h;
  x = x + h*K*x;
end
x
exp(K)
abs(x-exp(K))
I = 1:i;
plot(I,exp(K*(I-1)*h),'ro-',I,X,'b*--')
