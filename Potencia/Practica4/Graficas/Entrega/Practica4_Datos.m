
clc 
clear all
close all

C1 = 10e-3;
VoC1 = 490;

C2 = 600e-6;
VoC2 = 490;

VdcLinkDes = 800;
f = 16e3;
T = 1/f;
Pnom = 8e3;

RL = VdcLinkDes.^2/Pnom;

Vmp = 206.941;
Pmp = 5383.34;

L = 5e-3;

RepeatingTime = [0 T/2 T];
RepeatingOut  = [0 1 0];


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


