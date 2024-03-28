b = [0.1 -0.1];
a = [1 0.8];    
w=linspace(0,pi,1000);
plotter([0.35 0.35],[1 -0.3],w,'qstn(i)')
plotter(b,a,w,'qstn(ii)')
plotter([0.7 0 -0.7],[1 -1.26 0.4],w,'qstn(iii)')
plotter([0.8 0.8*-1.6 0.8],[1 -1.28 0.6],w,'qstn(iv)')
plotter([0.5 0.7 1],[1 0.7 0.5],w,'qstn(v)')
% plotter([],[1 -0.3],w,'$\frac{0.35(1 + z^{-1})}{1 - 0.3 z^{-1}}$')

function plotter(b,a,w,str)
    H = freqz(b,a,w);
    figure
    subplot(2,1,1);
    plot(w,abs(H));
    title('Magnitude Response');
    xlabel('Frequency (radians/sample)');
    ylabel('Magnitude');
    grid on;

    subplot(2,1,2);
    plot(w,angle(H));
    title('Phase Response');
    xlabel('Frequency (radians/sample)');
    ylabel('Phase (radians)');
    grid on
    sgtitle(str,'Interpreter', 'latex')
end