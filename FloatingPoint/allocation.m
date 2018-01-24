N = 100000
f=zeros(1,N);
tic
f(1)=1;
for i=2:N
  f(i)=f(i-1)+i;
end
rt=toc;
fprintf('f(%d)=%g, time spent in the cycle = %g s\n',N,f(N),rt);
whos
clear
N = 100000
tic
f(1)=1;
for i=2:N
  f(i)=f(i-1)+i;
end
rt=toc;
fprintf('f(%d)=%g, time spent in the cycle = %g s\n',N,f(N),rt); 
whos
clear
N = 1000
f=zeros(N,N);
tic
for i=1:N
  for j=1:N
    f(i,j)=j+i;
  end
end
rt=toc;
fprintf('f(%d)=%g, time spent in the cycle = %g s\n',N,f(N,N),rt);
whos
clear
N = 1000
tic
for i=1:N
  for j=1:N
    f(i,j)=j+i;
  end
end
rt=toc;
fprintf('f(%d)=%g, time spent in the cycle = %g s\n',N,f(N,N),rt);
whos
