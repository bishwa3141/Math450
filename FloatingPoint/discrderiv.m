% A concrete demosntration of the effect of catastrophic cancellation
% in the evaluation of the discrete derivatives -- cannot take the paramete h too small!
% You can run this script from the CLI with <matlab -nosplash -nodesktop -r "run discrderiv.m">

function myF()
  
  N=14;
  
  for i=1:N
    h(i)=10^(-i);
    dder(i)=dsin(1,h(i));
    err(i)=abs(dder(i)-cos(1));
  end
  
  figure(1);
  loglog(h,err,'ro--');
  title('Error in the evaluation of the Discrete Derivative');
  xlabel('h');
  ylabel('Error');
    
end

function der = dsin(x,h)
  der = (sin(x+h)-sin(x))/h;
end
