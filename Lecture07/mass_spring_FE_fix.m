% Almost the same code as in pure FE version, but with almost "magic" fix.
% In the loop below in second equation u(n+1) is used instead of u(n). This
% results in Semi-implicit Euler method, that is far more effective for
% considered system.

omega0 = 2;

% Initial condition
X_0 = 2;

T0 = 2*pi/omega0;
dt = T0/20;
tk = 3*T0;

N_t = floor(tk/dt);
t = linspace(0, N_t*dt, N_t+1);
u = zeros(N_t+1, 1);
v = zeros(N_t+1, 1);
u(1) = X_0;
v(1) = 0;

% Step equations forward in time
for n = 1:N_t
    u(n+1) = u(n) + dt*v(n);
    v(n+1) = v(n) - dt*omega0^2*u(n+1);
end
figure
plot(t, u, 'b-', t, X_0*cos(omega0*t), 'r--');
legend('numerical', 'exact', 'Location','northwest');
title(sprintf('Displacements FE fix dt %g, tk %f', dt, tk))
xlabel('t [s]');
% print('tmp', '-dpdf'); print('tmp', '-dpng');