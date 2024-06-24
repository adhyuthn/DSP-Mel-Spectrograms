xn=[1,2,3,4,5,6,7];
N=length(xn);
n=mod(4,N);
j=1;
for in=n+1:N
    xm(j)=xn(in)
    j=j+1;
end
j=1;
for in=N-n+1:N
    xm(in)=xn(j);
    j=j+1;
end
disp(xm);
Xk=dft(xn);
Yk=dft(xm);
for in=0:N-1
       Xk(in+1)=Xk(in+1)*exp(1j*2*pi*n*in/N);
end
disp('YK');
disp(Yk)
disp('XK')
disp(Xk)

figure('Name','DFT of input signal')
subplot(3,1,1)
stem(xn);
title('input signal')
subplot(3,1,2)
stem(abs(Xk));
title('Magnitude plot');
subplot(3,1,3)
stem(angle(Xk));
title('Phase plot');

figure('Name','DFT of shifted signal')
subplot(3,1,1)
stem(xm);
title('shifted signal')
subplot(3,1,2)
stem(abs(Yk));
title('Magnitude plot');
subplot(3,1,3)
stem(angle(Yk));
title('Phase plot');
    
