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