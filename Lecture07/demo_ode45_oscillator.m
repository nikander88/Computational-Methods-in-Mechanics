% u stores position; velocity
om0 = 2;
% Function that returns u prime -> velocity; acceleration
f_osc = @(t, u) [u(2); -om0 ^ 2 * u(1)];
T0 = 2 * pi / om0;
tspan = [0, 200 * T0];
u0 = [2; 0];

opts = odeset('AbsTol', 1e-12, 'RelTol', 1e-9);

[t, y] = ode45(f_osc, tspan, u0, opts);

y_exact = 2 * cos(om0 * t);
plot(t, y(:, 1), t, y_exact, '--');