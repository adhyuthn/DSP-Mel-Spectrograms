audio = audioread("resources/audio.wav");

sampling_frequency = 44100;
window_length = 2^nextpow2(0.04*sampling_frequency);
window = hamming(window_length);
number_mels = 128;         % Important parameter - something happens as it changes. If values are too high, the spectrogram will be empty

audio_stft = mystft(audio,sampling_frequency, window, 2);
mel_filterbank = myMelFilterBank(sampling_frequency,window_length,number_mels);
audio_spectrogram = abs(audio_stft(2:length(window)/2+1,:));
mel_spectrogram = mel_filterbank*audio_spectrogram;

audio_mfcc = dct(log(mel_spectrogram+eps));

figure
imagesc(db(mel_spectrogram))
colormap('jet')
axis xy