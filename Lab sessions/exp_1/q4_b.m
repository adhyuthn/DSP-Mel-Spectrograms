hold on
n=1:100;
x1 = randn(1, 100)
x2 = randn(1, 100)
x3 = randn(1, 100)*10
a = var(x3)
plot(n, x1);
plot(n, x2, 'g');
plot(n, x3, 'r');
legend('x1', 'x2', 'x3');
title('Random numbers with normal distribution')