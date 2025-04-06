  clc
  clear
  close all
%%
  L0 = 1.3; 
  L1A = 1.5;
  L1B = 1;
  L2 = 0.5;
  L3 = 1;

  m0 = 85.2755;
  m1 = 163.991;
  m2 = 32.7982;
  m3 = 65.5965;
  m4 = 98.3947;
  m5 = 65.5965;
  m6 = 32.7982;
  
  rho = 5800;

  rint = 0.08;
  rext = 0.1;

%% Calculo de parametros dinámicos

  % Eslabón 0
  I00x = 1/12*m0*L0^2;
  I00y = 1/2*m0*(rint^2 + rext^2);
  I00z = I00x;

  s00 = [0, -L0/2,0]'
  I00 = [I00x 0    0; 
       0    I00y 0;
       0    0    I00z]



  % Eslabon 1
  s11a = [0, -L1A/2, 0]';
  s11b = [0, 0, -L1B/2]';

  m1a = (m1*L1A)/(L1A+L1B);
  m1b = (m1*L1B)/(L1A+L1B);
  s11 = (m1a*s11a + m1b*s11b)/(m1a + m1b)

  I11Ax = 1/12*m1a*L1A^2;
  I11Ay = 1/2*m1a*(rint^2 + rext^2);
  I11Az = I11Ax;

  I11Bx = 1/12*m1b*L1B^2;
  I11By = I11Bx;
  I11Bz = 1/2*m1b*(rint^2 + rext^2);
    
  I11A = [I11Ax 0    0; 
       0    I11Ay 0;
       0    0    I11Az]

  I11B = [I11Bx 0    0; 
       0    I11By 0;
       0    0    I11Bz]

  r1a = s11 - s11a;
  r1b = s11 - s11b;

  Steiner_1A = norm(r1a)^2*eye(3)-r1a*r1a';
  Steiner_1B = norm(r1b)^2*eye(3)-r1b*r1b';

  I11Acdm = I11A*m1a*Steiner_1A;
  I11Bcdm = I11B*m1b*Steiner_1B;

  I11 = I11Acdm + I11Bcdm
  
  

  
 % Eslabón 2
 I22y = 1/12*m2*L2^2;
 I22x = 1/2*m2*(rint^2 + rext^2);
 I22z = I22y;


  s22 = [-L2/2 ,0  ,0 ]' % (m)  Posición del cdg del eslabón 2
  I22=[ I22x,  0,  0;... % (kg.m2) Tensor de inercia del eslabón 2
        0,  I22y,  0;...
        0,  0,  I22z ] 

  % Eslabón 3
  I33x = 1/12*m3*L3^2;
  I33z = 1/2*m3*(rint^2 + rext^2);
  I33y = I33x;


  s33 = [0 ,0  ,-L3/2 ]' % (m)  Posición del cdg del eslabón 3
  I33=[ I33x,  0,  0;... % (kg.m2) Tensor de inercia del eslabón 3
        0,  I33y,  0;...
        0,  0,  I33z ] 


  %%
  
  out = sim("Comprobacion.slx");
  
  %q1
  ej1 = subplot(3,3,1);
  plot(out.q(:,1),'LineWidth',1.5);
  hold on;
  plot(out.qp(:,1));
  grid on;
  title('q_1');
  legend('q','qp');

  ej4 = subplot(3,3,4);
  plot(out.qd(:,1),'LineWidth',1.5);
  hold on;
  plot(out.qdp(:,1));
  grid on;
  title('qd_1');
  legend('qd','qdp');

  ej7 = subplot(3,3,7);
  plot(out.qdd(:,1),'LineWidth',1.5);
  hold on;
  plot(out.qddp(:,1));
  grid on;
  title('qdd_1');
  legend('qdd','qddp');

  %q2
  ej2 = subplot(3,3,2);
  plot(out.q(:,2),'LineWidth',1.5);
  hold on;
  plot(out.qp(:,2));
  grid on;
  title('q_2');
  legend('q','qp');

  ej5 = subplot(3,3,5);
  plot(out.qd(:,2),'LineWidth',1.5);
  hold on;
  plot(out.qdp(:,2));
  grid on;
  title('qd_2');
  legend('qd','qdp');

  ej8 = subplot(3,3,8);
  plot(out.qdd(:,2),'LineWidth',1.5);
  hold on;
  plot(out.qddp(:,2));
  grid on;
  title('qdd_2');
  legend('qdd','qddp');

  %q3
  ej3 = subplot(3,3,3);
  plot(out.q(:,3),'LineWidth',1.5);
  hold on;
  plot(out.qp(:,3));
  grid on;
  title('q_3');
  legend('q','qp');

  ej6 = subplot(3,3,6);
  plot(out.qd(:,3),'LineWidth',1.5);
  hold on;
  plot(out.qdp(:,3));
  grid on;
  title('qd_3');
  legend('qd','qdp');

  ej9 = subplot(3,3,9);
  plot(out.qdd(:,3),'LineWidth',1.5);
  hold on;
  plot(out.qddp(:,3));
  grid on;
  title('qdd_3');
  legend('qdd','qddp');

  %% INTERPOLADOR CUBICO 
t = [0 2 4 6 8 10];

  % Tomo la circunferencia de la Cinemática que sé que tiene solución en la
  % inversa
  angulo = linspace(0,2*pi,6);
  r = L1B;
  centro = [L1A,0,-1];

  % Con la cinematica Directa

  for i = 1:length(angulo)
        x = centro(1) + r*cos(angulo(i));
        y = centro(2) + r*sin(angulo(i));
        z = centro(3);

        q = CinematicaInversa([x,y,z]);
        q1(i) = q(1,1);
        q2(i) = q(2,1);
        q3(i) = q(3,1);
        
  end



[qt1,tt] = T3([q1',t']);
[qt2,tt] = T3([q2',t']);
[qt3,tt] = T3([q3',t']);

for i = 1:length(qt1)
    xyz = CinematicaDirecta([qt1(i),qt2(i),qt3(i)]);
    x_int(i) = xyz(1);
    y_int(i) = xyz(2);
    z_int(i) = xyz(3);
end


  % Con la cinematica Inversa
  

  x = centro(1) + r*cos(angulo);
  y = centro(2) +r*sin(angulo);
  z = centro(3)*ones(size(angulo));

  [xt,tt] = T3([x',t']);
  [yt,tt] = T3([y',t']);
  [zt,tt] = T3([z',t']);
    
  for i = 1:length(xt)
      q = CinematicaInversa([xt(i),yt(i),zt(i)]);
      q1_int(i) = q(1,1);
      q2_int(i) = q(2,1);
      q3_int(i) = q(3,1);
  end

% Graficas

figure;
ej1 = subplot(3,2,1);
plot(tt,q1_int);
title('Interpolacion de q1');
grid on;


ej3 = subplot(3,2,3);
plot(tt,q2_int);
title('Interpolacion de q2');
grid on;


ej5 = subplot(3,2,5);
plot(tt,q3_int);
xlabel('tiempo (s)');
title('Interpolacion de q3');
grid on;

%-------

ej2 = subplot(3,2,2);
plot(tt,x_int);
title('Interpolacion de x');
grid on;


ej4 = subplot(3,2,4);
plot(tt,y_int);
title('Interpolacion de y');
grid on;


ej6 = subplot(3,2,6);
plot(tt,z_int);
xlabel('tiempo (s)');
title('Interpolacion de z');
grid on;

linkaxes([ej1 ej3 ej5],'x');
linkaxes([ej2 ej4 ej6],'x');
