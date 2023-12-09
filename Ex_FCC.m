close all;clc;clear all

%% Gera��o do sinal
t=[0:0.1:20];
w=1;
e1=randn(length(t),1);e1=1.0*(e1-mean(e1));
e2=randn(length(t),1);e2=1.0*(e2-mean(e2));
u=sin(w*t)+e1';
y=cos(w*t)+e2';

%% Plot do sinal corrompido pelo erro
subplot(2,1,1)
plot(t,y);title('Sinal de Entrada u(t)')
subplot(2,1,2)
plot(t,u);title('Sinal de Sa�da y(t)')

%% C�lculo da Fun��o de Correla��o Cruzada (FCC)
[Rmm1,lags1]=xcorr(u,y);
[Rmm2,lags2]=xcorr(e1,e2);

%% Plot da FCC para sinal original e ru�do
figure;
subplot(2,1,1)
stem(lags1,Rmm1);title('FCC entre sinais u e y')
subplot(2,1,2)
stem(lags2,Rmm2);title('FCC entre ru�dos')

%% Plot das Fun��es originais separada do ru�do
figure
subplot(2,2,1)
plot(t,sin(w*t));title('Sinal de Entrada u(t) sem ru�do')
subplot(2,2,2)
plot(t,cos(w*t));title('Sinal de Sa�da y(t) sem ru�do')
subplot(2,2,3)
plot(t,e1);title('Ru�do na Entrada')
subplot(2,2,4)
plot(t,e2);title('Ru�do na Sa�da')

