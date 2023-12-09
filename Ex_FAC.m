close all;clc;clear all

%% Geração do sinal
t=[0:0.1:20];
w=1;
e1=randn(length(t),1);e1=1.0*(e1-mean(e1));
u=sin(w*t)+e1';

%% Plot do sinal corrompido pelo erro
plot(t,u);title('Sinal de Saída y(t)')

%% Cálculo da Função de Auto Correlação (FAC)
[Rmm1,lags1]=xcorr(u,'coeff');
[Rmm2,lags2]=xcorr(e1,'coeff');

%% Plot da FCC para sinal original e ruído
figure;
subplot(2,1,1)
stem(lags1,Rmm1);title('FAC sinal u')
subplot(2,1,2)
stem(lags2,Rmm2);title('FAC ruido')

%% Plot das Funções originais separada do ruído
figure
subplot(2,1,1)
plot(t,sin(w*t));title('Sinal de Entrada u(t) sem ruído')
subplot(2,1,2)
plot(t,e1);title('Ruído na Entrada')

