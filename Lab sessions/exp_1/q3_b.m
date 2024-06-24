n=0:100;
x4=cos(4*pi.*n/17);
x5=3*cos(1.3*pi.*n)-4*sin(0.5*pi.*n+0.5*pi);
x6=5*cos(1.5*pi.*n+0.75*pi)+4*cos(0.6*pi.*n)-sin(0.5*pi.*n);

subplot(3,1,1);
stem(n,x4);
grid on;
subplot(3,1,2);
stem(n,x5);
grid on;
subplot(3,1,3);
stem(n,x6);
grid on;