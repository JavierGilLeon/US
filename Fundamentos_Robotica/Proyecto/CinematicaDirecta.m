% -------------------------------------------------
% APARTADO A3 - Cinemática directa numérica 
% -------------------------------------------------

% IMPORTANTE: ESTA FUNCIÓN DEBE DEVOLVER DOS VECTORES NUMÉRICOS, POSICIÓN Y ORIENTACIÓN,
% CUANDO RECIBE DE ENTRADA UN VECTOR TAMBIÉN NUMÉRICO CON LAS TRES COORDENADAS ARTICULARES
% q1, q2 y q3

function [xyz,angEuler] = CinematicaDirecta(in)
  q1       = in(1);           % Posiciones articulares
  q2       = in(2);            
  q3       = in(3);

  % ------ SOLO DEBE ALTERAR LAS EXPRESIONES ENTRE ESTAS LÍNEAS ----------
  % SUSTITUYA los valores L0, L1, etc por sus valores numéricos  
  L0 = 1.3; % Valor de ejemplo. Sustitúyalo por el que corresponda
  L1A = 1.5;
  L1B = 1;
  L2 = 0.5;
  L3 = 1;
  
  % 
  % Posición del extremo de la articulación 3
  x =  L1A + cos(q2)*(L3 + q3) + L2*sin(q2);
  y =  L1B*cos(q1) + L2*cos(q2)*sin(q1) - L3*sin(q1)*sin(q2) - q3*sin(q1)*sin(q2);
  z =  L0 + L1B*sin(q1) - L2*cos(q1)*cos(q2) + L3*cos(q1)*sin(q2) + q3*cos(q1)*sin(q2);
  % Orientación (Ángulos de Euler) del marco de referencia 3
  psi   = atan2((-cos(q1)*cos(q2)),sin(q1)); 
  phi   = atan2(cos(q2),sin(q1)*cos(q2)); 
  theta = atan2(cos(q2),cos(psi)*cos(q1)*sin(q2));
  
  % ----------------------------------------------------------------------  
  % Variables de salida. No las modifique.
  xyz=[x;y;z];
  angEuler = [phi;theta;psi]; % Ángulos de Euler según convenio ZXZ
end


  