function coeffs = myMFCC(audio, sampling_frequency)
    window_length = 2^nextpow2(0.04*sampling_frequency);
    window = hanning(window_length);
    number_mels = 64;         % Important parameter - something happens as it changes. If values are too high, the spectrogram will be empty
    audio_stft = mystft(audio,sampling_frequency, window, 2);
    mel_filterbank = myMelFilterBank(sampling_frequency,window_length,number_mels);
    audio_spectrogram = abs(audio_stft(2:length(window)/2+1,:));
    mel_spectrogram = mel_filterbank*audio_spectrogram;


% figure
% imagesc(db(mel_spectrogram))
% colormap('jet')
% colorbar
% axis xy

% HOW MATLAB DOES IT 
% melSpectrogram(audio,sampling_frequency, ...
%                'Window',hanning(window_length,'periodic'), ...
%                'OverlapLength',1024, ...
%                'FFTLength',4096, ...
%                'NumBands',64)


% DETECTION PART - Not working

    coeffs = dct(log(mel_spectrogram+eps));
end
