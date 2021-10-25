clear all;close all;clc;
f = @(u, t) 0.1*(1 - u/500)*u;
loop = 1;
U_0 = 50; % Initial y-value  
k = 1;
dt = 2^-k; % Time step size
T = 5; % Maximum y-value

[u, t] = ode_FE(f, U_0, dt, T);
plot(t, u, 'b-');
xlabel('t');  ylabel('N(t)');
hold on


dt = 2^-(k+1), T = 5;
[u, t] = ode_FE(f, U_0, dt, T);
plot(t, u, 'b-');
xlabel('t');  ylabel('N(t)');

%%
clear all;close all;clc;
f = @(u, t) 0.1*(1 - u/500)*u;

loop = 1; k = 0; T = 60; U_0 = 100;

while loop == 1
    prompt = 'Give 1 if the plots are not good enough: ';
    loop = input(prompt);
    fprintf('You gave %d\n', loop)
    close all;
    
    dt = 2^-k;
    [u, t] = ode_FE(f, U_0, dt, T);
    plot(t, u, 'r-');
    xlabel('t');  ylabel('N(t)');
    hold on
    
    dt = 2^-(k+1);
    [u, t] = ode_FE(f, U_0, dt, T);
    plot(t, u, 'b-');
    xlabel('t');  ylabel('N(t)');

    k = k + 1

end

