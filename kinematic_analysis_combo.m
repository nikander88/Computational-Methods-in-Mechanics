%%
clc; close all; clear all;
syms x;
a = 0.1; b = 0.2; sigma = deg2rad(30); w = 1;

epsilon = 0.001; %Tolerance
x0 = input('Enter the starting value:');

f=a*sin(sigma)-b*sin(x); %Function for  solving 𝜃
omega = newton_rhapson(f, x0, epsilon); %Solving 𝜃 with newton rhapson

f2 = a*cos(sigma)+b*cos(omega)-x; %Function for  solving d
d = newton_rhapson(f2, x0, epsilon); %Solving d with newton rhapson

f_dot = a*w*cos(sigma)-b*x*cos(omega); %Function for  solving 𝜃'
omega_dot = newton_rhapson(f_dot, x0, epsilon); %Solving 𝜃' with newton rhapson

f2_dot = -a*w*sin(sigma)-b*omega_dot*b*sin(omega)-x; %Function for  solving d'
d_dot = newton_rhapson(f2_dot, x0, epsilon); %Solving d' with newton rhapson

fprintf('The value of 𝜃 is: %f \n',omega);
fprintf('The value of d is: %f \n',d);
fprintf('The value of 𝜃_dot is: %f rad/s \n',omega_dot);
fprintf('The value of d_dot is: %f m/s \n',d_dot);


%%
clc; close all; clear all;
syms x;
d = []; omega_dot = []; d_dot = [];
a = 0.1; b = 0.2; sigma = deg2rad(30); w = 1;
t = linspace(0,1,101);
omega = pi/6+w*t;

%Defining functions for d and 𝜃'
f=a*cos(sigma)+b*cos(omega)-x;
f_dot = a*w*cos(sigma)-b*x*cos(omega);

epsilon = 0.0001;
x0 = input('Enter the starting value:');

%For loop that uses newton rhapson to get values for d and 𝜃'
for i = 1:length(t)
    d(i) = newton_rhapson(f(i), x0, epsilon);
    omega_dot(i) = newton_rhapson(f_dot(i), x0, epsilon);
end

f2_dot = -a.*w.*sin(sigma)-b.*omega_dot.*b.*sin(omega)-x; %Defining function for d'
for i = 1:length(t) %For loop that uses newton rhapson to get values for d'
    d_dot(i) = newton_rhapson(f2_dot(i), x0, epsilon);
end

plot(t, d, t, omega, t, omega_dot, t, d_dot) %Plot of the results
legend('displacement d','angle 𝜃', 'Angular velocity of 𝜃 (rad/s)', 'Velocity of d (m/s)')


%%
%The Newton Raphson Method
function y = newton_rhapson(f, x0, epsilon)
    syms x
    g=diff(f); %Derivative of the function
    for i=1:100
     f0=vpa(subs(f,x,x0)); %Calculating the value of function at x0
     f0_der=vpa(subs(g,x,x0)); %Calculating the value of function derivative at x0
     y=x0-f0/f0_der; % The Newton Rhapson Formula
     err=abs(y-x0); % Calculates the error
     if err<epsilon %checking the amount of error at each iteration
        break
     end
     x0=y;
    end
end