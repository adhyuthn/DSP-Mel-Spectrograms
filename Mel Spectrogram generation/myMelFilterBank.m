function mel_filterbank = myMelFilterBank(sampling_frequency, window_length, number_filters)
            minimum_melfrequency = 2595*log10(1+(sampling_frequency/window_length)/700);
            maximum_melfrequency = 2595*log10(1+(sampling_frequency/2)/700);
            
            filter_width = 2*(maximum_melfrequency-minimum_melfrequency)/(number_filters+1);
            disp("Filter Width:");
            disp(filter_width); 

            disp("MELS:")
            disp(minimum_melfrequency);
            disp(maximum_melfrequency);
            
            % indices in the mel scale
            filter_indices = minimum_melfrequency:filter_width/2:maximum_melfrequency;
            
            % NOTE - in terms of bins (log spaced)
            filter_indices = round(700*(10.^(filter_indices/2595)-1)*window_length/sampling_frequency);
            disp("FILTER INDICES")
            disp(filter_indices)
            % rows - number of filters, columns - max freqs
            mel_filterbank = zeros(number_filters,window_length/2);
            
            for i = 1:number_filters
                mel_filterbank(i,filter_indices(i):filter_indices(i+1)) = linspace(0,1,filter_indices(i+1)-filter_indices(i)+1);
                mel_filterbank(i,filter_indices(i+1):filter_indices(i+2)) = linspace(1,0,filter_indices(i+2)-filter_indices(i+1)+1);
            end
            
            mel_filterbank = sparse(mel_filterbank);
            
end