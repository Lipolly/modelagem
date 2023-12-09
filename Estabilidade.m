% Inicialização
clear all;clc;close all

% Definir a função de transferência G(s)
G=zpk([],[-1 -2 -3 -4],240);

% Aplicar uma entrada limitada: Degrau Unitário
t=[0:0.1:10];
step(G,t)

% Função de transferência em malha fechada
FTMF=tf(feedback(G,1))

% Calculo das raizes da FTMF
Den=[1 10 35 50 264];
roots(Den)

% Aplicar uma entrada em degrau unitário
figure;
step(FTMF,t)
