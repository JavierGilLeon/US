
Vd = 120;   %V 
C = 470e-6; %F
Rc = 100;   %Ohm
L = 4e-3;   %H
f = 20e3;   %Hz
T = 1/f;    %s

%% Parte 1: Bucle Abierto


RepeatingTime = [0 T/2 T];
RepeatingOut  = [0 1 0];
Duty = 0.5;
