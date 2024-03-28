fc = 50;
fs = 300;
wd = 2 * pi * fc;
T = 1 / fs;
wa = (2 / T) * tan((wd * T) / 2);
disp("Prewarped analog frequency:")
disp(wa)
syms s z
Hs_lowpass = (s / (s + wa));
disp("Analog filter specification:")
disp(vpa(Hs_lowpass))

Hz = subs(Hs_lowpass, 's', ((2/T)*(z-1))/(z+1));
disp("Digital Filter specification:")
disp(Hz)
[num,den] = numden(Hz);
n = 1024;
[H, F] = freqz(sym2poly(num),sym2poly(den),n,fs);
figure;
subplot(2,1,1);
plot(F, 20*log10(abs(H)));
title('Magnitude Response');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
grid on;
subplot(2,1,2);
plot(F, angle(H));
title('Phase Response');
xlabel('Frequency (Hz)');
ylabel('Phase (radians)');
grid on;
