clear all;close all;clc;

% The function defined
f = @(u, t) 0.1*(1 - u/500)*u;

% Stating values
k = 0; T = 60; U_0 = 100; d_t = 20;

% Plotting the first solution when k = 0 
dt = 2^-k*d_t;
[u, t] = ode_FE(f, U_0, dt, T);
plot(t, u, 'r-');
xlabel('t');  ylabel('N(t)');
hold on

% Plotting the second solution when k = 1 
dt = 2^-(k+1)*d_t;
[u, t] = ode_FE(f, U_0, dt, T);
plot(t, u, 'b-');
xlabel('t');  ylabel('N(t)');
legend('K+1', 'K')
k = k+1;

% Asks the user if the plots are similar enough and if they aren't then
% it increases the value of k by 1 until the plots are good enough
while 1
    prompt = 'Are the plots similar enough? Y/N: ';
    answer = input(prompt, 's');
    
    if answer == 'Y'
        break

    else
        close all;
        dt = 2^-k*d_t;
        [u, t] = ode_FE(f, U_0, dt, T);
        plot(t, u, 'r-');
        xlabel('t');  ylabel('N(t)');
        hold on
        
        dt = 2^-(k+1)*d_t;
        [u, t] = ode_FE(f, U_0, dt, T);
        plot(t, u, 'b-');
        xlabel('t');  ylabel('N(t)');
        legend('K+1', 'K')
    
        k = k + 1;
        fprintf('The value of K is %d\n', k)
    end
end

fprintf('You did %d loops', k-1)


