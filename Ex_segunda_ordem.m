clear all;clc;close all

% Definir um sistema de segunda ordem
wn=19
xi=0.4211;
G=tf(wn^2,[1 2*xi*wn wn^2])

% Aplicar um degrau unitário
step(G)