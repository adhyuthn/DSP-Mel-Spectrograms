num = 3;
den = [1, 3];



fs = 10; 

[num_z, den_z] = impinvar(num, den, fs);


f = linspace(0, fs/2, 1000);

H1_s_mag = abs(freqresp(num, den, 2*pi*f));
H1_s_phase = angle(freqresp(num, den, 2*pi*f)) * 180/pi;



H1_z = freqz(num_z, den_z, 2*pi*f/fs);

figure;
subplot(2, 2, 1);
semilogx(f, 20*log10(abs(H1_s_mag)));
title('Magnitude Response - H1(s)');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
grid on;

subplot(2, 2, 2);
semilogx(f, H1_s_phase);
title('Phase Response - H1(s)');
xlabel('Frequency (Hz)');
ylabel('Phase (degrees)');
grid on;

subplot(2, 2, 3);
semilogx(f, 20*log10(abs(H1_z)));
title('Magnitude Response - H1(z)');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
grid on;

subplot(2, 2, 4);
semilogx(f, unwrap(angle(H1_z))*180/pi);
title('Phase Response - H1(z)');
xlabel('Frequency (Hz)');
ylabel('Phase (degrees)');
grid on;


