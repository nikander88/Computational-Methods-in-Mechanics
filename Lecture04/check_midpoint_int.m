%% Check trapezoidal_int

v = @(t) 3 .* t.^2 .* exp(t.^3);
V = @(t) exp(t.^3) - 1;

a = 0;
b = 1;
n = 4;

midpoint_int(v, a, b, n)

%% a = 1.1;
% b = 2.3;
n = 1e3;

result = midpoint_int(v, a, b, n);
expected = V(b) - V(a);
disp([result, expected])