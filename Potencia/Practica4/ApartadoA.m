% Valores medios de tension y potencia en la carga
figure;
subplot(2,1,1);
plot(out.VRMS,'LineWidth',1.5);
title('Valor medio de tensión en la carga');
ylabel('V_{RMS}');
grid on;

subplot(2,1,2);
plot(out.PRMS,'LineWidth',1.5);
title('Valor medio de potencia en la carga');
ylabel('P_{RMS}');
grid on;

% Calculo del factor de rizado en la carga
figure;
plot(out.Io,'LineWidth',1.5);
title('Corriente en la Carga');
ylabel('I_o');
grid on;

rIo = (19.507-12.7465)/((19.507+12.7465)/2);

disp('Factor de rizado en la carga (en %)');
rIo*100

% Tension en la carga y corrientes de la red
figure;
subplot(2,1,1);
plot(out.Vo,'LineWidth',1.5);
title('Tensión en la carga');
ylabel('V_o');
grid on;

subplot(2,1,2);
plot(out.Ia,'LineWidth',1.5);
hold on;
plot(out.Ib,'LineWidth',1.5);
hold on;
plot(out.Ic,'LineWidth',1.5);
grid on;
title('Corrientes de la red');
legend('Ia','Ib','Ic');
