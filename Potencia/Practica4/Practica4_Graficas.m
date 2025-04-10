% Potencias
ej1 = subplot(3,1,1);
plot(out.Pload,'linewidth',1.5);
title('Potencia instantánea en la carga')
grid on;

ej2 = subplot(3,1,2);
plot(out.Ppv,'linewidth',1.5);
hold on;
fplot(Pmp,[0 1],'linewidth',1.5);
title('Potencia instantánea en el campo de paneles');
legend('Ppv','Pmp');
grid on;

ej3 = subplot(3,1,3);
plot(out.Prec,'linewidth',1.5);
title('Potencia media en el rectificador');
grid on;

linkaxes([ej1 ej2 ej3],'x');


% Duty Cycles
figure;
ej1 = subplot(2,1,1);
plot(out.Df,'linewidth',1.5);
title('Duty del Flyback');
grid on;

ej2 = subplot(2,1,2);
plot(out.De,'linewidth',1.5);
title('Duty del elevador');
grid on;


% Tensiones Vdc, VdclinkDes y VdcLink

figure;
plot(out.Vd,'linewidth',1.5);
hold on;
plot(out.VdcLink,'linewidth',1.5);
hold on;
fplot(VdcLinkDes,[0 1],'linewidth',1.5);

legend('Vd','VdcLink','VdcLinkDeseada');
grid on;
title('Tensiones Vdc');


% Corrientes
f1 = figure;
ej1 = subplot(3,1,1);
plot(out.Ia,'linewidth',1.5);
title('Corriente de la fase A de la fuente')
ylabel('Ia (A)');
grid on;

ej2 = subplot(3,1,2);
plot(out.Ilboost,'linewidth',1.5);
title('Corriente por la bobina del elevador');
ylabel('Ilboost (A)');
grid on;

ej3 = subplot(3,1,3);
plot(out.Ilflyback,'linewidth',1.5);
title('Corriente por la bobina del flyback');
ylabel('Ilflyback (A)');
grid on;

