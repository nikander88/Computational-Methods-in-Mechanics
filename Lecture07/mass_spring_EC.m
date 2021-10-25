% More typical implementation of the Euler-Cromer method (semi-implicit
% Euler) where the first is velocity equation. Solution is slightly
% different that the one in "FE_fix", but accuracy is the same.

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
    v(n+1) = v(n) - dt*omega0^2*u(n);
    u(n+1) = u(n) + dt*v(n+1);
end
figure
plot(t, u, 'b-', t, X_0*cos(omega0*t), 'r--');
legend('numerical', 'exact', 'Location','northwest');
title(sprintf('Displacements EC dt %g, tk %f', dt, tk))
xlabel('t [s]');
% print('tmp', '-dpdf'); print('tmp', '-dpng');