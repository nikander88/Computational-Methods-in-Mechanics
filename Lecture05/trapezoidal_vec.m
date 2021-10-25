function integral = trapezoidal_vec(f, a, b, n)
h = (b - a) / n;
integral = 0.5 * (f(a) + f(b));

x = linspace(a + h, b - h, n - 1);
integral = integral + sum(f(x));

integral = integral * h;