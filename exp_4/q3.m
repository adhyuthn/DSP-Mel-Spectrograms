x=audioread('./Support files/acoustic.wav');
h=audioread('./Support files/moosic.wav');
x=x';
h=h';
tic;
y=conv(x,h);
a=toc;
fprintf('\ntime taken in seconds :');
disp(a);
fprintf('\n');
plot(y)
title('output of convolution of two audio signals');
xlabel('time (sec)');
ylabel('Amplitude')

