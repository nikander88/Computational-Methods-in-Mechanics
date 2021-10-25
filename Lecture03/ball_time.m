% Compute when ball hits the ground (that is when its vertical position
% will change sign from positive to negative).

v0 = 4.5;
g = 9.81;
t = linspace(0, 1, 1001);

y = v0*t - 0.5*g*t.^2;

ii = 1;
while y(ii) >= 0
    ii = ii + 1;
end

% Having the index, we may look up the time in the array t
fprintf('The time (switch from positive to negative): %f\n', t(ii));