fs = 8000;
t = linspace(0, 1, 8000);
t = t(1:1024);
k = 1:1024;
f = (k - 1) * fs/length(t);
f = f(1 : 512);
signal = sin(2*pi*200*t) + sin(2*pi*500*t) + sin(2*pi*1000*t) + ...
         sin(2*pi*2000*t) + sin(2*pi*4000*t);

FILTER = h_blackman;
sig_spect = abs(myfft(signal));
sig_spect = sig_spect(2:513); %% totally udayip

windowed = sig_spect .* myfreqz(FILTER);

figure;
subplot(2,1,1);
plot(f, sig_spect, 'LineWidth', 2);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Frequency Spectrum of the Composite Signal');
grid on;
subplot(2,1,2);
plot(f, abs(windowed), 'LineWidth',2);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Frequency Spectrum of the output signal');
sgtitle('Qns 4 - Blackmann window design')
grid on;


