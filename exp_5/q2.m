N1 = 15;
N2 = 55;
n1 = 0:N1-1;
n2 = 0:N2-1;

hamming

hamming1 = 0.54 - 0.46*cos(2*pi*n1/(N1-1));
hamming2 = 0.54 - 0.46*cos(2*pi*n2/(N2-1));
stem(abs(hamming1))
figure
stem(abs(hamming2))

% hamming ffts

hamming_fft_1 = myfreqz(hamming1);
hamming_fft_1=20*log10(abs(hamming_fft_1));
figure 
plot(hamming_fft_1)

hamming_fft_2 = myfreqz(hamming2);
hamming_fft_2=20*log10(abs(hamming_fft_2));
figure 
plot(hamming_fft_2)

% hanning 

hanning1 = 0.5-0.5*cos(2*pi*n1/(N1-1));
hanning2 = 0.5-0.5*cos(2*pi*n2/(N2-1));
figure
stem(hanning1)
figure
stem(hanning2)

% hanning ffts

hanning_fft_1 = myfreqz(hanning1);
hanning_fft_1=20*log10(abs(hanning_fft_1));
figure 
plot(hanning_fft_1)

hanning_fft_2 = myfreqz(hanning2);
hanning_fft_2=20*log10(abs(hanning_fft_2));
figure 
plot(hanning_fft_2)

rectangular

rect1 = ones(1,N1-1);
rect2 = ones(1,N2-1);
figure 
stem(rect1)
figure
stem(rect2)

% rectangular dfts

rect_fft_1 = myfreqz(rect1);
rect_fft_1 = 20*log10(abs(rect_fft_1));
figure
plot(rect_fft_1)

rect_fft_2 = myfreqz(rect2);
rect_fft_2 = 20*log10(abs(rect_fft_2));
figure
plot(rect_fft_2)

barlett 

barlett1 = 1-(2*abs(n1-(N1-1)/2)/(N1-1));
figure
stem(barlett1)
barlett2 = 1-(2*abs(n2-(N2-1)/2)/(N2-1));
figure
stem(barlett2)

% barlett dfts

barlett_fft_1 = myfreqz(barlett1);
barlett_fft_1 = 20*log10(abs(barlett_fft_1));
figure
plot(barlett_fft_1)

barlett_fft_2 = myfreqz(barlett2);
barlett_fft_2 = 20*log10(abs(barlett_fft_2));
figure
plot(barlett_fft_2)

% blackmann 

blackmann1 = 0.42-0.5*cos(2*pi*n1/(N1-1))+0.08*cos(4*pi*n1/(N1-1));
figure
stem(blackmann1)
blackmann2 = 0.42-0.5*cos(2*pi*n2/(N2-1))+0.08*cos(4*pi*n2/(N2-1));
figure
stem(blackmann2)

% blackmann dfts

blackmann_fft_1 = myfreqz(blackmann1);
blackmann_fft_1 = 20*log10(abs(blackmann_fft_1));
figure
plot(blackmann_fft_1)

blackmann_fft_2 = myfreqz(blackmann2);
blackmann_fft_2 = 20*log10(abs(blackmann_fft_2));
figure
plot(blackmann_fft_2) 
