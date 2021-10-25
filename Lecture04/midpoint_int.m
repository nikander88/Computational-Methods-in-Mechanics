function integral = midpoint_int(f, a, b, n)
%MIDPOINT_INT Computes integral of function f over interval [a, b] using
%n intervals

h = (b - a) / n;
x = linspace(a + 0.5 * h, b - 0.5 * h, n);
integral = 0;

for ii = 1 : n
    integral = integral + f(x(ii));
end

integral = integral * h;