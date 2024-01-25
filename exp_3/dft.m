function Xk=dft(x)
    N=length(x);
%     w=dftmtx(N);
    Wx=zeros(N);
    for k=0:N-1
        for n=0:N-1
            w=exp(-1j*2*pi*n*k/N);
            Wx(k+1,n+1)=w;
        end
    end
    Xk=x*Wx;