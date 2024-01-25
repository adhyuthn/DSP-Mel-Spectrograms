hold on
n=1:100;
x1 = rand(1, 100)
x2 = rand(1, 100)
x3 = rand(1, 100)*2 - 5
stem(n, x1);
stem(n, x2, 'g');
stem(n, x3, 'r');
legend('x1', 'x2', 'x3');
title('Random numbers')