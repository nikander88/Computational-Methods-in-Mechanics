% test polyarea function

% first test with tringle
x = [0, 0, 1];
y = [0, 1, 1];
% its area is 0.5
fprintf('Triangle area should be 0.5: %f\n', ...
    polyarea2(x, y));

% some quadlilateral (trapezoid)
x = [0, 0, 1, 1];
y = [0, 1, 0.75, 0.25];
% its area is 0.5*1*(1+0.5) = 0.75
fprintf('Trapezoid area should be 0.75: %f\n', ...
    polyarea2(x, y));

% some pentagon - add triangle at the top of above trapezoid
x = [0, 0, 1, 3, 1];
y = [0, 1, 0.75, 0.5, 0.25];
% Now its area should be 0.75 + 0.5*2*0.5 = 1.25
fprintf('Pentagon area should be 1.25: %f\n', ...
    polyarea2(x, y));

plot([y y(1)], [x, x(1)], 'o-')
axis([-0.25, 1.25, -0.25, 3.25])
xticks(0:0.25:1)
print('polygon_area', '-dmeta')