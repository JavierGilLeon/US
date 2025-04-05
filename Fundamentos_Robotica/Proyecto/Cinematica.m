clc
clear all
close all
format compact
syms L0 L1 L1A L1B L2 L2A L2B L3 L3A L3B L4 L4A L4B L5 L5A L5B L6 L6A L6B real  
syms q1 q2 q3 q4 q5 q6 real  
PI = sym(pi);
%% DH Para 6gdl

disp('---------------Denavit-Hartemberg 6gdl----------------------')

TB0 = MDH(PI/2, L0, 0, PI/2);
A01 = MDH(q1-PI/2, L1A, 0, PI/2);
A12 = MDH(q2, -L1B, L2, -PI/2);
A23 = MDH(0, q3+L3, 0, -PI/2);
A34 = MDH(-PI/2, q4+L4, 0, PI/2);
A45 = MDH(-PI/2+q5, 0, 0, -PI/2);
A56 = MDH(q6, L5, L6, 0);

TB6 = simplify(TB0*A01*A12*A23*A34*A45*A56);
TB6(1:3,1:3);

subs(TB6,[q1,q2,q3,q4,q5,q6],[0,PI/2,0,0,0,0]);


disp('Modelo para 6 grados de libertad');
TB6

disp(' ');
disp('Posición HOME para 6 grados de libertad');
HOME = subs(TB6,[q1,q2,q3,q4,q5,q6],[0,0,0,0,0,0])

%% DH Para 3gdl
disp('----------------------Denavit-Hartemberg 3gdl--------------------------')
TB0 = MDH(PI/2, L0, 0, PI/2);
A01 = MDH(q1-PI/2, L1A, 0, PI/2);
A12 = MDH(q2, -L1B, L2, -PI/2);
A23 = MDH(0,L3+q3,0,0);

TB3 = simplify(TB0*A01*A12*A23);
subs(TB3,[q1,q2,q3],[0,PI/2,0]);

%% Cinematica Directa
syms theta phi psi real;
TB3(1:3,1:3);
ZXZ = simplify(rotz(phi)*rotx(theta)*rotz(psi));

disp(' ');
disp('Modelo para 3 grados de libertad')
TB3

disp(' ')
disp('Posición HOME para 3 grados de libertad')
subs(TB3,[q1,q2,q3],[0,0,0])






%% Cinematica Inversa

disp('-----------------------Cinematica Inversa--------------------------')
syms nx ny nz ox oy oz ax ay az px py pz real

Td = [nx ox ax px;
      ny oy ay py;
      nz oz az pz;
      0  0  0  1];

% Td = TB0*A01*A12*A23

izq = simplify(inv(TB0*A01)*Td);
der = simplify(A12*A23);

% Despejar q1
disp('Ecuacion para despejar q1')
simplify(izq(3,4)) == simplify(der(3,4))
disp(' ')

% Despejar q3
disp('Ecuacion para despejar q3')
simplify(izq(2,4)^2+izq(1,4)^2) == simplify(der(2,4)^2+der(1,4)^2)
disp(' ')

% Despejar q2
disp('Ecuacion para despejar q2')
simplify(izq(2,4)) == simplify(der(2,4))
disp(' ')

%% Trayectoria
disp('--------------------------Trayectoria---------------------------')

L0 = 1.3; 
L1A = 1.5;
L1B = 1;
L2 = 0.5;
L3 = 1;



[xt,yt,zt,q1t,q2t,q3t] = trayectoriaCircular;

lim_rot = [-PI PI];
lim_prism = [0 1.5];

figure('WindowState','maximized');
ej1 = subplot(3,2,1);
plot(q1t,'linewidth',1.5);
hold on;
fplot(lim_rot(1),[0 100],'--','color','k','linewidth',1.5);
hold on;
fplot(lim_rot(2),[0 100],'--','color','k','linewidth',1.5);
title('Trayectoria de la coordenada q1')
ylabel('q1');
grid;

ej2 = subplot(3,2,3);
plot(q2t,'linewidth',1.5);
ylabel('q2');
title('Trayectoria de la coordenada q2')
hold on;
fplot(lim_rot(1),[0 100],'--','color','k','linewidth',1.5);
hold on;
fplot(lim_rot(2),[0 100],'--','color','k','linewidth',1.5);
grid;

ej3 = subplot(3,2,5);
plot(q3t,'linewidth',1.5);
title('Trayectoria de la coordenada q3')
hold on;
fplot(lim_prism,[0 100],'--','color','k','linewidth',1.5)
ylabel('q3');
ylim([-0.5 2])
grid;

linkaxes([ej1 ej2 ej3],'x');


 ej4 = subplot(3,2,2);
 plot(xt,'linewidth',1.5);
 title('Trayectoria de la coordenada x');
 ylabel('x')
 grid;

 ej5 = subplot(3,2,4);
 plot(yt,'linewidth',1.5);
 title('Trayectoria de la coordenada y');
 ylabel('y')
 grid;

 ej6 = subplot(3,2,6);
 plot(zt,'linewidth',1.5);
 title('Trayectoria de la coordenada z');
 ylabel('z')
 grid;

 linkaxes([ej4 ej5 ej6],'x');



%% Jacobiano
disp('--------------------------Jacobiano--------------------------')
[Jdir, Jinv] = jacobiano;

disp('Jacobiano Directo');
Jdir
disp(' ');

disp('Jacobiano Inverso');
Jinv

disp(' ');
determinante = simplify(det(Jdir)) == 0
