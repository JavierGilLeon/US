% Tension de salida Vo junto a la referencia
figure;
plot(out.Vo,'LineWidth',1.5);
hold on;
plot(out.Voref,'LineWidth',1.5);
title('Tensión de salida junto a la referencia');
legend('Vo','Voref');
ylabel('Vo (V)');
grid on;


% Duty Cycle
figure;
plot(out.D,'LineWidth',1.5);
title('Duty Cycle');
ylabel('D');
grid on;



% Corriente de la bobina
figure;
plot(out.Il,'LineWidth',1.5);
title('Corriente de la bobina');
ylabel('iL (A)');
grid on;


% Tensiones y corrientes del IGBT

figure;
ej1 = subplot(2,1,1);
plot(out.Vsw,'LineWidth',1.5);
title('Tensión del IGBT');
ylabel('V_{SW} (V)');
grid on;

ej2 = subplot(2,1,2);
plot(out.Isw,'LineWidth',1.5);
title('Corriente del IGBT');
ylabel('I_{SW} (A)');
grid on;

linkaxes([ej1 ej2],'x');

% Tensiones y corrientes del Diodo
figure;
ej1 = subplot(2,1,1);
plot(out.Vak,'LineWidth',1.5);
title('Tensión del Diodo');
ylabel('V_{ak} (V)');
grid on;

ej2 = subplot(2,1,2);
plot(out.Iak,'LineWidth',1.5);
title('Corriente del Diodo');
ylabel('I_{ak} (A)');
grid on;

linkaxes([ej1 ej2],'x');