function x_n=idft(Xk)
    x_n = Xk * conj(dftmtx(length(Xk)))/length(Xk);
end
    
