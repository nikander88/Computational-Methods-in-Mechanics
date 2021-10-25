function A = insertion_sort(A)
% Based on pseudocode from wiki:
% https://en.wikipedia.org/wiki/Insertion_sort
i = 2;
while i <= length(A)
    x = A(i);
    j = i - 1;
    while j > 0 && A(j) > x
        A(j+1) = A(j);
        j = j - 1;
    end
    A(j+1) = x;
    i = i + 1;
end