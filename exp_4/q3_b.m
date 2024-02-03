% max_len=length(x)+length(h)-1;
% x = [x, zeros(1, max_len - length(x)) ];
% h = [h, zeros(1, max_len - length(h)) ];
Xk = fft(x);
Hk = fft(h);
Yk = Xk .* Hk;
y = ifft(Xk);
plot(y)

