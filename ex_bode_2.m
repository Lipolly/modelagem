close all;clc;clear all

% Definir função de transferência
G=zpk([-3 -5],[0 -2 -4],1)

% Definir w
w=logspace(-1,2);

% Calcular a magnitude e angulo de fase
for i=1:length(w)
    M(i)=20*log10(sqrt(w(i)^4+34*w(i)^2+225)/sqrt(w(i)^6+20*w(i)^4+64*w(i)^2));
    if w(i)>sqrt(15)
        Fase(i)=(atan((8*w(i))/(15-w(i)^2))-atan((8-w(i)^2)/(-6*w(i))))*180/pi;
    else
        Fase(i)=-180+(atan((8*w(i))/(15-w(i)^2))-atan((8-w(i)^2)/(-6*w(i))))*180/pi;
    end    
end

% Plotar os resultados
semilogx(w,M); figure
semilogx(w,Fase);figure
bode(G)
