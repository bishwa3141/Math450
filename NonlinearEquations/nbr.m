rez = 3000
xmin=-1;
xmax= 1;
ymin=-1;
ymax= 1;
[n,s] = newtonBasinsReal(xmin,xmax,ymin,ymax,rez);
figure
imagesc(n)
title({'Newton Fractal for the function';'f(x,y)=(x^3-3xy^2-x-1,3y^2x-y^3)'});
xticklabels = xmin:(xmax-xmin)/10:xmax;
xticks = linspace(1, rez, numel(xticklabels));
yticklabels = ymax:(ymin-ymax)/10:ymin;
yticks = linspace(1, rez, numel(yticklabels));
set(gca, 'XTick', xticks, 'XTickLabel', xticklabels, 'YTick', yticks, 'YTickLabel', yticklabels)


