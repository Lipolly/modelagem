% Inicializa��o
clear all;clc;close all

% Definir a fun��o de transfer�ncia G(s)
K=7;
G=zpk([-6],[0 -1 -3],K)

% Fun��o de transfer�ncia em malha fechada
FTMF=tf(feedback(G,1))

% Plotar resposta ao degrau unit�rio
t=[0:0.1:100];
step(FTMF,t)

