function myMelshow(mel_spectrogram,number_samples,sampling_frequency,window_length)
                    
            xtick_step = 5;
            
            [number_mels,number_times] = size(mel_spectrogram);
            
            number_seconds = number_samples/sampling_frequency;
            time_resolution = number_times/number_seconds;
            
            minimum_mel = 2595*log10(1+(sampling_frequency/window_length)/700);
            maximum_mel = 2595*log10(1+(sampling_frequency/2)/700);
            
            mel_scale = linspace(minimum_mel, maximum_mel, number_mels);

            hertz_scale = 700*(10.^(mel_scale/2595) - 1);
            
            xtick_locations = xtick_step*time_resolution:xtick_step*time_resolution:number_times;
            xtick_labels = xtick_step:xtick_step:number_seconds;
            
            ytick_locations = 0:6:number_mels;
            ytick_labels = round(hertz_scale(1:6:end));
            
            imagesc(db(mel_spectrogram))
            axis xy
            colormap(jet)
            xticks(xtick_locations)
            xticklabels(xtick_labels)
            yticks(ytick_locations)
            yticklabels(ytick_labels)
            xlabel('Time (s)')
            ylabel('Frequency (Hz)')
            
end