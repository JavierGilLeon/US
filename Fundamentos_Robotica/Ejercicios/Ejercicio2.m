clc
clear 
close all

syms L0 L1 L2 L3 real
syms q1 q2 q3 real
PI = sym(pi);

TB0 = MDH(0,L0,0,PI/2);
A01 = MDH(q1,0,L1,-PI/2);
A12 = MDH(q2+PI/2,0,L2,PI);
A23 = MDH(0,L3+q3,0,0);

TB3 = simplify(TB0*A01*A12*A23);

subs(TB3,[q1,q2,q3],zeros(1,3))


xyz = TB3(1:3,4);


% Si no hay reductoras, la relación es 1


%% Dinamica


% Eslabon 1
