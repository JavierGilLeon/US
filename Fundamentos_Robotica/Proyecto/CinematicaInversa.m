% -------------------------------------------------
% APARTADO A4 - Cinemática Inversa numérica
% -------------------------------------------------
% LA FUNCIÓN RECIBE DE ENTRADA UN VECTOR NUMÉRICO CON LA POSICIÓN EN 
% CARTESIANAS DEL EXTREMO DE LA ARTICULACIÓN 3, (x,y,z)

% LA FUNCIÓN DEBE DEVOLVER DOS VALORES:
% 1. UN VECTOR/MATRIZ NUMÉRICO q CON LAS COORDENADAS ARTICULARES (q1,q2,q3)
%    SOLUCIÓN. EN CASO DE MÚLTIPLES SOLUCIONES, EL RESULTADO SERÁ UNA MATRIZ q,
%    DE MODO QUE CADA COLUMNA REPRESENTE UNA POSIBLE SOLUCIÓN.
% 2. UNA VARIABLE LÓGICA, fueraRango, QUE VALE VERDADERO (true) SI LA CINEMÁTICA
%    INVERSA NO TIENE SOLUCIÓN, EN CUYO CASO q SERÁ UNA VECTOR COLUMNA DE
%    VALOR 0, O FALSO (false) SI EXISTE SOLUCIÓN.

function [q,fueraRango] = CinematicaInversa(xyz)
x = xyz(1);           % Posición cartesianas
y = xyz(2);           % 
z = xyz(3);           % 
fueraRango = false;   % Suponemos inicialmente que existe solución

% SUSTITUYA los valores L0, L1, etc por sus valores numéricos
  L0 = 1.3; % Valor de ejemplo. Sustitúyalo por el que corresponda
  L1A = 1.5;
  L1B = 1;
  L2 = 0.5;
  L3 = 1;

% Escriba a continuación las expresiones numéricas de su cinemática
% inversa. Si hay varias soluciones posibles, cada columna de q será una 
% solución separada (A continuación tiene un ejemplo de la forma que
% tendría para el caso de dos soluciones


%-------Soluciones de q1-----------
A1 = L0-z;
B1 = -y;
C1 = -L1B;
alpha1 = atan2(B1,A1);
R1 = sqrt(A1.^2+B1.^2);


% Controlar que abs(sin(q1)) > 1 no ocurra
if abs(C1) > abs(R1)
    q = [0;0;0];
    fueraRango = 1;
    return;
end

s1 = C1./R1;

c1a = sqrt(1-s1.^2);
c1b = -sqrt(1-s1.^2);


q1a = atan2(s1,c1a)-alpha1;
q1b = atan2(s1,c1b)-alpha1;


q1 = [q1a,q1b];

%-----------------------------------

%-----Soluciones de q3--------------
M = -(L0.*cos(q1)-z.*cos(q1)+y.*sin(q1)).^2-(L1A-x).^2+L2.^2+L3.^2;

q3a = (-2.*L3+sqrt(4.*L3.^2 - 4.*M))./2;
q3b = (-2.*L3-sqrt(4.*L3.^2 - 4.*M))./2;

q3 = [q3a,q3b];
%----------------------------------

%--------Soluciones de q2----------------
A2 = L2;
B2 = (L3+q3);
C2 = x-L1A;
alpha2 = atan2(B2,A2);
R2 = sqrt(A2.^2+B2.^2);
s2 = C2./R2;


if(abs(C2) > abs(R2))
    q = [0;0;0];
    fueraRango = 1;
    return;
end


c2a = sqrt(1-s2.^2);
c2b = -sqrt(1-s2.^2);

q2a = atan2(s2,c2a)-alpha2;
q2b = atan2(s2,c2b)-alpha2;



q2 = [q2a,q2b];
%----------------------------------------------


qaux = [q1, q1, q1 , q1; q2; q3, q3];

j = 0;
for i = 1:length(qaux)
    if  (qaux(3,i) >= 0 && qaux(3,i) <= 1.5) && (abs(qaux(2,i)) <= pi) && (abs(qaux(1,i)) <= pi)
        j = j+1;
        q(:,j) = qaux(:,i);
    end
end

if length(q) == 0
    q = [0;0;0];
    fueraRango = true;
end
end

