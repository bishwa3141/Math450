% Function to evaluate the shape of basins of attractions
% for the Newton method on the plane
% Code by Tomasz Malisiewcz <tomasz@cmu.edu> at http://quantombone.blogspot.com/
% You can call this code from the CLI with
% matlab -nodesktop -nosplash -r "[n,s]=newtonBasinsComplex; imagesc(n)"
function [niters,solutions] = newtonBasinsComplex
%Tomasz Malisiewcz (tomasz@cmu.edu)
%http://quantombone.blogspot.com/
  NITER = 400;
  threshold = .001;

  [xs,ys] = meshgrid(linspace(-1,1,50), linspace(-1,1,50));
  solutions = xs(:) + i*ys(:);
  select = 1:numel(xs);
  niters = NITER*ones(numel(xs), 1);

  for iteration = 1:NITER
    oldi = solutions(select);

%in newton's method we have z_{i+1} = z_i - f(z_i) / f'(z_i)
    h = - f(oldi) ./ fprime(oldi);
    solutions(select) = oldi + h;
    
%check for convergence or NaN (division by zero)
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
%  res = (z.^2).*z - 2*z + 2;
  res = (z.^2).*z - 1;
    
function res = fprime(z)
%  res = 3*z.^2 - 2;
  res = 3*z.^2;
