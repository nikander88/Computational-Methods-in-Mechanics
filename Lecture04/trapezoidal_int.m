function integral = trapezoidal_int(f, a, b, n)
%TRAPEZOIDAL_INT Computes integral of function f over interval [a, b] using
%n intervals

x = linspace(a, b, n + 1);
integral = 0.5 * (f(x(1)) + f(x(end)));

for ii = 2 : n
    integral = integral + f(x(ii));
end

h = (b - a) / n;
integral = integral * h;