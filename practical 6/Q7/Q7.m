radius = 5;

center = [0, 0];

theta = linspace(0, 2*pi, 100);
x = center(1) + radius * cos(theta);
y = center(2) + radius * sin(theta);

figure;
plot(x, y, 'b', 'LineWidth', 2);
axis equal;
xlim([-radius-1, radius+1]);
ylim([-radius-1, radius+1]);
title('Perfect Circle');

filename = 'Malith_Damsara_22000275.png';
saveas(gcf, filename);

