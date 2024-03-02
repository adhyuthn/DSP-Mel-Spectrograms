function magnitude = calc_abs(X)
    realPart = real(X);
    imaginaryPart = imag(X);
    magnitude = sqrt(realPart.^2 + imaginaryPart.^2);
end
