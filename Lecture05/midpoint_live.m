function result_integration = midpoint_live(f, a, b, n)
% Function to compute integral approximation using midpoint rule
    h = (b - a)/n;
    
%     x = (a + h/2) + h*(0:n-1);
%     y = f(x);
%     result = sum(y);
    
    result = 0;
    for xi = (a + h/2) + h*(0:n-1)
        result = result + f(xi);
    end
    
    result_integration = h*result;
end