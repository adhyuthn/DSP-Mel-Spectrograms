function y = manual(x, h)
    max_len = length(x) + length(h) - 1;
    x = [x, zeros(1, max_len - length(x)) ];
    h = [h, zeros(1, max_len - length(h)) ];
    for i = 1:max_len
        y(i) = 0;
        for j = 1:i
            y(i) = y(i) + x(j) * h(i - j + 1);
        end
    end
end