% A concrete demonstration of the effect of catastrophic cancellation
% in the evaluation of the discrete derivatives -- cannot take the parameter h too small!
% You can run this script from the CLI with <matlab -nosplash -nodesktop -r "run discrderiv.m">

function discrderiv()
  
  N=14;
  
  for i=1:N
    h(i)=10^(-i);
    dder(i)=dsin(1,h(i));
    err(i)=abs(dder(i)-cos(1));
    dder2(i)=dsin2(1,h(i));
    err2(i)=abs(dder2(i)-cos(1));
  end
  
  figure(1);
  loglog(h,err,'ro--');
  hold on;
  loglog(h,err2,'b*--');
  title('Error in the evaluation of the Discrete Derivative');
  xlabel('h');
  ylabel('Error');
    
end

function der = dsin(x,h)
  der = (sin(x+h)-sin(x))/h;
end

function der = dsin2(x,h)
  der = (sin(x+h)-sin(x-h))/(2*h);
end
