clc
clear 
close all

Vd = 120;   %V 
C = 470e-6; %F
Rc = 100;   %Ohm
L = 4e-3;   %H
f = 20e3;   %Hz
T = 1/f;    %s
RepeatingTime = [0 T/2 T];
RepeatingOut  = [0 1 0];
