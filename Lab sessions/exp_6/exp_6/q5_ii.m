c1 = 1;
d1 = [1 3 2];
fs = 10;
T = 1/fs;

[R1, p1, k1] = residue(c1, d1);
p1 = exp(p1*T);
[b1, a1] = residuez(R1, p1, k1);
b1 = (b1');
a1 = (a1');

[h1, fre] = freqz(b1, a1, 1000, fs);

figure;
subplot(2, 1, 1);
plot(fre, abs(h1));
title('Magnitude Frequency Response');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

subplot(2, 1, 2);
plot(fre, angle(h1));
title('Phase Frequency Response');
xlabel('Frequency (Hz)');
ylabel('Phase (radians)');
grid on;