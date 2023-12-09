clc
yf=5;
u=1;
K=yf/u

%% Metodo de Smith
y2=0.632*yf;
y1=0.283*yf;
t2=3.5;
t1=2.17;
Tau=1.5*(t2-t1)
Theta=t2-Tau

%% Método de Sundaresen
y2=0.853*yf
y1=0.353*yf
t2=5.33;
t1=2.37;
Tau=0.67*(t2-t1)
Theta=1.3*t1-0.29*t2