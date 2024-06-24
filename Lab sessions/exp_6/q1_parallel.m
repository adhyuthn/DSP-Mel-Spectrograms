n = [0.4 0 -0.4];
d = [1 1.2 0.32];

[r, p, k] = residuez(n, d);

fprintf('\n')
for i = 1:length(k)
    fprintf(' %f*z^(-%d)', k(i), i-1);
end

for i = 1:length(r)
    if i > 1 && p(i-1) == p(i)
        power = power + 1;
        fprintf(' + (%f / (1 + %f*z^-1)^%d)', r(i), -p(i), power);
    else
        power = 1;
        fprintf(' + (%f / (1 + %f*z^-1)) ', r(i), -p(i));
    end
end
fprintf('\n')

fprintf('\n ---------------------------------- \n\n')
n = [1 0 -0.16];
d = [1 1.1 0.18];

[r, p, k] = residuez(n, d);
syms z
for i = 1:length(k)
    fprintf(' %f*z^(-%d)', k(i), i-1);
end

for i = 1:length(r)
    if i > 1 && p(i-1) == p(i)
        power = power + 1;
        fprintf(' + (%f / (1 + %f*z^-1)^%d)', r(i), -p(i), power);
    else
        power = 1;
        fprintf(' + (%f / (1 + %f*z^-1)) ', r(i), -p(i));
    end
end

fprintf('\n')












