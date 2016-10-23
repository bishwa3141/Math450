% Function to evaluate the shape of basins of attractions
% for the Newton method on the plane
% based on the code by Tomasz Malisiewcz <tomasz@cmu.edu> at http://quantombone.blogspot.com/
% Eg you can call this code from the CLI with
% matlab -nodesktop -nosplash -r "[n,s]=newtonBasinsReal(-1,1,-1,1,1000); imagesc(n)"
function [niters,solutions] = newtonBasinsReal(xmin,xmax,ymin,ymax,rez)
  NITER = 400;
  threshold = .001;
  [xs,ys] = meshgrid(linspace(xmin,xmax,rez), linspace(ymin,ymax,rez));
  solutions = xs(:) + i*ys(:);
  select = 1:numel(xs);
  niters = NITER*ones(numel(xs), 1);

  for iteration = 1:NITER
    oldi = solutions(select);
    h = zeros(numel(oldi),1) + i*zeros(numel(oldi),1);
    parfor j = 1:numel(oldi)
      dd = - fprime(oldi(j))\f(oldi(j))';
      h(j) = dd(1) + dd(2)*i;
    end
    solutions(select) = oldi + h;
    
    differ = (oldi - solutions(select));
    converged = abs(differ) < threshold;
    problematic = isnan(differ);
    
    niters(select(converged)) = iteration;
    niters(select(problematic)) = NITER+1;
    select(converged | problematic) = [];
  end
  
  niters = reshape(niters,size(xs));
  solutions = reshape(solutions,size(xs));
  
function res = f(z)
%  x = real(z);
%  y = imag(z);
  x = [real(z) imag(z)];
%  res = [(x(1).^2).*x(1)-3*x(1)*(x(2).^2)-1, 3*(x(1).^2)*x(2)-(x(2).^2).*x(2)];
%  res = [x(1).^2 - x(2), x(2).^2 - x(1)];
%  res = [( x*x - 9 ) * y, ( y*y - 4 ) * x];
  res = [(x(1).^2).*x(1)-3*x(1)*(x(2).^2)-1-x(1), 3*(x(1).^2)*x(2)-(x(2).^2).*x(2)];
%  res = [x(1).^3 - x(2), x(2).^2 - x(1)];
%  res = [-3*x(1)*(x(2).^2)-1, 3*(x(1).^2)*x(2)-(x(2).^2).*x(2)];
    
function res = fprime(z)
%  x = real(z);
%  y = imag(z);
  x = [real(z) imag(z)];
%  res = [ 3*x(1).^2 - 3*x(2).^2, -6*x(1)*x(2); 6*x(1)*x(2), 3*x(1).^2-3*x(2).^2];
%  res = [ 2*x(1), -1; -1, 2*x(2)];
%  res = [ 2*x*y, x*x - 9 ; y*y - 4, 2*y*x ];
  res = [ 3*x(1).^2 - 3*x(2).^2-1, -6*x(1)*x(2); 6*x(1)*x(2), 3*x(1).^2-3*x(2).^2];
%  res = [ 3*x(1)*x(1), -1; -1, 2*x(2)];
%  res = [ -3*x(2).^2, -6*x(1)*x(2); 6*x(1)*x(2), 3*x(1).^2-3*x(2).^2];
