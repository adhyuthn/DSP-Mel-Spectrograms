[audio, sampling_frequency]= audioread("resources/audios.wav");

window_length = 2^nextpow2(0.04 * sampling_frequency);
window = hanning(window_length);
number_mels = 64; 

audio_stft = mystft(audio,sampling_frequency, window, 1024);
mel_filterbank = myMelFilterBank(sampling_frequency,window_length,number_mels);
audio_spectrogram = (abs(audio_stft(2:length(window)/2+1,:))).^2; 
mel_spectrogram = mel_filterbank*audio_spectrogram;


myMelshow(mel_spectrogram, length(audio), sampling_frequency, window_length)
colormap("parula")
colorbar
title('Mel spectrogram - custom functions');
fontsize(16,"points")

figure
imagesc(mel_filterbank)
axis xy
colormap("parula")
title('Mel filterbank')
xlabel('Frequency index')
ylabel('Mel index')
fontsize(16,"points")

% MATLABS IMPLEMENTATION
figure
melSpectrogram(audio,sampling_frequency, ...
               'Window',hanning(window_length,'periodic'), ...
               'OverlapLength',1024, ...
               'NumBands',64, ...
               'MelStyle','oshaughnessy');

title('Mel spectrogram - built-in function');
fontsize(16,"points")