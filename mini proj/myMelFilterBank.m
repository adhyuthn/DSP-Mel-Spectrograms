% simply copied from zaf.m

function mel_filterbank = myMelFilterBank(sampling_frequency, window_length, number_filters)
            % Compute the minimum and maximum mels
            minimum_melfrequency = 2595*log10(1+(sampling_frequency/window_length)/700);
            maximum_melfrequency = 2595*log10(1+(sampling_frequency/2)/700);
            
            % Derive the width of the half-overlapping filters in the mel scale (constant)
            filter_width = 2*(maximum_melfrequency-minimum_melfrequency)/(number_filters+1);
            
            % Compute the start and end indices of the overlapping filters in the mel scale (linearly spaced)
            filter_indices = minimum_melfrequency:filter_width/2:maximum_melfrequency;
            
            % Derive the indices of the filters in the linear frequency scale (log spaced)
            filter_indices = round(700*(10.^(filter_indices/2595)-1)*window_length/sampling_frequency);
            
            % Initialize the mel filterbank
            mel_filterbank = zeros(number_filters,window_length/2);
            
            % Loop over the filters
            for i = 1:number_filters
                                
                % Compute the left and right sides of the triangular filters
                % (this is more accurate than creating triangular filters directly)
                mel_filterbank(i,filter_indices(i):filter_indices(i+1)) ...
                    = linspace(0,1,filter_indices(i+1)-filter_indices(i)+1);
                mel_filterbank(i,filter_indices(i+1):filter_indices(i+2)) ...
                    = linspace(1,0,filter_indices(i+2)-filter_indices(i+1)+1);
            end
            
            % Make the mel filterbank sparse
            mel_filterbank = sparse(mel_filterbank);
            
end