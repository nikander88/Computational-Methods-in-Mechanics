% Why not to use crytic names and hidden side effects.

b = 1; c = 7;
a = f1(b);
d = f2(c);
disp([a, b, c, d])
function d = f2(e)
    global c
    c = 1;
    d = f1(e) + c;
%     d = c + f1(e);
    d = d + e;
end
function a = f1(b)
    global c
    c = 12;
    b = b + 2;
    a = b * 2;
end
