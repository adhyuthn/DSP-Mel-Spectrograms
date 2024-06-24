Nr1 = [6 1 -1];
Dr1 = [1 0 0];

Nr2 = [1 -1 -6];
Dr2 = [1 0 0];

disp('H_1(z)')
zplot(Nr1, Dr1);
sgtitle('$H_1(z) = 6 + z^{-1} - z^{-2}$', Interpreter="latex", FontSize=20)


disp('H_2(z)')
zplot(Nr2, Dr2);
sgtitle('$H_2(z) = 1 - z^{-1} - 6z^{-2}$', Interpreter="latex", FontSize=20)



function zplot(Nr, Dr)
    figure
    poles = roots(Dr)
    zeroes = roots(Nr)
    disp('--------------------')
    subplot(2, 1, 1);
    zplane(zeroes, poles);
    subplot(2, 1, 2);
    impz(Nr, Dr, 20);
end