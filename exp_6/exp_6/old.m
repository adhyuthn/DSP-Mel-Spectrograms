% q2
b = [0.1 -0.1];
a = [1 0.8];    
w=linspace(0,pi,1000);
H = freqz(b,a,w);

subplot(2,1,1);
plot(w,abs(H));
title('Magnitude Response');
xlabel('Frequency (radians/sample)');
ylabel('Magnitude');
grid on;

subplot(2,1,2);
plot(w,angle(H));
title('Phase Response');
xlabel('Frequency (radians/sample)');
ylabel('Phase (radians)');
grid on

--------------------------------------------------------
%q1 cascade
n = [1 0 -0.16];
d = [1 1.1 0.18];
n1 =  roots(n);
p1 = roots(p);

for i=1:max(length(n1),length(p1))
    if(i>1)
        fprintf('*')
    end
    fprintf('(')
    if(i<=length(n1))
        fprintf('(1-(%f)z^-1)',n1(i))
    else
        fprintf('(1)')
    end
    fprintf('/')
    if(i<=length(p1))
        fprintf('(1-(%f)z^-1)',p1(i))
    else
        fprintf('(1)')
    end
    fprintf(')')
end

------------------------------------------------------------__
%q1 parallel
n = [0.4 0 -0.4];
d = [1 1.2 0.3];

[r, p, k] = residuez(n, d);


for i = 1:length(k)
    fprintf(' %f*z^(-%d) +', k(i), i-1);
end

for i = 1:length(r)
    if i > 1 && p(i-1) == p(i)
        power = power + 1;
        fprintf(' (%f / (1 + %f*z^-1)^%d) +', r(i), -p(i), power);
    else
        power = 1;
        fprintf(' (%f / (1 + %f*z^-1)) ', r(i), -p(i));
    end
end

fprintf('\n')

--------------------------------------------------------------_____
%q3
clc;
clear;
syms s;
w = linspace(0, 200, 10000);

% low pass

H = (40)/(40+s);
H_magnitude = abs(subs(H, s, 1i*w));
plotter(w,H_magnitude,'low pass filter')

% high pass

H = (s)/(40+s);
H_magnitude = abs(subs(H, s, 1i*w));
plotter(w,H_magnitude,'high pass filter')

% band pass

H = (20*s)/(s^2+20*s+10000);
H_magnitude = abs(subs(H, s, 1i*w));
plotter(w,H_magnitude,'band pass filter')

% band-reject

H = (s^2+10000)/(s^2+20*s+10000);
H_magnitude = abs(subs(H, s, 1i*w));
plotter(w,H_magnitude,'bandreject filter')

function plotter(w,H_magnitude,str)
    figure
    plot(w, 20*log(H_magnitude));
    xlabel('Frequency (rad/s)');
    ylabel('|H(j\omega)|');
    title(str);
    grid on;
end
----------------------------------------------------------------------_____

%q5 - iii
c3 = [0,1, 0];
d3 = [1, 4, 5];
fs = 10;
T = 1/fs;

% Frequency range
frequencies = linspace(0, fs/2, 1000);

% Compute the Laplace transfer function H(s) for the given parameters
s3 = 0.5./(1 - exp(-0.2 + 0.1*1i)*exp(-frequencies*T)) + 0.5./(1 - exp(-0.2 - 0.1*1i)*exp(-frequencies*T));

% Plot magnitude and phase responses
figure;

% Magnitude response
subplot(2, 1, 1);
plot(frequencies, abs(s3));
title('Magnitude Frequency Response');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

% Phase response
subplot(2, 1, 2);
plot(frequencies, angle(s3));
title('Phase Frequency Response');
xlabel('Frequency (Hz)');
ylabel('Phase (radians)');
grid on;
---------------------------------------------------------------------___

%q5  - ii
c2 = 1;
d2 = [1, 3, 2];
fs = 10;
T = 1/fs;

[R2, p2, k2] = residue(c2, d2);
p2 = exp(p2*T);
[b2, a2] = residuez(R2, p2, k2);
b2 = real(b2);
a2 = real(a2);
frequencies = linspace(0, fs/2, 1000);
[h2, frequencies] = freqz(b2, a2, frequencies, fs);

% Plot magnitude response
figure;
subplot(2, 1, 1);
plot(frequencies, abs(h2));
title('Magnitude Frequency Response');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

% Plot phase response
subplot(2, 1, 2);
plot(frequencies, angle(h2));
title('Phase Frequency Response');
xlabel('Frequency (Hz)');
ylabel('Phase (radians)');
grid on;
-----------------------------------------------------------------------------___

% 5 - (i) s/s+3
c1 = 3;
d1 = [1, 3];
fs = 10;
T = 1/fs;

[R1, p1, k1] = residue(c1, d1);
p1 = exp(p1*T);
[b1, a1] = residuez(R1, p1, k1);
b1 = real(b1');
a1 = real(a1');
frequencies = linspace(0, fs/2, 1000);
[h1, ~] = freqz(b1, a1, frequencies, fs);

% Plot magnitude response
figure;
subplot(2, 1, 1);
plot(frequencies, abs(h1));
title('Magnitude Frequency Response');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

% Plot phase response
subplot(2, 1, 2);
plot(frequencies, angle(h1));
title('Phase Frequency Response');
xlabel('Frequency (Hz)');
ylabel('Phase (radians)');
grid on;
-------------------------------------------------------------_
% Filter specifications - 4(d) - bandstop
fl = 60;
fh = 80;
fs = 350;
wl = 2 * pi * fl;
wh = 2* pi * fh;
T = 1 / fs;

% Prewarp to analog frequency specifications
wah = (2 / T) * tan((wh * T) / 2);
wal = (2 / T) * tan((wl * T) / 2);
disp("Prewarped higher analog frequency:")
disp(wah)
disp("Prewarped lower analog frequency:")
disp(wal)
wo = wah*wal;
W = wah-wal;

% Perform the prototype transformation - transforming from lowpass prototype to lowpass B.W
s = sym('s');
Hs_bandstop = ((s^2 + wo) / (s^2 + s*W + wo));
disp("Analog filter specification:")
disp(vpa(Hs_bandstop))
K = vpa(Hs_bandstop);

% Bilinear transformation
syms z;
Hz = subs(K, 's', ((2/T)*(z-1))/(z+1));
disp("Digital Filter specification:")
disp(Hz)
[num,den] = numden(Hz);


% N = [0.366,0.366];
% D = [1,-0.2679];

n = 1024;
[H, F] = freqz(sym2poly(num),sym2poly(den),n,fs);

% Plot the magnitude response
figure;
subplot(2,1,1);
plot(F, 20*log10(abs(H)));
title('Magnitude Response');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
grid on;

% Plot the phase response
subplot(2,1,2);
plot(F, angle(H));
title('Phase Response');
xlabel('Frequency (Hz)');
ylabel('Phase (radians)');
grid on;

-----------------------------------------------------------------
% Filter specifications - 4(c) - bandpass
fl = 60;
fh = 80;
fs = 350;
wl = 2 * pi * fl;
wh = 2* pi * fh;
T = 1 / fs;

% Prewarp to analog frequency specifications
wah = (2 / T) * tan((wh * T) / 2);
wal = (2 / T) * tan((wl * T) / 2);
disp("Prewarped higher analog frequency:")
disp(wah)
disp("Prewarped lower analog frequency:")
disp(wal)
wo = wah*wal;
W = wah-wal;

% Perform the prototype transformation - transforming from lowpass prototype to lowpass B.W
s = sym('s');
Hs_bandpass = ((s*W) / (s^2 + s*W + wo));
disp("Analog filter specification:")
disp(vpa(Hs_bandpass))
K = vpa(Hs_bandpass);

% Bilinear transformation
syms z;
Hz = subs(K, 's', ((2/T)*(z-1))/(z+1));
disp("Digital Filter specification:")
disp(Hz)
[num,den] = numden(Hz);


% N = [0.366,0.366];
% D = [1,-0.2679];

n = 1024;
[H, F] = freqz(sym2poly(num),sym2poly(den),n,fs);

% Plot the magnitude response
figure;
subplot(2,1,1);
plot(F, 20*log10(abs(H)));
title('Magnitude Response');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
grid on;

% Plot the phase response
subplot(2,1,2);
plot(F, angle(H));
title('Phase Response');
xlabel('Frequency (Hz)');
ylabel('Phase (radians)');
grid on;

-------------------------------------------------------------------
% Filter specifications - 4(b) - highpass
fc = 50;
fs = 300;
wd = 2 * pi * fc;
T = 1 / fs;

% Prewarp to analog frequency specifications
wa = (2 / T) * tan((wd * T) / 2);
disp("Prewarped analog frequency:")
disp(wa)

% Perform the prototype transformation - transforming from lowpass prototype to lowpass B.W
s = sym('s');
Hs_highpass = (s / (s + wa));
disp("Analog filter specification:")
disp(vpa(Hs_highpass))
K = vpa(Hs_highpass);

% Bilinear transformation
syms z;
Hz = subs(K, 's', ((2/T)*(z-1))/(z+1));
disp("Digital Filter specification:")
disp(Hz)
[num,den] = numden(Hz);


% N = [0.366,0.366];
% D = [1,-0.2679];

n = 1024;
[H, F] = freqz(sym2poly(num),sym2poly(den),n,fs);

% Plot the magnitude response
figure;
subplot(2,1,1);
plot(F, 20*log10(abs(H)));
title('Magnitude Response');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
grid on;

% Plot the phase response
subplot(2,1,2);
plot(F, angle(H));
title('Phase Response');
xlabel('Frequency (Hz)');
ylabel('Phase (radians)');
grid on;

--------------------------------------------------------------_
% Filter specifications - 4(a) - lowpass
fc = 50;
fs = 300;
wd = 2 * pi * fc;
T = 1 / fs;

% Prewarp to analog frequency specifications
wa = (2 / T) * tan((wd * T) / 2);
disp("Prewarped analog frequency:")
disp(wa)

% Perform the prototype transformation - transforming from lowpass prototype to lowpass B.W
s = sym('s');
Hs_lowpass = (wa / (s + wa));
disp("Analog filter specification:")
disp(vpa(Hs_lowpass))
K = vpa(Hs_lowpass);

% Bilinear transformation
syms z;
Hz = subs(K, 's', ((2/T)*(z-1))/(z+1));
disp("Digital Filter specification:")
disp(Hz)
[num,den] = numden(Hz);


% N = [0.366,0.366];
% D = [1,-0.2679];

n = 1024;
[H, F] = freqz(sym2poly(num),sym2poly(den),n,fs);

% Plot the magnitude response
figure;
subplot(2,1,1);
plot(F, 20*log10(abs(H)));
title('Magnitude Response');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
grid on;

% Plot the phase response
subplot(2,1,2);
plot(F, angle(H));
title('Phase Response');
xlabel('Frequency (Hz)');
ylabel('Phase (radians)');
grid on;
