niter=400;
%rez = 1000;
rez = 3000;
N=1;
%xmin=-N;
%xmax= N;
%ymin=-N;
%ymax= N;
xmin=-.35;
xmax=-.15;
ymin=-.85;
ymax=-.65;
[n,s] = newtonBasinsReal(xmin,xmax,ymin,ymax,rez,niter);
figure
image(n)
%imagesc(n)
%title({'Newton Fractal for the function';'f(x,y)=(x^3-3xy^2-x-1,3y^2x-y^3+y)'});
title({'Newton Fractal for the function';'f(x,y)=(x^2-y,y^2-x)'});
xticklabels = xmin:(xmax-xmin)/10:xmax;
xticks = linspace(1, rez, numel(xticklabels));
yticklabels = ymin:(ymax-ymin)/10:ymax;
yticks = linspace(1, rez, numel(yticklabels));
%set(gca, 'XTick', xticks, 'XTickLabel', xticklabels, 'YTick', yticks, 'YTickLabel', yticklabels,'YDir','normal')
set(gca, 'XTick', xticks, 'XTickLabel', xticklabels, 'YTick', yticks, 'YTickLabel', yticklabels)
