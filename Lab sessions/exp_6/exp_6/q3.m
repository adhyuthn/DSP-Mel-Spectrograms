syms s;
w = linspace(0,200,10000);

% low pass
H = 40/(40+s);
H_magnitude = abs(subs(H, s, 1i*w));
plotter(w,H_magnitude,'low pass filter')

% high pass

H = (s)/(40+s);
H_magnitude = abs(subs(H, s, 1i*w));
plotter(w,H_magnitude,'high pass filter')

% band pass

H = (20*s)/(s^2+20*s+90*110);
H_magnitude = abs(subs(H, s, 1i*w));
plotter(w,H_magnitude,'band pass filter')

% band-reject

H = (s^2+90*110)/(s^2+20*s+90*110);
H_magnitude = abs(subs(H, s, 1i*w));
plotter(w,H_magnitude,'bandreject filter')

function plotter(w,H_magnitude,str)
    figure
    plot(w, 20*log10(H_magnitude));
    xlabel('Frequency (rad/s)');
    ylabel('|H(j\omega)|');
    title(str);
    grid on;
end
