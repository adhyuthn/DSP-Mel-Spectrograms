function X = mydft(x)
    N = length(x);
    % disp(mod(N,2));

    if N == 1
        X = x;
        return;
    end
    % disp(length(x))
    % disp(2^nextpow2(201));
    if 2^nextpow2(length(x)-1) - length(x) ~= 0
        x=[x,zeros(1,2^nextpow2(length(x))-length(x))];
    end

    N = length(x)
    % Split the DFT into two summations
    X_even = myfft(x(1:2:end));
    X_odd = myfft(x(2:2:end));
    
    % Combine the results of the two halves
    for k = 0:N/2-1
        % Compute the twiddle factor
        w = exp(-2i * pi * k / N);
        
        % Combine the even and odd halves
        X(k+1) = X_even(k+1) + w .* X_odd(k+1);
        X(k+1+N/2) = X_even(k+1) - w .* X_odd(k+1);
    end
end