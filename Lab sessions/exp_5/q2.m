N1 = 15;
N2 = 55;
n1 = 0:N1-1;
n2 = 0:N2-1;

% hamming

hamming1 = 0.54 - 0.46*cos(2*pi*n1/(N1-1));
hamming2 = 0.54 - 0.46*cos(2*pi*n2/(N2-1));
answer(hamming1,hamming2,'hamming window')

% hanning 

hanning1 = 0.5-0.5*cos(2*pi*n1/(N1-1));
hanning2 = 0.5-0.5*cos(2*pi*n2/(N2-1));
answer(hanning1,hanning2,'hanning window')

% rectangular

rect1 = ones(1,N1-1);
rect2 = ones(1,N2-1);
answer(rect1,rect2,'rectangular window')

% barlett 

barlett1 = 1-(2*abs(n1-(N1-1)/2)/(N1-1));
barlett2 = 1-(2*abs(n2-(N2-1)/2)/(N2-1));
answer(barlett1,barlett2,'barlett window');


% blackmann 

blackmann1 = 0.42-0.5*cos(2*pi*n1/(N1-1))+0.08*cos(4*pi*n1/(N1-1));
blackmann2 = 0.42-0.5*cos(2*pi*n2/(N2-1))+0.08*cos(4*pi*n2/(N2-1));
answer(blackmann1,blackmann2,'blackmann window');

function answer(x1,x2,name)
    f1 = linspace(0, pi, 512);
    x1_fft = myfreqz(x1);
    x1_abs_dB = 20*log10(calc_abs(x1_fft));
    x2_fft = myfreqz(x2);
    x2_abs_dB = 20*log10(calc_abs(x2_fft));
    
    figure
    subplot(2,2,1);
    stem(x1,'k.-');
    title(name,'time domain - N = 15')
    xlabel(' n ---> ');
    ylabel(' Amplitude ---> ')
    ylim([0,1.2]);
    xlim([0,16]);
    
    subplot(2,2,2);
    plot(f1,x1_abs_dB);
    title(name,'frequency domain - N = 15')
    xlabel(' w ---> ');
    ylabel(' Amplitude in dB ---> ')
    
    subplot(2,2,3);
    stem(x2,'k.-');
    title(name,'time domain - N = 55')
    xlabel(' n ---> ');
    ylabel(' Amplitude ---> ')
    ylim([0,1.2]);
    xlim([0,56])
    
    subplot(2,2,4);
    plot(f1,x2_abs_dB);
    title(name,'frequency domain - N = 55')
    xlabel(' w ---> ');
    ylabel(' Amplitude in dB ---> ')
    
end


