function y = myfreqz(x)
    n=0:length(x)-1;
    k = linspace(-pi, pi, 1024);
    y= zeros(size(k));
    for i = 1:length(k)
       y(i) = sum(x .* exp(-1j * k(i) * n));
    end
    y = y(512:length(y)-1);
end