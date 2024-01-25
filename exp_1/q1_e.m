n=-20:20;
r=n.*(n>=0);
r1=2*n.*(n>=0);
stem(n,r);
hold on;
stem(n,r1,'r.:');
legend('r[n]','r[2n]');
title('ramp')
grid on;