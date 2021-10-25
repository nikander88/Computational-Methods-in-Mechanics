% Script to make a VERY basic test of the trapezoidal rule. Code can pass
% this test even when function trapezoidal contains errors!

f = @(t) 3*t*t*exp(t^3);
a = 0;
b = 1;
n = 1e6;

approx = trapezoidal(f, a, b, n);

V = @(t)exp(t^3) - 1;

exact = V(b) - V(a);

fprintf('%.8f, %.8f\n', approx, exact)