fs = 8000;
t = linspace(0, 1, 8000);
t = t(1:1024);
k = 1:1024;
f = (k - 1) * fs/length(t);
f_0 = f(1 : 512);
signal = sin(2*pi*200*t) + sin(2*pi*500*t) + sin(2*pi*1000*t) + sin(2*pi*2000*t) + sin(2*pi*4000*t);

filter = h_blackman;
sig_spect = abs(myfft(signal));
sig_spect = sig_spect(1:512);

windowed = sig_spect .* myfreqz(filter);

figure;
subplot(2,1,1);
plot(f_0, sig_spect);
xlabel('Frequency (Hz)');
ylabel('Magnitude Spectrum');
title('Frequency Spectrum of the Signal');
grid on;
subplot(2,1,2);
plot(f_0, abs(windowed));
xlabel('Frequency (Hz)');
ylabel('Magnitude Spectrum');
title('Frequency Spectrum of the Windowed signal');
grid on;


