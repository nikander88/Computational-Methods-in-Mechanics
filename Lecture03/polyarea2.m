function A = polyarea2(x, y)
% x, y are vectors with vertices coefficients of equal length n
% A is area of that polygon

n = length(x);

if n <= 1
    A = 0;
    return
end

in_sum = x(n) * y(1) - y(n) * x(1);
for ii = 1 : n - 1
    in_sum = in_sum + x(ii) * y(ii + 1)...
        - y(ii) * x(ii + 1);
end

A = 0.5 * abs(in_sum);