%% Compare one hand-computed result
v = @(t) 3*(t^2)*exp(t^3);
n = 2;
computed = trapezoidal(v, 0, 1, n);
expected = 2.463642041244344;
error = abs(expected - computed);
tol = eps(expected) * 1e3;
assert(error < tol, 'error=%g > tol=%g', error, tol);

%% Check that linear functions are integrated exactly
f = @(x) 6*x - 4;
F = @(x) 3*x^2 - 4*x; % Anti-derivative
a = 1.2; b = 4.4;
expected = F(b) - F(a);
tol = eps(expected) * 10;
for n = [2 20 21]
    computed = trapezoidal(f, a, b, n);
    error = abs(expected - computed);
    assert(error < tol, 'n=%d, err=%g', n, error);
end

%% Check empirical convergence rates against the expected -2.
v = @(t) 3*(t^2)*exp(t^3);
V = @(t) exp(t^3);
a = 1.1; b = 1.9;
num_experiments = 14;
r = convergence_rates(v, V, a, b, num_experiments);
tol = 1.1e-2;
% we knew first 4 convergence rates are not so great but 4th one differs by
% about 0.01
start_idx = 4;
error = abs(r(start_idx:end) + 2);
[max_err, err_idx] = max(error);
assert(all(error < tol), 'Max error %f for i=%d',...
    max_err, err_idx + start_idx - 1);