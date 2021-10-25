% Special case implementation of a simple oscillator simulation using
% first-order Forward Euler solver. Even with small time steps solution 
% amplitude is increasing.

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
    v(n+1) = v(n) - dt*omega0^2*u(n);
end
figure
plot(t, u, 'b-', t, X_0*cos(omega0*t), 'r--');
legend('numerical', 'exact', 'Location','northwest');
title(sprintf('Displacements FE dt %g, tk %f', dt, tk))
xlabel('t [s]');
% print('tmp', '-dpdf'); print('tmp', '-dpng');