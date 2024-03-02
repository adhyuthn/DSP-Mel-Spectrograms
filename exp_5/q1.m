% ideal low pass filter
Wc = pi/5;
n=-100:100;
low_pass = 2*Wc/pi * sinc(2*Wc/pi*n);

subplot(2,1,1)
plot(n,low_pass)

subplot(2,1,2)
plot((0:255),fftshift(abs(myfft(low_pass))));

% ideal high pass 

high_pass = sinc(n) - 2*Wc/pi * sinc(2*Wc/pi*n);

figure;
subplot(2,1,1)
plot(n,high_pass)
subplot(2,1,2)
plot((0:255),fftshift(abs(myfft(high_pass))));

% ideal bandpass filter

Wh = 0.4*pi;
Wl = 0.2*pi;
band_pass = 2*Wh/pi * sinc(2*Wh/pi*n) - 2*Wl/pi * sinc(2*Wl/pi*n);

figure;
subplot(2,1,1)
plot(n,band_pass)
subplot(2,1,2)
plot((0:255),fftshift(abs(myfft(band_pass))));

% ideal bandreject filter

Wh = 0.5*pi;
Wl = 0.2*pi;
band_reject = 2*Wh/pi * sinc(2*Wh/pi*n) - band_pass;

figure;
subplot(2,1,1)
plot(n,band_reject)
subplot(2,1,2)
plot((0:255),fftshift(abs(myfft(band_reject))));
