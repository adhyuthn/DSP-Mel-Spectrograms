x=[1 2 3 4 5 6 7 8];
Xk_1 = myfft(x);
Xk_2 = fft(x);
x2 = myifft(Xk_1)/length(Xk_1);
subplot(2,2,1)
stem(abs(Xk_1));
title('magnitude of myfft')

subplot(2,2,2)
stem(angle(Xk_1));
title('phase of myfft');

subplot(2,2,3)
stem(abs(Xk_2));
title('magnitude of fft function')

subplot(2,2,4)
stem(angle(Xk_2));
title('phase of fft function');

figure
subplot(2,1,1)
stem(abs(x));
title('input signal')
subplot(2,1,2)
stem(abs(x2));
title('reconstructed signal')