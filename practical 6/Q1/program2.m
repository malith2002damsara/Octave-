a = linspace(-8, 8, 10)';
b = a;
[xx, yy] = meshgrid(a, b);
c = sqrt(xx.^2 + yy.^2) + eps;
d = sin(c)./c;
surf(xx, yy, d);
saveas(gcf, '02_22000275.png');
