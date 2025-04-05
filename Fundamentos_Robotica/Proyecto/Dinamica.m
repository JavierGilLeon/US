  clc
  clear
  close all
%% Calculo de parametros dinámicos
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

  m1a = rho*L1A;
  m1b = rho*L1B;
  s11 = (m1a*s11a + m1b*s11b)/(m1a + m1b)

  I11Ax = 1/12*m1a*L1A^2;
  I11Ay = 1/2*m1a*(rint^2 + rext^2);
  I11Az = I11Ax;

  I11Bx = 1/12*m1b*L1B^2;
  I11Bz = 1/2*m1b*(rint^2 + rext^2);
  I11By = I11Bx;
    
  I11A = [I11Ax 0    0; 
       0    I11Ay 0;
       0    0    I11Az];

  I11B = [I11Bx 0    0; 
       0    I11By 0;
       0    0    I11Bz];

  r1a = s11 - s11a;
  r1b = s11 - s11b;

  I11Acdm = I11A*m1a*norm(r1a)^2*eye(3)-r1a*r1a';
  I11Bcdm = I11B*m1b*norm(r1b)^2*eye(3)-r1b*r1b';

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
  