v0 = 5; % initial velocity
g = 9.81; % gravitational acceleration

t = linspace(0, 1, 1001);

y = v0 .* t - 0.5 .* g .* t .^ 2; % height

plot(t, y)
xlabel('Time [s]')
ylabel('Height [m]')