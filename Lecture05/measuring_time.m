% Simple script showing how to use timeit function.
%
% Script requires directory with midpoint script in path in order to work

v_vec = @(t) 3.*t.^2.*exp(t.^3);
v = @(t) 3*t^2*exp(t^3);
n = 1e5;
a = 0; b = 1;

time_fun_1 = @() midpoint_vec_live(v_vec, a, b, n);
timeit(time_fun_1)

time_fun_2 = @() midpoint_live(v_vec, a, b, n);
timeit(time_fun_2)

time_fun_3 = @() midpoint_live(v, a, b, n);
timeit(time_fun_3)
