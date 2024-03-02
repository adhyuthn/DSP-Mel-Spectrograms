function y = myfftshift(x)
    n = length(x);
    mid = length(x)/2;
    y(1:mid) = x(mid+1:n);
    y(mid+1:n) = x(1:mid);
end