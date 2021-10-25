%% 
t = [1, 1.55, 2.1];
y = t .* sin(t);

fprintf('%5g %5.2g\n', [t; y])

%% 

x = pi; 
y = 2;

fprintf('Multiplying %.6g and %d gives %.3f\n', x, y, x*y)