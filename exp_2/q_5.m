t = linspace(0, 3, 10000);
x_t = 5*sin(2*pi*t);
i_t = ones(1, length(t));
y1_t = x_t .* i_t;

subplot(2,2,1);
plot(t, x_t);
title('x(t) vs t');
xlabel('t');
ylabel('x(t)');

subplot(2,2,2);
stem(t, y1_t);
title('x(t) - Impulse Sampled');
xlabel('n');
ylabel('x[n]');
    
s_t = 0.5 * (sign(cos(20*pi*t)) + 1);
subplot(2,2,3);
plot(t, s_t);
title('Square wave');
xlabel('t');
ylabel('s(t)');
ylim([0, 1.1]);

subplot(2,2,4);
y2_t = x_t .* s_t;
plot(t, y2_t);
title('Natural Sampled');
xlabel('t');
ylabel('y(t)');
