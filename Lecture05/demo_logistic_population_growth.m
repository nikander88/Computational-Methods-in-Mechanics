% Example of logistic population growth. Uses fixed parameters and creates
% comparison plot. Uses ode_FE general solver.
function demo_logistic_population_growth()
    M = 500;
    r_bar = 0.1;
    % Vector function that return (1) basic growth model (2) logistic
    % population. U contains [N_basic_population_size;
    % N_logistic_population_size]
    function up = f(~, u)
        up = zeros(size(u));
        % Population growth with constant r
        up(1) = r_bar * u(1);
        % Logistic population growth
        r = r_bar * (1 - u(2) / M);
        up(2) = r * u(2);
    end
    U0 = [100; 100];
    dt = 0.5;
    T = 60;
    [t, u] = ode_FE(@f, [dt, T], U0);
    subplot(2,1,1);
    plot(t, u);
    xlabel('t'); ylabel('N(t)');
    legend('Basic growth', 'Logistic growth', 'location', 'northwest');
    subplot(2,1,2);
    plot(t, u);
    xlabel('t'); ylabel('N(t)');
    legend('Basic growth', 'Logistic growth', 'location', 'se');
    ylim([0, M])
end