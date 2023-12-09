close all; clear all; clc

%% Definição do Sinal de Entrada
u=[1 1 0 0 0 0 1 1]';
y=[0 0.1813 0.3297 0.2699 0.2210 0.1809 0.1481 0.3026]';
N=8;
Ts=0.1;
t=[0:Ts:(N-1)*Ts];

%% Definição da Ordem do Modelo de identificação 
ky=1;               % Número de atrasos na saída
ku=1;               % Número de atrasos na entrada

%% Montagem do Problema de Mínimios Quadrados
ki=max(ky,ku);

% Montagem do Vetor Y
Y_mq=y(1+ki:N);

% Montagem da Matriz de Regressores Phi
for i=1:ky
    Y_Phi(:,i)=y(ki-i+1:N-i);
end
for i=1:ku
    U_Phi(:,i)=u(ki-i+1:N-i);
end
Phi=[Y_Phi U_Phi];

% Calculo dos parametros do modelo através da Pseudo-Inversa
%theta=inv(Phi'*Phi)*Phi'*Y_mq;
theta=Phi\Y_mq

%% Simulação Modelo para uma entrada u
%u_simulacao=ones(1,N); % Degrau
u_simulacao=u;
y_modelo(1:ky)=zeros(1,ky);
reg_y=y_modelo';
reg_u=[u_simulacao(1) zeros(1,ku-1)]';
reg=[reg_y;reg_u];
for i=1:(N-1)
    y_modelo(i+1)=theta'*reg;
    reg_y=[y_modelo(i+1);reg_y(1:ky-1)];
    reg_u=[u_simulacao(i+1);reg_u(1:ku-1)];
    reg=[reg_y;reg_u];
end

%% Plotar Resultados Obtidos
subplot(221)
plot(t,u); title('Entrada u'); 
subplot(223)
plot(t,y); title('Saída y');
subplot(222)
plot(t,u_simulacao); title('Entrada u'); 
subplot(224)
plot(t,y,t,y_modelo);hold on;title('Resposta Real x Modelo Identificado'); 
