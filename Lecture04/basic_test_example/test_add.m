% Test file brief description:
% 1. The name of the file with tests should start with test_ - just like 
% this file.
% 2. Each test should be written in separate section (that is part of the
% file starting with %% sign in the beginning of the line)
% 3. Test checks are done with assert method. If assert condition is true
% (first argument) than nothing happens and test execution continues. If
% test fails, optional message is displayed. Note that single test (file
% section denoted with %%) may have multiple assert statements.
% 4. After that you can execute runtests command in Matlab command window.
% Remember to run this command in directory with your test files. Also
% check if the number of tests is as you have expected.


%% Test add function with two integers
expected = 2; % result of 1 + 1
computed = add(1, 1);
assert(isscalar(computed), 'Add result must be scalar')
assert(computed == expected, '1+1=%g', computed);

%% Test by adding 0.1 and 0.2
expected = 0.3;
computed = add(0.1, 0.2);
tol = 10 * eps(expected);
diff = abs(expected - computed);
assert(diff < tol, 'diff=%g', diff);
