%% Métodos Determinísticos - Sunderasen 2ª Ordem Subamortecido
clear all;close all;clc
t=[0:0.1:20];
wn=2;xi=0.7;taud=0.9;
G=tf([wn^2],[1 2*xi*wn wn^2],'InputDelay',taud);
[y,t] = step(G);

%% Calculo da Área em relação à YF
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

%% Calculo do fator de amortecimento xi
x=[0.01:0.01:0.99];
lambda=(acos(x)./sqrt(1-x.^2)).*exp((-x.*acos(x))./(sqrt(1-x.^2)));
figure;
plot(lambda,x);
i=find(abs(lambda-lambda_c)'==min(abs(lambda-lambda_c)'));
xi_c=x(i)

%% Calculo dos parametros da função de transferência wn e tau_d
wn_c=acos(xi)/(sqrt(1-xi^2)*(tm-m1))
taud_c=m1-2*xi/wn

%% Modelo G(s) identificado pelo método de Sunderasen - 2ª Ordem
Gd=tf([wn_c^2],[1 2*xi_c*wn_c wn_c^2],'InputDelay',taud_c);
figure;
step(G,t);hold on;step(Gd,t)