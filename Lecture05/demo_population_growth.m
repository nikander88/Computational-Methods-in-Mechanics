% Simple example for population growth. Uses fixed parameters and creates
% simple plot. Uses ode_FE general solver.
function demo_population_growth()
    % Test case: u’ = r*u, u(0)=100
    function r = f(~, u)
        r = 0.1*(1 - u / 500) .* u;
    end
    [t, u] = ode_FE(@f, [0.5, 60], 100);
    plot(t, u, t, 100*exp(0.1*t));
    xlabel('t'); ylabel('N(t)');
    legend('numerical', 'exact', 'location', 'northwest');
end