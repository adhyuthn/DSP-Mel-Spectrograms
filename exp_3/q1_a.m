N=4;
Wx=zeros(N);
for k=0:N-1
    for n=0:N-1
        w=exp(-1j*2*pi*n*k/N);
        Wx(k+1,n+1)=w;
    end
end
Wy=zeros(N);
for k=0:N-1
    for n=0:N-1
        w=exp(1j*2*pi*n*k/N);
        Wy(k+1,n+1)=w/N;
    end
end
disp(Wx*Wy)