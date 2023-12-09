close all;clc;clear all

% Definir função de transferência
G=zpk([],[-2 -4],1);

% Definir w
w=logspace(-1,2);

% Calcular a magnitude e angulo de fase
for i=1:length(w)
    M(i)=20*log10(1/sqrt(w(i)^4+20*w(i)^2+64));
    if w(i)<sqrt(8)
        Fase(i)=-atan((6*w(i))/(8-w(i)^2))*180/pi;
    else
        Fase(i)=-180-atan((6*w(i))/(8-w(i)^2))*180/pi;
    end    
end

% Plotar os resultados
semilogx(w,M); figure
semilogx(w,Fase);figure
bode(G)
