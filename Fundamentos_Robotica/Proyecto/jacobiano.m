% -------------------------------------------------
% APARTADO A6 - Jacobianos
% -------------------------------------------------

function [Jdir,Jinv] = jacobiano
  % Desarrolle aquí el código necesario para determinar los Jacobianos 
  % directo (Jdir) e inverso (Jinv)
  % El cálculo se realizará de modo exclusivamente simbólico

% Definición de variables simbólicas  
syms L0 L1 L1A L1B L2 L2A L2B L3 L3A L3B L4 L4A L4B L5 L5A L5B L6 L6A L6B real  
syms x y z q1 q2 q3 real  
PI = sym(pi); % use PI (en mayúsculas) para referirse a pi.

xyz = CinematicaDirectaSimbolica;
x = xyz(1);
y = xyz(2);
z = xyz(3);
% Jacobiano directo  
 Jdir = [diff(x,q1) diff(x,q2) diff(x,q3);
         diff(y,q1) diff(y,q2) diff(y,q3);
         diff(z,q1) diff(z,q2) diff(z,q3)]; % Cámbielo por su solución
% Jacobiano inverso  
Jinv = inv(Jdir); % Cámbielo por su solución
  
end



  