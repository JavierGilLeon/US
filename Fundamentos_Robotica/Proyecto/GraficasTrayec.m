clc;
close all;
out = sim("Sim_Trayect.slx");

subplot(3,3,1);
plot(out.tout,out.qr(:,1));
title('q1');
grid on;

subplot(3,3,4);
plot(out.tout,out.qdr(:,1));
title('q1dr');
grid on;

subplot(3,3,7);
plot(out.tout,out.qddr(:,1));
title('q1ddr');
grid on;


%--------
subplot(3,3,2);
plot(out.tout,out.qr(:,2));
title('q2');
grid on;

subplot(3,3,5);
plot(out.tout,out.qdr(:,2));
title('q2dr');
grid on;

subplot(3,3,8);
plot(out.tout,out.qddr(:,2));
title('q2ddr');
grid on;

%-----------
subplot(3,3,3);
plot(out.tout,out.qr(:,3));
title('q3');
grid on;

subplot(3,3,6);
plot(out.tout,out.qdr(:,3));
title('q3dr');
grid on;

subplot(3,3,9);
plot(out.tout,out.qddr(:,3));
title('q3ddr');
grid on;


figure;
subplot(3,1,1);
plot(out.tout,out.xr);
title('trayectoria de x')
grid on;


subplot(3,1,2);
plot(out.tout,out.yr);
title('trayectoria de y')
grid on;


subplot(3,1,3);
plot(out.tout,out.zr);
title('trayectoria de z')
grid on;


figure;
plot3(out.xr,out.yr,out.zr);
grid on;