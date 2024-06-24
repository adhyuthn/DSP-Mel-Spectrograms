fmin = 1000;
fmax = 1500;
fs = 8000;
fi = linspace(-pi,pi,128);
f = linspace(0,pi/2,512);

Wmin = 2*pi*fmin/fs;
Wmax = 2*pi*fmax/fs;
Wcutoff = (Wmin+Wmax)/2;
N = ceil(8*pi/(Wmax-Wmin))+1;

n = 0:N-1;
hamming = 0.54 - 0.46*cos(2*pi*n/(N-1));
stem(hamming)
xlabel('n --->')
ylabel('Amplitude --->')
title('hamming window function graph')
ylim([0,1.1]);

ideal = sinc(n-(N-1)/2) - Wcutoff*sinc(Wcutoff*(n-(N-1)/2)/pi)/pi;
filter = ideal .* hamming;
filter_dft = myfreqz(filter);

db =20*log10(abs(filter_dft));

figure
plot(fi*fs/(2*pi),myfftshift(abs(myfft(ideal))))
xlabel('f --->')
ylabel('Amplitude --->')
title('ideal high pass filter')

figure
subplot(2,1,1)
plot(f*fs/(pi),(abs(filter_dft)))
xlabel('f --->')
ylabel('Amplitude --->')
title('Designed filter - magnitude plot')
ylim([0,1.2]);

subplot(2,1,2)
plot(f*fs/(pi),unwrap(calc_phase(filter_dft)))
xlabel('f --->')
ylabel('Phase --->')
title('Designed filter - phase plot')

figure
plot(f*fs/(pi),(db));
xlabel('f --->')
ylabel('Amplitude in dB --->')
title('designed filter frequency response in dB')