% rectangle
% x=[1 1 1 1 0 0 0 0];
x=[zeros(1,16),ones(1,32),zeros(1,16)];
plotter(x);

y = sin(2*pi*(linspace(0,2,64)));
plotter(y);

z = [1 0 0 0 0 0 0 0];
plotter(z)

function y=plotter(x)
    X_k = myfft(x);
    X_k1=fftshift(X_k);
    x2 = myifft(X_k);
    
    figure
    subplot(2,2,1)
    plot(abs(X_k1));
    title('magnitude plot of dft');

    subplot(2,2,2)
    stem(angle(X_k));
    title('phase plot of dft');
    
    subplot(2,2,3)
    stem(x);
    title('input signal')
    
    subplot(2,2,4)
    stem(x2);
    title('reconstucted signal')
end