fmin = 1000;
fmax = 1500;
fs = 8000;

Wmin = 2*pi*fmin/fs;
Wmax = 2*pi*fmax/fs;
Wcutoff = (Wmin+Wmax)/2;
N = ceil(8*pi/(Wmax-Wmin))+1;

n = 0:N-1;
hamming = 0.54 - 0.46*cos(2*pi*n/(N-1));
stem(hamming)

ideal = Wcutoff*sinc(Wcutoff*(n-(N-1)/2)/pi)/pi;

filter = ideal .* hamming;
filter_dft=myfreqz(filter);

db =20*log10(abs(filter_dft));

figure
plot(abs(myfft(ideal)))

figure
plot((abs(filter_dft)));

figure
plot((db));