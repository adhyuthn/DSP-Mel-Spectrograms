[x, fs] = audioread("resources/audio.wav");
[s, f, t] = mystft(x, fs, hamming(128), 13);

% Plotting the spectrogram from your custom STFT
figure
imagesc(t, f, 20*log10(abs(s))); % Log scale for better visualization
xlabel('Time (s)')
ylabel('Frequency (Hz)')
title("Output of self-defined STFT function")
colorbar

% Using built-in STFT function
[S, F, T] = stft(x, fs, 'Window', hamming(128), 'OverlapLength', 13);
% S=S(1:length(S)/2)
figure
imagesc(T, F, 20*log10(abs(S))); % Log scale for better visualization
xlabel('Time (s)')
ylabel('Frequency (Hz)')
title("Output of inbuilt STFT function")
colorbar

function [s, f, t] = mystft(x, fs, window, overlap)
    % x: input signal    % fs: sampling frequency
    % window: window function    % overlap: no.of overlap segments

    N = length(window);
    hop_size = round(N - overlap);
    num_frames = 1 + fix((length(x) - N) / hop_size);

    s = zeros(N, num_frames);

    for i = 1:num_frames

        start_idx = (i - 1) * hop_size + 1;
        end_idx = start_idx + N - 1;
        x_frame = x(start_idx:end_idx);

        x_windowed = x_frame .* window;

        X_frame = fftshift(fft(x_windowed));

        s(:, i) = X_frame;
    end

    f = (-N/2:N/2) * fs / N;
    t = (0:num_frames - 1) * hop_size / fs;
end
