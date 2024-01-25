n7=1:8;
x=cos(n7)+1j*sin(n7);
% x=[1,2,3,4];
% n=1:4;
% % x1=fft(x)
x2=dft(x);
N=length(x);
subplot(2,1,1)
% stem(x);
title('input sequence')

y2=dft(x2)/length(x)
y3(1)=y2(1);
j=2;
for i=N:-1:2
    y3(j)=y2(i);
    j=j+1;
end
disp(y3)
subplot(2,1,2)
stem(y3);
title('duality property')