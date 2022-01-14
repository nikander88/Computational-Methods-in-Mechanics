clear all;close all;clc;

%Starting values
omega = 2;
P = 2*pi/omega;
dt = P/20; 
T = 40*P;
N_t = floor(round(T/dt));
t = linspace(0, N_t*dt, N_t);
fprintf('N_t: %d\n', N_t);

u = zeros(N_t, 1);
v = zeros(N_t, 1);

% Initial condition
X_0 = 2;
u(1) = X_0;
v(1) = 0;

% Calculating the values using backward euler scheme
for n = 2:N_t
    u(n) = u(n-1)+v(n);
    v(n) = v(n-1) - dt * omega^2 * u(n);
    u(n) = u(n-1)+v(n);
end

% Plotting the numerical and exact solution
N4l = floor(round(P/dt));
true_sol = X_0*cos(omega*t);
plot(t(length(t)-N4l:end), u(length(u)-N4l:end), 'b-')
hold on
plot(t(length(t)-N4l:end), true_sol(length(true_sol)-N4l:end),'r--');
legend('numerical', 'exact')
