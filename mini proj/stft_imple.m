[x,fs] = audioread("audio.wav");
[s,f,t] = mystft(x,fs,hamming(128),13);

% not sure somewhere I read that square of stft
% gives spectrogram
s=s.*s;

% for plotting the spectrogram
imagesc(t,f,log10(abs(s)))
xlabel('time')
ylabel('frequency')
colorbar
s2 = spectrogram(x,'yaxis');

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

        X_frame = fft(x_windowed);

        s(:, i) = X_frame;
    end

    f = (0:N/2) * fs / N;
    t = (0:num_frames - 1) * hop_size / fs;
end
