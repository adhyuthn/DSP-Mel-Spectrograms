%undersampling
fs = 130;
t3 = 0:1/fs:0.1;
plot(t,x);
hold on;
x3 = 5*cos(2*pi*100*t3);
stem(t3,x3);
title('Aliased signal and Input Signal');
xlabel('t');
ylabel('Amplitude');
legend('Input Signal', 'Aliased Signal');