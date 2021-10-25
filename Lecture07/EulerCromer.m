function [t, u, v] = EulerCromer(c_f, k_f, F, m, T, U_0, V_0, dt)
%EULERCROMER Solves ODE system using semi-implicit Euler method
%   c_f - velocity function (damping force)
%   k_s - displacement function ("spring" force)
%   F - external (environmental) force
%   m - mass of the system
%   T - final time
%   U_0 - initial displacement
%   V_0 - initial velocity
%   dt - time step
%   As an output function returns
%   t - time vector from 0 to T
%   u - displacements associated with t
%   v - velocities associated with t
N_t = floor(round(T/dt));
fprintf('N_t: %d\n', N_t);
t = linspace(0, N_t*dt, N_t+1);
u = zeros(N_t+1,1);
v = zeros(N_t+1,1);
% Initial conditions
u(1) = U_0;
v(1) = V_0;
% Step equations forward in time
for n = 1:N_t
    v(n+1) = v(n) + dt*(1/m)*(F(t(n)) - c_f(v(n)) - k_f(u(n)));
    u(n+1) = u(n) + dt*v(n+1);
end
end

