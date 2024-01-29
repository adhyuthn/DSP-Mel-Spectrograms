n = 1:16;
x_n = cos(n) + 1j * sin(n);
X_k = dft(x_n);
lhs= sum(abs(x_n .* x_n));
rhs = sum(abs (X_k .*X_k))/length(x_n);

x_n
X_k
fprintf('LHS = %d\n', lhs);
fprintf('RHS = %d\n', rhs);
