clear all;clc;close all

% Definir um sistema de primeira ordem
tau=2;
K=10;
G=tf(K,[tau 1])

% Aplicar um degrau unit�rio
step(G)