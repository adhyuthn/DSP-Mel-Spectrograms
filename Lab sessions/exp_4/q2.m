% rectangle
% x=[1 1 1 1 0 0 0 0];
x=[zeros(1,16),ones(1,32),zeros(1,16)];
x=[x,zeros(1,64)];
plotter(x);

y = sin(2*pi*(linspace(0,2,64)));
y=[y,zeros(1,64)];
plotter(y);

z = [1 0 0 0 0 0 0 0];
z=[z,zeros(1,8)];
plotter(z)

function y=plotter(x)
    X_k = myfft(x);
    X_k1=fftshift(X_k);
    x2 = myifft(X_k)/length(x);
    
    figure
    subplot(2,2,1)
    stem((0:length(X_k1)-1),abs(X_k1),'k.-');
    xlabel('frequency (k) ')
    xlim([-1,length(x)]);
    % ylim([0,max(abs(X_k1))+0.2]);
    ylabel('Amplitude')
    title('magnitude plot of dft');

    subplot(2,2,2)
    stem((0:length(X_k1)-1),angle(X_k),'r.-');
    xlabel('frequency (k)')
    ylabel('Amplitude')
    xlim([-1,length(x)]);
    % ylim([0,max(angle(X_k1))+0.2]);
    title('phase plot of dft');
    
    subplot(2,2,3)
    stem((0:length(X_k1)-1),x,'b.-');
    xlabel('time (n)');
    ylabel('Amplitude')
    xlim([-1,length(x)]);
    % ylim([0,max(x)+0.2]);
    title('input signal')
    
    subplot(2,2,4)
    stem((0:length(X_k1)-1),x2,'k.-');
    xlabel('time (n)')
    ylabel('Amplitude')
    title('reconstucted signal')
    xlim([-1,length(x)]);
    % ylim([0,max(x)+0.2]);
end