

% Potencia instantanea junto a Pmp
figure;
plot(out.Pp,'linewidth',1.5);
hold on;
fplot(Pmp,[0 1],'linewidth',1.5);
grid on;
legend('Pp','Pmp');
title('Potencia instantánea del array PV');
ylabel('P (W)');

% Tension en el array de paneles
figure;
plot(out.Vp,'linewidth',1.5);
hold on;
fplot(Vmp,[0 1],'linewidth',1.5);
grid on;
legend('Vp','Vmp');
title('Tensión en el array de paneles');
ylabel('V (V)');

% Duty cycle
figure;
plot(out.D,'linewidth',1.5);
title('Duty Cycle');
ylabel('D');
grid on;

% Corriente de la bobina de magnetizacion
figure;
plot(out.Im,'linewidth',1.5)
title('Corriente en la bobina de magnetización');
ylabel('I (A)');
grid on;

% Tensiones y corrientes máximas del IGBT
figure;
ej1 = subplot(2,1,1);
plot(out.V_IGBT,'linewidth',1.5);
title('Tensión del IGBT');
ylabel('V_IGBT (V)');
grid on;

ej2 = subplot(2,1,2);
plot(out.I_IGBT,'linewidth',1.5);
title('Corriente del IGBT');
ylabel('I_IGBT (A)');
grid on;



