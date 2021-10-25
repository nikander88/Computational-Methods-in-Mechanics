function approximate_pi_vectorized(N)
% Compute pi approximation using two series - one proposed by Euler and one
% by leibniz. Compute approximation of the solution evolution and plots
% results.

x = 1:N; % pre-generate series elements

% pi sum by Leibniz (L)
sum_elements_L = 8./( 4*x - 3 )./ ( 4*x - 1 );
pi_by_L = cumsum(sum_elements_L);

% pi sum by Euler (E)
sum_elements_E = 6 ./ x.^2;
pi_by_E = sqrt( cumsum( sum_elements_E ) );

fprintf('After %d iters - pi by Leibniz=%g, pi by Euler=%g\n', N, pi_by_L(N), ...
    pi_by_E(N))

plot(x, abs(pi - pi_by_L), x, abs(pi - pi_by_E))
legend('\pi by Leibniz', '\pi by Euler')
xlabel('Iteration')
ylabel('Error w.r.t. \pi')