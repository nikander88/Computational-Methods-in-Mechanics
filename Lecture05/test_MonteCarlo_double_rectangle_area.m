%% Check the area of a rectangle.
g = @(x, y) -1 + 2*(0 <= x && x <= 2 && 3 <= y && y <= 4.5);
x0 = 0; x1 = 3; y0 = 2; y1 = 5; % embedded rectangle
n = 1000;
rng(8); % must fix the seed!
I_expected = 3.121092; % computed with this seed
I_computed = MonteCarlo_double(@(x,y) 1, g, x0, x1, y0, y1, n);
assert(abs(I_expected - I_computed) < 1e-14);

%% Check the integral of r over a circle with radius 2.
% Circle dimentions
xc = 0; yc = 0; % center
R = 2; % radius
% Is point inside circle?
g = @(x, y) R^2 - ((x-xc)^2 + (y-yc)^2);

% % Exact: integral of r*r*dr over circle with radius R becomes
% % 2*pi*1/3*R^3
% syms r;
% I_exact = int(@(r) 2*pi*r*r, r, 0, 2);
% fprintf('Exact integral: %g\n', I_exact);
x0 = -R; x1 = R; y0 = -R; y1 = R;
n = 1000;
rng(6); % must fix the seed!
I_expected = 16.797083711737638; % Computed with this seed
I_computed = MonteCarlo_double(...
    @(x, y) sqrt(x^2 + y^2), g, x0, x1, y0, y1, n);
fprintf('MC approximation (%d samples): %.16f', n^2, I_computed);
assert(abs(I_computed - I_expected) < 1E-15);
