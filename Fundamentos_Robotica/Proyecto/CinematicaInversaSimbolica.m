% -------------------------------------------------
% APARTADO A4 - Cinemática Inversa simbólica
% -------------------------------------------------

function q = CinematicaInversaSimbolica
  
  % Emplee exclusivamente las siguientes variables simbólicas en sus expresiones
  syms x y z q1 q2 q3  real % Coordenadas cartesianas del efector final
  syms L0 L1 L1A L1B L2 L2A L2B L3 L3A L3B real % Parámetros dimensionales
  % Emplee esta expresión de pi simbólico
  PI = sym(pi);

  % ------ SOLO DEBE ALTERAR LAS EXPRESIONES ENTRE ESTAS LÍNEAS ----------
  % Escriba a continuación las expresiones simbólicas de su cinemática
  % inversa. 

  %----- Calculo de q1-----------------
A1 = L0-z;
B1 = -y;
C1 = -L1B;
alpha1 = atan2(B1,A1);
R1 = sqrt(A1.^2+B1.^2);

s1 = C1./R1;

c1a = sqrt(1-s1.^2);
c1b = -sqrt(1-s1.^2);


q1a = atan2(s1,c1a)-alpha1;
q1b = atan2(s1,c1b)-alpha1;


q1 = [q1a,q1b];
% --------------------------------

% --------- Calculo de q3 -------------
M = -(L0.*cos(q1)-z.*cos(q1)+y.*sin(q1)).^2-(L1A-x).^2+L2.^2+L3.^2;

q3a = (-2.*L3+sqrt(4.*L3.^2 - 4.*M))./2;
q3b = (-2.*L3-sqrt(4.*L3.^2 - 4.*M))./2;

q3 = [q3a,q3b];
% ------------------------------


% ------------ Calculo de q2 --------------
A2 = L2;
B2 = (L3+q3);
C2 = x-L1A;
alpha2 = atan2(B2,A2);
R2 = sqrt(A2.^2+B2.^2);
s2 = C2./R2;

c2a = sqrt(1-s2.^2);
c2b = -sqrt(1-s2.^2);

q2a = atan2(s2,c2a)-alpha2;
q2b = atan2(s2,c2b)-alpha2;



q2 = simplify([q2a,q2b]);

q1 = [q1 q1 q1 q1];
q3 = [q3 q3];
% ----------------------------------------

  % ----------------------------------------------------------------------  
  % Variables de salida. No las modifique.                                           
  q=[q1;q2;q3];
end



  