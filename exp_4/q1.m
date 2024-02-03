x=(1:16)/2.*cos(2*pi.*(1:16))+1j.*sin(2*pi.*(1:16));
Xk_1 = myfft(x);
Xk_2 = fft(x);
x2 = myifft(Xk_1)/length(Xk_1);

subplot(2,2,1)
stem((0:15),abs(Xk_1),'k.-');
xlim([-1,16]);
ylim([0,max(abs(Xk_1))+5]);
xlabel('frequency (k)')
ylabel('Amplitude')
title('DFT magnitude plot - using myfft function');

subplot(2,2,2)
stem((0:15),angle(Xk_1),'r.-');
xlim([-1,16]);
xlabel('frequency (k)')
ylabel('Amplitude')
ylim([min(angle(Xk_1))-0.5,max(angle(Xk_1))+0.5])
title('DFT phase plot - using myfft function');

subplot(2,2,3)
stem((0:15),abs(Xk_2),'k.-');
xlim([-1,16]);
xlabel('frequency (k)')
ylabel('Amplitude')
ylim([0,max(abs(Xk_2))+5])
title('DFT magnitude plot - using fft function');

subplot(2,2,4)
stem((0:15),angle(Xk_2),'r.-');
xlim([-1,16]);
xlabel('frequency (k)')
ylabel('Amplitude')
ylim([min(angle(Xk_2))-0.5,max(angle(Xk_2))+0.5])
title('DFT phase plot - using myfft function');

figure
subplot(2,2,1)
stem((0:15),abs(x),'k.-');
xlim([-1,16]);
ylim([0,max(abs(x2))+1])
xlabel(' n ---> ')
ylabel (' Amplitude ---> ')
title('magnitude of input signal')

subplot(2,2,2)
stem((0:15),angle(x),'r.-');
% ylim([min(angle(x))-0.5,max(angle(x))+0.5])
xlim([-1,16]);
xlabel(' n ---> ')
ylabel (' Amplitude ---> ')
title('phase of input signal')

subplot(2,2,3)
stem((0:15),abs(x2),'k.-');
ylim([0,max(abs(x2))+1])
xlabel(' n ---> ')
ylabel (' Amplitude ---> ')
xlim([-1,16]);
title('magnitude of reconstructed signal')

subplot(2,2,4)
stem((0:15),angle(x2),'r.-');
xlim([-1,16]);
xlabel(' n ---> ')
ylabel (' Amplitude ---> ')
title('phase of reconstructed signal')
