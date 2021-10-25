
N = input('Provide series size for pi approximation:');

pi_Euler = zeros(1, N);
pi_Leibniz = zeros(1, N);

x_Euler = 0;
x_Leibniz = 0;

for ii = 1 : N
    % Leibniz part
    k = ii - 1;
    x_Leibniz = x_Leibniz + 1 ./ (4 * k + 1) ./ (4 * k + 3);
    pi_Leibniz(ii) = 8 * x_Leibniz;
    % Euler part 
    x_Euler = x_Euler + 1 ./ ii ^ 2;
    pi_Euler(ii) = sqrt(6 * x_Euler);
end

pi_err_Leibniz = abs(pi - pi_Leibniz);
pi_err_Euler = abs(pi - pi_Euler);

plot(1:N, pi_err_Leibniz, 1:N, pi_err_Euler);
xlabel('Number of iterations N')
ylabel('Error in pi approx.')
legend('Leibniz', 'Euler')

fprintf('Pi error for Leibniz: %g, for Euler: %g\n', ...
    pi_err_Leibniz(end), pi_err_Euler(end));