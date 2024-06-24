% ideal low pass filter

Wc = 0.4*pi;
n=-100:100;
low_pass = Wc/pi * sinc(Wc/pi*n);
graphplotter(low_pass,'low pass',n)

% ideal high pass 

high_pass = sinc(n) - Wc/pi * sinc(Wc/pi*n);
graphplotter(high_pass,'high pass',n)

% ideal bandpass filter

Wh = 0.8*pi;
Wl = 0.4*pi;
band_pass = Wh/pi * sinc(Wh/pi*n) - Wl/pi * sinc(Wl/pi*n);
graphplotter(band_pass,'band pass',n)

% ideal bandreject filter

Wh = pi;
Wl = 0.4*pi;
band_reject = Wh/pi * sinc(Wh/pi*n) - band_pass;
graphplotter(band_reject,'band reject',n)

function graphplotter(x,string,n)
    figure
    subplot(2,1,1)
    plot(n,x)
    title([string,' filter - time domain'])
    xlabel(' n ---> ')
    ylabel(' Amplitude ---> ')
    
    k = linspace(-pi,pi,256);
    subplot(2,1,2)
    plot(k,fftshift(calc_abs(myfft(x))));
    title([string,' filter - frequency domain'])
    xlabel(' w ---> ')
    ylabel(' Amplitude ---> ')
end
