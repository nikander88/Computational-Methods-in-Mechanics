% Reads radius and prints circumference and area of the circle. Using
% functions in separate files.

r = input('Give me a radius: ');

C = circumference(r);
A = circle_area(r);

fprintf('Radius: %g, circum.: %g, area: %g\n', ...
    r, C, A)