% oversampling
fs = 220;
t2 = 0:1/fs:0.1;
subplot(2,1,1)
plot(t,x);
hold on;
x2 = 5*cos(2*pi*100*t2);
stem(t2,x2);
title('Oversampling - 2.2*f');
xlabel('t');
ylabel('Amplitude');
legend('Input Signal', 'Sampled Signal');


%undersampling
fs = 130;
t3 = 0:1/fs:0.1;
subplot(2,1,2)
plot(t,x);
hold on;
x3 = 5*cos(2*pi*100*t3);
stem(t3,x3);
title('Undersampling - 1.3*f');
xlabel('t');
ylabel('Amplitude');
legend('Input Signal', 'Sampled Signal');