% -------------------------------------------------
% APARTADO A3 - Cinem�tica directa simb�lica 
% -------------------------------------------------

function [xyz] = CinematicaDirectaSimbolica
  
  % Emplee exclusivamente las siguientes variables simb�licas en sus expresiones
  syms x y z q1 q2 q3  real % variables articulares 
  syms L0 L1 L1A L1B L2 L2A L2B L3 L3A L3B real % Par�metros dimensionales
  PI = sym(pi);   % Emplee esta expresi�n de pi simb�lico

  % ------ SOLO DEBE ALTERAR LAS EXPRESIONES ENTRE ESTAS L�NEAS ----------
  % NO SUSTITUYA los valores L0, L1, etc por sus valores num�ricos
  % Posici�n del extremo de la articulaci�n 3
  x =  L1A + cos(q2)*(L3 + q3) + L2*sin(q2);
  y =  L1B*cos(q1) + L2*cos(q2)*sin(q1) - L3*sin(q1)*sin(q2) - q3*sin(q1)*sin(q2);
  z =  L0 + L1B*sin(q1) - L2*cos(q1)*cos(q2) + L3*cos(q1)*sin(q2) + q3*cos(q1)*sin(q2);
  % ----------------------------------------------------------------------  
  % Variables de salida. No las modifique.
  xyz=[x;y;z];
  end



  