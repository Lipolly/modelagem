% Inicializa��o
clear all;clc;close all

% Definir a fun��o de transfer�ncia G(s)
G=zpk([],[-1 -2 -3 -4],240);

% Aplicar uma entrada limitada: Degrau Unit�rio
t=[0:0.1:10];
step(G,t)

% Fun��o de transfer�ncia em malha fechada
FTMF=tf(feedback(G,1))

% Calculo das raizes da FTMF
Den=[1 10 35 50 264];
roots(Den)

% Aplicar uma entrada em degrau unit�rio
figure;
step(FTMF,t)
