fs = 200;
t1 = 0:1/fs:0.1;
plot(t,x);
hold on;
x1 = 5*cos(2*pi*100*t1);
stem(t1,x1)

title('Nyquist Sampling');
xlabel('t');
ylabel('Amplitude');
legend('Input Signal', 'Sampled Signal');