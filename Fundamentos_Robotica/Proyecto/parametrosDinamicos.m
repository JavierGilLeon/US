% -------------------------------------------------
% APARTADO B1 - Parámetros dinámicos
% -------------------------------------------------

function [s11,s22,s33,I11,I22,I33] = parametrosDinamicos
% DATOS DINÁMICOS DEL BRAZO DEL ROBOT
% Consigne datos numéricos, no simbólicos



% Eslabon 0


s00 = [0,-0.65,0]';
I00 = [12 0    0; 
       0    0.6993 0;
       0    0    12];

% Eslabón 1

  
  s11 = [0 ,-0.45  ,-0.2 ]'; % (m)  Posición del cdg del eslabón 1
  I11=[ 340.8694,  0,  0;... % (kg.m2) Tensor de inercia del eslabón 1
        0,  35.4472,  53.1708;...
        0,  113.6801,  170.5202 ] ; 

% Eslabón 2


  s22 = [-0.25 ,0  ,0 ]'; % (m)  Posición del cdg del eslabón 2
  I22=[ 0.2689,  0,  0;... % (kg.m2) Tensor de inercia del eslabón 2
        0,  0.6833,  0;...
        0,  0,  0.6833] ; 

% Eslabón 3


  s33 = [0 ,0  ,-0.5 ]'; % (m)  Posición del cdg del eslabón 3
  I33=[ 5.4664,  0,  0;... % (kg.m2) Tensor de inercia del eslabón 3
        0,  5.4664,  0;...
        0,  0,  0.5379 ] ; 
end