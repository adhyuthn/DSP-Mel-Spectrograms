fl = 60;
fh = 80;
fs = 350;
wl = 2 * pi * fl;
wh = 2* pi * fh;
T = 1 / fs;

wah = (2 / T) * tan((wh * T) / 2);
wal = (2 / T) * tan((wl * T) / 2);
disp("Prewarped higher analog frequency:")
disp(wah)
disp("Prewarped lower analog frequency:")
disp(wal)
wo = wah*wal;
W = wah-wal;

s = sym('s');
Hs_bandpass = ((s*W) / (s^2 + s*W + wo));
disp("Analog filter specification:")
disp(vpa(Hs_bandpass))
K = vpa(Hs_bandpass);

syms z;
Hz = subs(K, 's', ((2/T)*(z-1))/(z+1));
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