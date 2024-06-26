wc1 = 0.2*pi;
wc2 = 0.5*pi;
N = 101;
n = -(N-1)/2 : (N-1)/2;
hd = (wc2/pi) * sinc(wc2*n/pi) - (wc1/pi) * sinc(wc1*n/pi);
rectwin = ones(1, N);
hamming = 0.54 - 0.46*cos(2*pi*(0:N-1)/(N-1));
blackman = 0.42 - 0.5*cos(2*pi*(0:N-1)/(N-1)) + ...
           0.08*cos(4*pi*(0:N-1)/(N-1));
h_rect = hd .* rectwin;
h_hamming = hd .* hamming;
h_blackman = hd .* blackman;
figure;
hold on;
plot(rectwin, 'LineWidth',2);
plot(hamming, 'LineWidth',2);
plot(blackman, 'LineWidth',2);
legend('Rectangle', 'Hamming', 'Blackman')
title('Window Functions');
xlabel('n -->');
xlim([0 101]);
hold off;
grid on;
figure;
stem(n, hd);
title('Ideal Impulse Response');
xlabel('n -->');
plotter(n, h_rect, "Rectangular Window");
plotter(n, h_hamming, "Hamming Window");
plotter(n, h_blackman, "Blackmann Window");

function plotter(n, filter, titlestring)
    f = linspace(0, 1, 512);
    fft_win = myfreqz(filter);
    mag_spectrum = 20 * log10(calc_abs(fft_win));
    phase_spectrum = unwrap(calc_phase((fft_win))); 
    figure;
    subplot(3,1,1);

    plot(f, mag_spectrum);
    title('Magnitude Spectrum')
    xlabel('Normalized Angular Frequency $(\omega \times \pi)$', 'Interpreter','latex');
    ylabel('Magnitude(dB)');
    grid on;
    subplot(3,1,2);
    plot(f, phase_spectrum);
    title('Phase Spectrum')
    xlabel('Normalized Angular Frequency $(\omega \times \pi)$', 'Interpreter','latex');
    ylabel('Phase');
    grid on;
    subplot(3,1,3);
    stem(n, filter);
    title('Impulse Response')
    xlabel('n -->');
    sgtitle(titlestring);
    grid on;
end


