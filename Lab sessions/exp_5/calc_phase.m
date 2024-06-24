function phase = calc_phase(signal)
    phase = atan2(imag(signal), real(signal));
end

