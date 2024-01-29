n = 1:16;
k = 0:length(n) - 1;
x_n = cos(n) +  1j * sin(n);
x_n_e = 0.5 * (x_n + conj(flip(x_n)));
x_n_o = 0.5 * (x_n - conj(flip(x_n)));

X_k_e = dft(x_n_e);
X_k_o = dft(x_n_o);

X_k_1 = dft(x_n);
X_k_2 = X_k_e + X_k_o;


subplot(2,2,1);
stem(k, abs(X_k_1));
title('PLOTS OF x[k] (Without Decomposition')
subtitle('Magnitude Plot')
ylabel('Magnitude -->')
xlabel('Frequency(k) -->')
subplot(2,2,3);
stem(k, angle(X_k_1));
subtitle('Phase Plot')
ylabel('Phase -->')
xlabel('Frequency(k) -->')


subplot(2,2,2);
stem(k, abs(X_k_2), 'r');
subtitle('Magnitude Plot')
title('PLOTS OF x[k] = x_e[k] + x_o[k] (With Decomposition)')
ylabel('Magnitude -->')
xlabel('Frequency(k) -->')
subplot(2,2,4);
stem(k, angle(X_k_2), 'r');
subtitle('Phase Plot')
ylabel('Phase -->')
xlabel('Frequency(k) -->')