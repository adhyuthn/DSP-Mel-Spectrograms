n_x = 1:16;
n_h = 1:16;
h_n = 4 * cos(5*n_x) + 1j * sin(2*n_x);
x_n = cos(n_x) + 1j  * sin(n_x);

N = length(h_n) + length(x_n) -1;

y_n_2 = conv(x_n, h_n);

figure
subplot(2,2,1);
stem(n_x - 1, abs(x_n));
title('x[n]');
subtitle('Magnitude');
xlabel('frequency (k) -->')
ylabel('magnitude -->')

subplot(2,2,3);
stem(n_x - 1, angle(x_n));
subtitle('Phase');
xlabel('frequency (k) -->')
ylabel('phase -->')

subplot(2,2,2);
stem(n_h - 1, abs(h_n), 'r');
title('h[n]');
subtitle('Magnitude');
xlabel('frequency (k) -->')
ylabel('magnitude -->')

subplot(2,2,4);
stem(n_h - 1, angle(h_n), 'r');
subtitle('Phase');
xlabel('frequency (k) -->')
ylabel('phase -->')

x_n = [x_n, zeros(1, N - length(x_n))];
h_n = [h_n, zeros(1, N - length(h_n))];

X_k = dft(x_n);
H_k = dft(h_n);

Y_k = X_k .* H_k;
y_n_1 = idft(Y_k);

figure
subplot(2,2,1);
stem(0:length(y_n_1) - 1, abs(y_n_1));
title('CONVOLUTION CALCULATED USING IDFT');
subtitle('Magnitude');
xlabel('frequency (k) -->')
ylabel('magnitude -->')
subplot(2,2,3);
stem(0:length(y_n_1) - 1, angle(y_n_1));
subtitle('Phase');
xlabel('frequency (k) -->')
ylabel('phase -->')

subplot(2,2,2);
stem(0:length(y_n_2) - 1, abs(y_n_2), 'r');
title('CONVOLUTION CALCULATED USING conv FUNCTION');
subtitle('Magnitude');
xlabel('frequency (k) -->')
ylabel('magnitude -->')
subplot(2,2,4);
stem(0:length(y_n_2) - 1, angle(y_n_2), 'r');
subtitle('Phase');
xlabel('frequency (k) -->')
ylabel('phase -->')