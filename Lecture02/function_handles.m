% Function handles and anonymous functions

f = @computeSquare; % handle to function
b = f(4)    % call using handle
b = computeSquare(4)    % call using handle
q = integral(f,0,1) % function handle as argument
q = integral(@computeSquare,0,1); % function handle as argument

e = 2;
sqr = @(n) n.^e; % anonymous functions store variables
% e = 1;
% sqr(4)
q = integral(sqr,0,1) % use anonymous function as argument

function y = computeSquare(x)
    y = x.^2;
end