
% tau = Ma*qdd + V(q,qd) + G(q) (Desprecio la G)

% tau1 = a1*qdd1 + b1*qd1

% a1 = max{Ma(1,1)}


% Articulacion 1
q3 = 1.5; q2 = -pi/2;
Calculo_a1 = 16.399*q3 - 65.596*sin(q2)+54.126*sin(q2)^2+32.798*q3^2 + 32.153 % 250.269;


a1 = 250;
b1 = 0.093432; % Lo que multiplica a qd1

g11 = tf(1,[a1 b1 0]); % Funcion de transferencia