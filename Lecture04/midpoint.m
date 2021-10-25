function result_integration = midpoint(f, a, b, n)
% Function to compute integral approximation using midpoint rule
    h = (b - a)/n;
    result = 0;
    for xi = (a + h/2) + h*(0:n-1)
        result = result + f(xi);
    end
    result_integration = h*result;
end