% Simple algorithm to get the heighest vertical position of the ball thrown
% up in the air. Uses basic for loop.

v0 = 5;
g = 9.81;
t = linspace(0, 1, 1001);

y = v0*t - 0.5*g*t.^2;

largest_height = y(1);  % Initial value
for ii = 2:length(y)
    if y(ii) > largest_height
        largest_height = y(ii);
    end
end

fprintf('The largest height achieved was %f m \n',largest_height);

plot(t, y) % Plot to verify
xlabel('t [s]')
ylabel('y [m]')