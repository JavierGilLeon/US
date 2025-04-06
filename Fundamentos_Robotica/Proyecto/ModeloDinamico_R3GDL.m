% -------------------------------------------------
% APARTADO B1 - Modelo dinámico inverso
% -------------------------------------------------

function [qdd] = ModeloDinamico_R3GDL(in)
% Variables de entrada en la funcion: [q(3)  qp(3)  Tau(3)]
q1        = in(1);
q2        = in(2);
q3        = in(3);
qd1       = in(4);
qd2       = in(5);
qd3       = in(6);
Tau1      = in(7);
Tau2      = in(8);
Tau3      = in(9);

% A rellenar por el alumno
g = 9.81;
Ga = [g*(131.19*cos(q1) + 40.998*cos(q2)*sin(q1) - 32.798*sin(q1)*sin(q2) - 65.596*q3*sin(q1)*sin(q2));
           1.7764e-15*g*cos(q1)*(1.8464e+16*cos(q2) + 2.308e+16*sin(q2) + 3.6928e+16*q3*cos(q2));
                                                                        65.596*g*cos(q1)*sin(q2)]

Ma = [32.798*q3 - 1.2321*cos(2.0*q2) - 16.399*sin(2.0*q2) - 32.798*q3*cos(2.0*q2) - 32.798*q3*sin(2.0*q2) - 32.798*q3^2*cos(2.0*q2) + 32.798*q3^2 + 144.52, 32.798*cos(q2) + 40.998*sin(q2) + 65.596*q3*cos(q2), 65.596*sin(q2);
                                                                                                          40.998*sin(q2) + 65.596*cos(q2)*(q3 + 0.5),                    65.596*q3^2 + 65.596*q3 + 45.144,         32.798;
                                                                                                                                      65.596*sin(q2),                                              32.798,         68.274]
 
Va = [0.24683*qd1 + 40.998*qd2^2*cos(q2) - 32.798*qd2^2*sin(q2) + 32.798*qd1*qd3 + 131.19*qd2*qd3*cos(q2) - 65.596*q3*qd2^2*sin(q2) + 65.596*q3*qd1*qd3 - 32.798*qd1*qd2*cos(2.0*q2) - 32.798*qd1*qd3*cos(2.0*q2) + 2.4642*qd1*qd2*sin(2.0*q2) - 32.798*qd1*qd3*sin(2.0*q2) - 65.596*q3*qd1*qd2*cos(2.0*q2) - 65.596*q3*qd1*qd3*cos(2.0*q2) + 65.596*q3*qd1*qd2*sin(2.0*q2) + 65.596*q3^2*qd1*qd2*sin(2.0*q2);
                                                                                                                                                                                                      0.2457*qd2 + 65.596*qd2*qd3 + 16.399*qd1^2*cos(2.0*q2) - 1.2321*qd1^2*sin(2.0*q2) + 32.798*q3*qd1^2*cos(2.0*q2) - 32.798*q3*qd1^2*sin(2.0*q2) - 32.798*q3^2*qd1^2*sin(2.0*q2) + 131.19*q3*qd2*qd3;
                                                                                                                                                                                                                                                                           0.10564*qd3 - 32.798*qd1^2*sin(q2)^2 - 65.596*q3*qd2^2 + 16.399*qd1^2*sin(2.0*q2) - 32.798*qd2^2 - 65.596*q3*qd1^2*sin(q2)^2]
 
                                                                                                                                                                                                                                                                    
 Tau = [Tau1;Tau2;Tau3];



% Aceleraciones
  qdd = inv(Ma)*(Tau-Va-Ga);
  