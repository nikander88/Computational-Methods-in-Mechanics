n = 21;
allNumbers = 200 .* rand(1, n);
count = 0;

for ii = 1 : n
    if allNumbers(ii) > 100
        count = count + 1;
    end
end
disp(count)

% Can we solve this in one line?
sum(allNumbers > 100)
