x=audioread('./Support files/acoustic.wav');
h=audioread('./Support files/moosic.wav');
x=x';
h=h';

max_len=length(x)+length(h)-1;
x = [x, zeros(1, max_len - length(x)) ];
h = [h, zeros(1, max_len - length(h)) ];

tic
Xk = fft(x);
Hk = fft(h);
Yk = Xk .* Hk;
a=toc;

fprintf('\ntime taken in seconds : ')
disp(a);
fprintf('\n');
y = ifft(Yk);
plot(y)
xlabel('time (sec)');
ylabel('Amplitude ');
title('convolution using fft and ifft')