n = [1 0 -0.16];
d = [1 1.1 0.18];
n1 =  roots(n);
p1 = roots(p);

for i=1:max(length(n1),length(p1))
    if(i>1)
        fprintf('*')
    end
    fprintf('(')
    if(i<=length(n1))
        fprintf('(1-(%f)z^-1)',n1(i))
    else
        fprintf('(1)')
    end
    fprintf('/')
    if(i<=length(p1))
        fprintf('(1-(%f)z^-1)',p1(i))
    else
        fprintf('(1)')
    end
    fprintf(')')
end

fprintf('\n------------------------\n')
n = [0.4 0 -0.4];
d = [1 1.2 0.32];
n1 =  roots(n);
p1 = roots(p);

for i=1:max(length(n1),length(p1))
    if(i>1)
        fprintf('*')
    end
    fprintf('(')
    if(i<=length(n1))
        fprintf('(1-(%f)z^-1)',n1(i))
    else
        fprintf('(1)')
    end
    fprintf('/')
    if(i<=length(p1))
        fprintf('(1-(%f)z^-1)',p1(i))
    else
        fprintf('(1)')
    end
    fprintf(')')
end

fprintf('\n')