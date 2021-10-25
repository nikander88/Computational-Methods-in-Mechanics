A = rand(10,20);
largest_number = -Inf; % initialize
 for ii = 1:size(A, 1)
    for jj = 1:size(A, 2)
        if A(ii, jj) > largest_number
            largest_number = A(ii, jj);
        end
    end
end
% print and check
fprintf('A max is %f, max(max(A)) is %f\n', ...
    largest_number, max(max(A)))
