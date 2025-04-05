% -------------------------------------------------
% APARTADO A5 - Trayectoria circular en cartesianas
% -------------------------------------------------

function [x,y,z,q1,q2,q3] = trayectoriaCircular
  
  % Desarrolle aquí el código necesario para calcular una trayectoria 
  % circular en cartesianas, cuyos valores deberá guardar en los vectores x,y,z
  % así como las correspondiente coordenadas articulares q1,q2,q3.
  % El código será tal que para cualquier componente i de los vectores
L0 = 1.3; 
L1A = 1.5;
L1B = 1;
L2 = 0.5;
L3 = 1;
    
angulo = linspace(0,2*pi,100);

r = L1B;

centro = [L1A,0,-1];


for i = 1:length(angulo)
    x = centro(1)+r*cos(angulo(i));
    y = centro(2)+r*sin(angulo(i));
    z = centro(3);
    qaux = CinematicaInversa([x,y,z]);

    qi(:,i) = qaux(:,1);
end
 
 x = centro(1) + r*cos(angulo);
 y = centro(2) + r*sin(angulo);
 z = centro(3)*ones(size(angulo));

 q1=qi(1,:);
 q2=qi(2,:);
 q3=qi(3,:);
 
  end



  