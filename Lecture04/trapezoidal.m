function integral = trapezoidal(f, a, b, n)
% Function to compute approximation of integrals using composite
% trapezoidal method
h = ( b - a ) / n;

integral = 0.5 * ( f(a) + f(b) );

for ii = 1:n-1
    integral = integral + f(a + ii*h);
end

integral = h * integral;