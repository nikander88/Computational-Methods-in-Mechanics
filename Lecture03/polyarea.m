function A = polyarea(x, y)
% Function to compute polygon area based on 
% vectors of coordinates x and y according to proper 
% formula

% check if vector sizes match
if ~isvector(x) || ~isvector(y)
    error('x or y is not a vector')
end
n = length(x);
if n ~= length(y)
    error('x and y has different lenghts')
end

% final elements
A = x(n)*y(1) - y(n)*x(1);
for ii = 1:n-1
    A = A + x(ii)*y(ii + 1) - y(ii)*x(ii + 1);
end
A = 0.5 * abs(A);