x = [1 1 1];
h = [1 0 0];
g = [3 4 5];
y1 = conv(x, h);

subplot(2,2,1);
stem(x);

subplot(2,2,2);
stem(h);
subplot(2,2,3);
stem(y1);

max_len = length(x) + length(h) - 1;
x = [x, zeros(1, max_len - length(x)) ];
h = [h, zeros(1, max_len - length(h)) ];


y = zeros(1, max_len);
for i = 1:max_len
    for j = 1:i
        y(i) = y(i) + x(j) * h(i - j + 1);
    end
end


x = [1 1 1];
h = [1 0 0];
g = [3 4 5];
sum = h+g;
conv2 = conv(sum, x);
conv3 = conv(h, x)+conv(g, x);
subplot(2, 2, 4);
stem(y);


figure
subplot(2,1,1)
stem(conv2)
subplot(2,1,2)
stem(conv3)