clc
clear 
close all

% ----------------------Datos---------------------
Vd = 120;   %V 
C = 470e-6; %F
Rc = 100;   %Ohm
L = 4e-3;   %H
f = 20e3;   %Hz
T = 1/f;    %s
RepeatingTime = [0 T/2 T];
RepeatingOut  = [0 1 0];
%---------------------------------------------------

P2 = sim("Apartado_B.slx");


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
