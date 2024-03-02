function X = myfft(x)
    
    N = length(x);
    if N == 1
        X = x;
        return;
    end

    if 2^nextpow2(length(x)-1) - length(x) ~= 0
        x=[x,zeros(1,2^nextpow2(length(x))-length(x))];
    end

    N = length(x);
    X_even = myfft(x(1:2:end));
    X_odd = myfft(x(2:2:end));
    
    for k = 0:N/2-1
        w = exp(-2i * pi * k / N);
        X(k+1) = X_even(k+1) + w .* X_odd(k+1);
        X(k+1+N/2) = X_even(k+1) - w .* X_odd(k+1);
    end
end