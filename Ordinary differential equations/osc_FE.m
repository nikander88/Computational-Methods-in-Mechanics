clear all;close all;clc;
% Starting values
omega = 2;
P = 2*pi/omega;
dt = P/20;
T = 3*P;
N_t = floor(T/dt);
t = linspace(0, N_t*dt, N_t+1);

u = zeros(N_t+1, 1);
v = zeros(N_t+1, 1);

% Initial condition
X_0 = 2;
u(1) = X_0;
v(1) = 0;

% Step equations forward in time and also calculates the total energy of
% the system
for n = 1:N_t
    u(n+1) = u(n) + dt*v(n);
    v(n+1) = v(n) - dt*omega^2*u(n);
    [potential_energy, kinetic_energy] = osc_energy(u, v, omega);
    all_energy(n+1) = potential_energy(n)+kinetic_energy(n);
end

% Plots teh numerical and exact solutions
plot(t, u, 'b-', t, X_0*cos(omega*t), 'r--');
legend('numerical', 'exact', 'Location','northwest');
xlabel('t');
hold on

%Plots the kinetic energy, potential energy and total energy of the system
plot(t, kinetic_energy*dt, 'g', t, potential_energy*dt)
plot(t, all_energy*dt)
legend('numerical', 'exact', 'kinetic energy', 'potential energy', 'total energy')

