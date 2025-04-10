clc
clear 
close all

% ----------------------Datos---------------------
Vdc = 500;

C = 1.5e-3; % Capacidad del condensador en paralelo

f = 8e3; 
T = 1/f;

Pmp = 10524.2;
Vmp = 223.836;

%----- Parametros del PI ----------
Kp = 0.001;
Ti = 30;
Tm = T/2; % Tiempo de muestreo
%-----------------------------

% -------Parametros del transformador----
Lm = 0;
Rm = 10e6;

V2 = 400;
V1 = V2/2;

R1 = 0.1;
R2 = 0.1;

L1 = 0;
L2 = 0;
% ---------------------------------------

%--------------Parámetros del Modulador PWM triangular ---------------

RepeatingTime = [0 T/2 T];
RepeatingOut  = [0 1 0];
% ----------------------------------------------------------------------
