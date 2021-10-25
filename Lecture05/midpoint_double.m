function I = midpoint_double(f, a, b, c, d, nx, ny)
% Computes double integral using midpoint rule.
%   f - handler to the function with two arguments
%   a, b - lower and upper boundaries of the outer integral interval
%   c, d - lower and upper boundaries of the inner integral interval
%   nx, ny - number of intervals for, respectively, outer and inner integral
% USAGE NOTE: Add folder with your midpoint function to path in order to 
% make this function work.
    g = @(x) midpoint(@(y) f(x, y), c, d, ny);
    I = midpoint(g, a, b, nx);
end
