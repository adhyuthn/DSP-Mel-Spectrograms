x=audioread('./Support files/acoustic.wav');
h=audioread('./Support files/moosic.wav');
x=x';
h=h';
y=manual(x,h);
plot(y)
