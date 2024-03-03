figure
zero = [0.3 2.5 -0.2+1j*0.4 -0.2-1j*0.4];
pole = [0.5 -0.75 0.6+1j*0.7 0.6-1j*0.7];
k = 3.9;

dim = [.09 .46 .5 .5];

[nr, dr] = zp2tf(zero', pole', k)
nr_eqn = makeEqn(nr);
dr_eqn = makeEqn(dr);
net_eqn = strcat('$ H(z) = ', '\frac{' , nr_eqn , '}{', dr_eqn , '}$');
annotation('textbox',dim,'String',net_eqn,'Interpreter', "latex" , 'FitBoxToText','on', 'FontSize',21');


function eqn=makeEqn(coeffs)
    eqn='';
    for i=1:length(coeffs)
        if i == length(coeffs)
            eqn = strcat(eqn, '(' ,num2str(coeffs(i)), ')', 'z^', num2str(length(coeffs) - i));
        else
            eqn = strcat(eqn, '(' ,num2str(coeffs(i)), ').', 'z^', num2str(length(coeffs) - i), '+' );
        end
    end
end