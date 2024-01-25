y = audioread('moosic.wav');
subplot(1,3,1);
plot(y);

sound(y);
y_d = downsample(y, 2);
y_u = upsample(y, 2);
subplot(1,3,2);
plot(y_d);
subplot(1,3,3);
plot(y_u)