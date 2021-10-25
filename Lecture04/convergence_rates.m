function r = convergence_rates(f, F, a, b, num_experiments)
% Estimates convergence rates for trapezoidal function using function f
% (with anti-derivative F) on interval [a, b], using num_experiments. Not
% the most elegant but works for us.
% 
% USAGE NOTE: Add folder with your trapezoidal function to path in order to 
% make this function work.
    n = zeros(num_experiments, 1);
    E = zeros(num_experiments, 1);
    r = zeros(num_experiments-1, 1);
    expected = F(b) - F(a);
    for ii = 1:num_experiments
        n(ii) = 2^ii;
        computed = trapezoidal(f, a, b, n(ii));
        error = abs(expected - computed);
        E(ii) = error;
        if ii > 1
            r(ii-1) = log( E(ii-1)/E(ii) )/log( n(ii-1)/n(ii) );
            r(ii-1) = round( r(ii-1), 2 ); % Truncate, two decimals
        end
    end
end