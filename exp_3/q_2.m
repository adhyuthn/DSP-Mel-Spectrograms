n = 1:8;
h_n = zeros(1,8);
h_n(1) = 1;
x_n = 1:6;
m = length(h_n);
n = length(x_n);

if m>n
    x_n = [x_n, zeros(1, m-n)];
elseif n>m
    h_n = [h_n, zeros(1, m-n)];
end

x_n
h_n

X_k = dft(x_n);
H_k = dft(h_n);

Y_k = X_k .* H_k;
y_n_1 = idft(Y_k)


y_n_2 = conv(x_n, h_n)
y_n_1 = [y_n_1, zeros(1, length(y_n_2) - length(y_n_1))]
subplot(2,2,1)
stem(x_n)
title('x(n)')

subplot(2,2,2)
stem(h_n)
title('h(n)')
subplot(2,2,3);
stem(y_n_1)
title('Using IDFT')
subplot(2,2,4);
stem(y_n_2)
title('conv function')