% Kahan's trick for getting epsilon machine
% you can run this script with <matlab -nosplash -nodesktop -r "run em.m; exit">
eps=abs(3*(4/3-1)-1);
fprintf('em = %e\n',eps);
