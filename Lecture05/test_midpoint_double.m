%% Very basic check of the integral - should return exact value of 1.
% Requires midpoint function in path in order to work
h = @(x, y) 1;
expected = 1;
result = midpoint_double(h, 0, 1, 1, 2, 2, 2);
diff = abs(result - expected);
tol = eps(expected * 1e2);
assert( diff < tol, 'Error in double integral evaluation')