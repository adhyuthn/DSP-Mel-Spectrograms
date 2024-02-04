Nr = [1 0];
Dr = [3 -4 1];
subplot(3,1,2)
impz(Nr, Dr, 10);
dim = [.09 .46 .5 .5];
[ro,po,ko] = residuez(Nr,Dr);
par_eqn = strcat('$ Partial \: fraction \: representation \: of \: H(z)= ',  makeEqn1(ro, po, ko), '$');
title('Impulse Response - Using impz function')

annotation('textbox',dim , 'String',par_eqn,'Interpreter', "latex" , 'FitBoxToText','on', 'FontSize',21');

n = 0:9;
u_n = n >= 0;
i_n = n == 0;
h_n = 0.5 * u_n - 0.16667 * (0.33333 .^ n) .* (u_n);
y_n = trimdata(conv(h_n, i_n), 10);

subplot(3,1,3);
stem(n, y_n, "r",'filled');
title('Impulse Response - conv unit impulse with h(n)')
xlabel('n (samples)');
ylabel('Amplitude')


function eqn=makeEqn1(ro, po, ko)
    eqn='';
    for i=1:length(ro)
        if i==length(ro)
        eqn = strcat(eqn, '\frac{ ', num2str(ro(i)), '}{z - (', num2str(po(i)), ')', '}');
        else
        eqn = strcat(eqn, '\frac{ ', num2str(ro(i)), '}{z - (', num2str(po(i)), ')', '}', '+');
        end
    end
end
