% Summing the harmonic series 
% This script requires an argument, it can be run from the CLI with <matlab -nosplash -nodesktop -r "Zeta1 1000; exit">
function Zeta1(i)
  N=10.^str2num(i);
  sum=0;
  for i=1:N
    sum = sum +1/(N-i+1);
  end
  format compact
  format long e
  N
  sum
%fprintf('sum(%d) = %.10f\n',N,sum);
end
