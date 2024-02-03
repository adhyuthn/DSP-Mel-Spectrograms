Nr = [2 5 9 5 3];
Dr = [5 45 2 1 1 ];

poles = roots(Dr);
pole_mag = abs(poles);
zeroes = roots(Nr);
zplane(zeroes, poles)
table(poles, pole_mag)
table(zeroes)
