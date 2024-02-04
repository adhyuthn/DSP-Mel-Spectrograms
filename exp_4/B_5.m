figure
[Nr2, Dr2] = residuez(ro, po, ko);
rat_eqn = strcat('$ H(z) = \frac{', makeEqn2(Nr2), '}{', makeEqn2(Dr2), '}$');
dim = [.09 .46 .5 .5];
annotation('textbox',dim , 'String',rat_eqn,'Interpreter', "latex" , 'FitBoxToText','on', 'FontSize',21');


function eqn=makeEqn2(coeffs)
    eqn='';
    for i=1:length(coeffs)
        if i == length(coeffs)
            num2str(coeffs(i))
            eqn = strcat(eqn, '(' ,num2str(coeffs(i)), ')', 'z^', num2str(length(coeffs) - i));
        else
            eqn = strcat(eqn, '(' ,num2str(coeffs(i)), ').', 'z^', num2str(length(coeffs) - i), '+' );
        end
    end
end