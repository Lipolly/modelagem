% Inicialização
clear all;clc;close all

% Definir a função de transferência G(s)
K=7;
G=zpk([-6],[0 -1 -3],K)

% Função de transferência em malha fechada
FTMF=tf(feedback(G,1))

% Plotar resposta ao degrau unitário
t=[0:0.1:100];
step(FTMF,t)

