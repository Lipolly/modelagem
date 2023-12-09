%% Métodos Determinísticos - Sunderasen 2ª Ordem Superamortecido
clear all;close all;clc
t=[0:0.1:20];
tau1=5;tau2=10;taud=3;
G=tf([1],[tau1*tau2 tau1+tau2 1],'InputDelay',taud);
[y,t] = step(G);

%% Calculo da Área Abaixo de Y final
m1=trapz(t,1-y);

%% Cálculo da Reta Tangente no ponto de inflexão 
h = mean(diff(t));
dy = gradient(y, h);                                            % Numerical Derivative
[~,idx] = max(dy);                                              % Index Of Maximum
b = [t([idx-1,idx+1]) ones(2,1)] \ y([idx-1,idx+1]);            % Regression Line Around Maximum Derivative
tv = [-b(2)/b(1); (1-b(2))/b(1)];                               % Independent Variable Range For Tangent Line Plot
f = [tv ones(2,1)] * b;                                         % Calculate Tangent Line
figure
plot(t, y)
hold on
plot(tv, f, '-r')                                               % Tangent Line
plot(t(idx), y(idx), '.r')                                      % Maximum Vertical
grid on

%% Calculo da inclinação da reta tangente
Mi=1/(tv(2)-tv(1));

%% Calculo do Tempo tm 
tm=tv(2);

%% Calculo de Lambda
lambda_c=Mi*(tm-m1);

%% Calculo de ETA
Qui=[0.01:0.01:0.99];
lambda=(log(Qui)./(Qui-1)).*exp(-log(Qui)./(Qui-1));
figure;
plot(lambda,Qui);
i=find(abs(lambda-lambda_c)'==min(abs(lambda-lambda_c)'))
eta=Qui(i);

%% Calculo dos parametros da função de transferência
tau1_c=(eta^(eta/(1-eta)))/Mi
tau2_c=(eta^(1/(1-eta)))/Mi
taud_c=m1-tau1_c-tau2_c

%% Modelo G(s) identificado pelo método de Sunderasen - 2ª Ordem
Gd=tf([1],[tau1_c*tau2_c tau1_c+tau2_c 1],'InputDelay',taud_c);
figure;
step(G,t);hold on;step(Gd,t)