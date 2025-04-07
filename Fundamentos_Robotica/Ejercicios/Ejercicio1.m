
syms L0 L1 L2 L3A L3B real
syms q1 q2 q3 real;

PI = sym(pi);
TB0 = MDH(L0,0,0,0);
A01 = MDH(0,PI/2+q1,L1,PI/2);
A12 = MDH(L2,q2,0,PI/2);
A23 = MDH(L1A,PI/2,L3B,0);

TB3 = simplify(TB0*A01*A12*A23)