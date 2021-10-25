r = 10.6;
a = 1.3;
area_circle = pi * r * r;

b = 265;
while a * b < area_circle
    b = b + 1;
end

% equivalent
b = 1;
while true
    if a * b < area_circle
        b = b + 1;
    else
        break;
    end
end

b = b - 1;
disp(b)