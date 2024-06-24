n=-10:100;
x=0.2*1.2.^n.*(n>=0);
y=2*1.15.^n.*(n>=0);
stem(n,x);
hold on;
stem(n,y,'r.-');
legend('x[n]','y[n]');
grid on;