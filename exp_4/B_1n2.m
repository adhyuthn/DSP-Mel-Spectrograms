Nr = [2 5 9 5 3];
Dr = [5 45 2 1 1 ];
p = '';
z = '';
dim = [.09 .46 .5 .5];
poles = roots(Dr);
pole_mag = abs(poles);
zeroes = roots(Nr);

p_eqn = makeEqn(poles);
z_eqn = makeEqn(zeroes);
H_eqn = strcat('$H(z) =' , '\frac{' , z_eqn , '}' , '{', p_eqn, '}', '$');

zplane(zeroes, poles);
annotation('textbox',dim,'String',H_eqn,'Interpreter', "latex" , 'FitBoxToText','on', 'FontSize',21');
table(poles, pole_mag)
table(zeroes)

function eqn=makeEqn(roots)
    eqn='';
    for i=1:length(roots)
        eqn = strcat(eqn, '(', 'z - ' , '(', num2str(roots(i)), ')' , ')');
    end
end