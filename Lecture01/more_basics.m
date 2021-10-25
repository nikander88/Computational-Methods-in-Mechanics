% Some more basics with arrays (matrices) in matlab

a = [1 2 3; 4 5 6; 7 8 10]; % Creates 3x3 matrix
a + 10  % adds 10 to each matrix element
sin(a') % computes sin for each element of transposed a
format long % output numbers with more decimals
p = a * inv(a) % check if you get identity
format short % back to default display format
A = [a, a] % get 3x6 matrix
A = [a; a] % get 6x3 matrix
whos % display workspace variables
clc % clears command window
clear % clear workspace