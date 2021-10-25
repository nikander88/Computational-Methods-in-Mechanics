% Compare midpoint and trapezoidal methods on simple example.
% With nice formatting.
g = @(y) exp(-y^2);
a = 0;
b = 2;
fprintf('%7s %18s %18s %18s\n','n', 'midpoint   ', 'trapezoidal   ', 'difference   ');
for ii = 1:20
    n = 2^ii;
    m = midpoint(g, a, b, n);
    t = trapezoidal(g, a, b, n);
    fprintf('%7d %.16f %.16f %.16f\n', n, m, t, abs(t-m));
end
