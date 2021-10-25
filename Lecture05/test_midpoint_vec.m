%% Basic check of the vectorized implementation of the midpoint
% To work add to path folder with midpoint function
% Assumes midpoint works and was tested good enough!
% So it would be best not to rely on midpoint (and, e.g. run all midpoint
% tests on midpoint_vec)!

v = @(t) 3.*t.^2.*exp(t.^3);
a = -0.1;
b = 1.2;
n = [10, 20, 31];
tol = eps(1e3);
for in = n
    res_vec = midpoint_vec(v, a, b, in);
    res_scalar = midpoint(v, a, b, in);
    diff = abs(res_vec - res_scalar);
    assert(diff < tol, 'Error when computing integral for %d points\n', in);
end
