n = 1:8;
x_n = cos(n) + 1j * sin(n);
X_k = dft(x_n);
lhs= sum(abs(x_n .*x_n))
rhs = sum(abs (X_k .*X_k))/length(x_n)
