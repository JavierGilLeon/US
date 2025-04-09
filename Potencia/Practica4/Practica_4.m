
clc 
clear all
close all
%% ---------

C1 = 10e-3;
VoC1 = 490;

C2 = 600e-6;
VoC2 = 490;

VdcLinkDes = 800;
f = 16e3;
T = 1/f;
Pnom = 8e3;

RL = VdcLinkDes.^2/Pnom;

Vmp = 207;
Pmp = 4037.5;

L = 5e-3;

RepeatingTime = [0 T/2 T];
RepeatingOut  = [0 1 0];


% -------Parametros del transformador----
Lm = 0;
Rm = 10e6;

V2 = 400;
V1 = V2/2;

R1 = 0.1;
R2 = 0.1;

L1 = 0;
L2 = 0;
% ---------------------------------------

out = sim("Practica4.slx");

%%
ej1 = subplot(3,1,1);
plot(out.Pload,'linewidth',1.5);
title('Potencia instantánea en la carga')
grid on;

ej2 = subplot(3,1,2);
plot(out.Ppv,'linewidth',1.5);
hold on;
fplot(Pmp,[0 1],'linewidth',1.5);
title('Potencia instantánea en el campo de paneles');
grid on;

ej3 = subplot(3,1,3);
plot(out.Prec,'linewidth',1.5);
title('Potencia media en el rectificador');
grid on;

linkaxes([ej1 ej2 ej3],'x');

figure;
ej1 = subplot(2,1,1);
plot(out.Df);
title('Duty del Flyback');
grid on;

ej2 = subplot(2,1,2);
plot(out.De);
title('Duty del elevador');
grid on;