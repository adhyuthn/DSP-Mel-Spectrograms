n = 1:8;
x_n = cos(n) + 1j * sin(n);
x_n_e = 0.5 * (x_n + conj(x_n));
x_n_o = 0.5 * (x_n - conj(x_n));

X_k_e = dft(x_n_e);
X_k_o = dft(x_n_o);

X_k_1 = dft(x_n)
X_k_2 = X_k_e + X_k_o

figure('Name', 'Without decomposition')
subplot(2,1,1);
stem(abs(X_k_1));
title('Magnitude Plot')
subplot(2,1,2);
stem(angle(X_k_1));
title('Phase Plot')

figure('Name', 'With decomposition')
subplot(2,1,1);
stem(abs(X_k_2));
title('Magnitude Plot')
subplot(2,1,2);
stem(angle(X_k_2));
title('Phase Plot')