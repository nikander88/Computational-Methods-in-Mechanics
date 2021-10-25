%% test ode FE with hand made computation
f = @(t, u) u;
dt = 1;
U_0 = 1;
T = 3*dt;
expected = [U_0, 2, 4, 8]';
expected = [expected expected];
expected_time = (0:dt:T)';
tol = eps(1e2);

[time, sol] = ode_FE(f, [dt, T], [U_0; U_0]);
assert(isequal(size(sol), size(expected)), "Unexpected solution vector size [%s], should be [%s]",...
    num2str(size(sol)), num2str(size(expected)))
assert(isequal([size(sol, 1), 1], size(time)), "Solution and time sized does not match")
assert(max(max(abs(sol - expected))) < tol, "Forward Euler solution is inaccurate")
assert(max(abs(time - expected_time)) < tol, "Forward Euler time vector is incorrect")

%% Second ode_FE test - population growth compared with known exact solution
r1 = 0.1234;
r2 = 0.4321;
dt = 0.336;
U_0 = 5.64;
n = 46;
T = n * dt;
f = @(t, u) [r1; r2] .* u;
expected_time = (0:dt:T)';
expected = [U_0 * (1 + r1 * dt).^(0:n)'  U_0 * (1 + r2 * dt).^(0:n)'];
tol = eps()*1e5;

[time, sol] = ode_FE(f, [dt, T], [U_0; U_0]);
assert(isequal(size(sol), size(expected)), "Unexpected solution vector size [%s], should be [%s]",...
    num2str(size(sol)), num2str(size(expected)))
assert(isequal([size(sol, 1), 1], size(time)), "Solution and time sized does not match")
assert(max(max(abs(sol - expected))) < tol, "Forward Euler solution is inaccurate")
assert(max(abs(time - expected_time)) < tol, "Forward Euler time vector is incorrect")

%% Third ode_FE test - linear solution
% test parameters
% solution is linear in time: a * t + b
a = 178.32;
b = 1263461.4167;
k = 46.5215;
m = 4;
dt = 0.1;
T = 3.2;

f = @(t, u) a + k * (u - (a * t + b)) .^ m;
[time, sol] = ode_FE(f, [dt, T], b);

expected_time = (0:dt:T)';
expected_sol = a * expected_time + b;

tol = eps(1e3 * b);
assert(max(max(abs(sol - expected_sol))) < tol, "Forward Euler solution is inaccurate")
assert(max(abs(time - expected_time)) < tol, "Forward Euler time vector is incorrect")