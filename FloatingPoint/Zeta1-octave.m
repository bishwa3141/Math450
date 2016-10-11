#! /usr/local/bin/octave -qf

arg_list = argv ();
%printf ("%s", arg_list{1});
N=10.^str2num(arg_list{1});
sum=0;
for i=N:-1:1
  sum = sum +1/i;
end
fprintf('sum(%d) = %.10f\n',N,sum);
