function result_integration = midpoint_vec(f, a, b, n)
% Vectorized version of the midpoint function header like to standard one -
% integrates function f over the interval [a, b] using n points.
    h = (b-a)/n;
    x = linspace(a + h/2, b - h/2, n);
    result_integration = h*sum(f(x));
end