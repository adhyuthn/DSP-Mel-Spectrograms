length = 64;
bins = 1000;
mel_bank = zeros(length, bins);
for i = 1:bins
    mel_bank(:, i) = mel_filter(i, length, bins);
end

imagesc(mel_bank);