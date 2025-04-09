clc
clear 
close all

% ----------------------Datos---------------------
Vdc = 500;

C = 1.5e-3; % Capacidad del condensador en paralelo

f = 8e3; 
T = 1/f;

Pmp = 10524.2;
Vmp = 223.836;

%----- Parametros del PI ----------
Kp = 0.001;
Ti = 30;
Tm = T/2; % Tiempo de muestreo
%-----------------------------

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

%--------------Parámetros del Modulador PWM triangular ---------------

RepeatingTime = [0 T/2 T];
RepeatingOut  = [0 1 0];

% ----------------------------------------------------------------------

P3 = sim("Apartado_C.slx");


% Tension de salida Vo junto a la referencia
figure;
plot(P2.Vo,'LineWidth',1.5);
hold on;
plot(P2.Voref,'LineWidth',1.5);
title('Tensión de salida junto a la referencia');
legend('Vo','Voref');
ylabel('Vo (V)');
grid on;


% Duty Cycle
figure;
plot(P2.D,'LineWidth',1.5);
title('Duty Cycle');
ylabel('D');
grid on;



% Corriente de la bobina
figure;
plot(P2.Il,'LineWidth',1.5);
title('Corriente de la bobina');
ylabel('iL (A)');
grid on;


% Tensiones y corrientes del IGBT

figure;
ej1 = subplot(2,1,1);
plot(P2.Vsw,'LineWidth',1.5);
title('Tensión del IGBT');
ylabel('V_{SW} (V)');
grid on;

ej2 = subplot(2,1,2);
plot(P2.Isw,'LineWidth',1.5);
title('Corriente del IGBT');
ylabel('I_{SW} (A)');
grid on;

linkaxes([ej1 ej2],'x');

% Tensiones y corrientes del Diodo
figure;
ej1 = subplot(2,1,1);
plot(P2.Vak,'LineWidth',1.5);
title('Tensión del Diodo');
ylabel('V_{ak} (V)');
grid on;

ej2 = subplot(2,1,2);
plot(P2.Iak,'LineWidth',1.5);
title('Corriente del Diodo');
ylabel('V_{ak} (A)');
grid on;
