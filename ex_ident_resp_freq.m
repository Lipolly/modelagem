%% Exemplo Identificação Resposta Frequência
close all; clear all; clc

%% Definição Modelo Discreto
%load('u_prbs')
u=prbs(256,20,2);u=u-0.5;
N=length(u);
Ts=0.1;
t=[0:Ts:(N-1)*Ts];
num=[1 0.5]; den=[1 -1.5 0.7];
Gd=tf(num,den,Ts);
y=lsim(Gd,u,t);

%% Plotar Gráficos Entrada e Saída
subplot(211)
plot(1:N,u,'bx-');
title('Entrada PRBS: u'); axis([0 N+1 -0.7 0.7]);
subplot(212)
plot(1:N,y,'rx-');
title('Saída: y'); axis([0 N+1 min(y)*1.1 max(y)*1.1]);
xlabel('amostras')

%% Definição do Vetor de Frequencias da FFT
freq=1/(length(y))*(0:length(y)/2); 
w_fft=2*pi*freq;
lw=length(w_fft);

%% Cálculo da Transformada de Fourier 
Y=fft(y);
U=fft(u');
H=Y./U;

%% Cálculo da Magnitude e Fase da Função de Transferencia FFT
Mag_fft_db=20*log10(abs(H(1:length(freq))));
Phase_fft=angle(H(1:length(freq)))*180/pi;

%% Dados diagrama de bode da FT original
w_bode=logspace(-2,w_fft(end),lw);
[Mag_bode,Phase_bode]=dbode(num,den,1,w_bode);
Mag_bode_db=20*log10(Mag_bode);

%% Plotar os dados
figure(2)
subplot(211)
semilogx(w_bode,Mag_bode_db,'k-',w_fft,Mag_fft_db,'-x');
title('Magnitude [dB]'); xlabel('\omega (rad/s)'); axis([0.04 2.5 -20 30]);
legend('Bode Original','Dados Experimentais','location','sw')

subplot(212)
semilogx(w_bode,Phase_bode,'k-',w_fft,Phase_fft,'-x');
title('Fase [º]'); xlabel('\omega (rad/s)'); axis([0.04 2.5 -200 50]);
legend('Bode Original','Dados Experimentais','location','sw')