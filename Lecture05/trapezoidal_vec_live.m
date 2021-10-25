function integral = trapezoidal_vec_live(f, a, b, n)
% Function to compute approximation of integrals using composite
% trapezoidal method
h = ( b - a ) / n;

% integral = 0.5 * ( f(a) + f(b) );
% 
% % x = a + (1:n-1)*h;
% x = linspace(a + h, b - h, n - 1);
% y = f(x);
% integral = integral + sum(y);
% % for ii = 1:n-1
% %     integral = integral + f();
% % end

x = linspace(a, b, n + 1);
y = f(x);
integral = sum(y) - 0.5 * (y(1) + y(end));

integral = h * integral;