%clear all % apaga todas as variaveis do workspace
close all % fecha todas as janelas do workspace

%Constantes dadas
zeta = 1.011;
wn = 1.093;
R = 1.15;
G = tf(wn^2, [1 2*zeta*wn wn^2]); %Funcao de Transferencia 

p = pole(G); %Polos da funcao de transferencia G 

wb = bandwidth(G); %Largura de banda em rad/s
f = wb/(2*pi); %Largura de banda em Hz

ws = 35*wb; 
T0 = (2*pi)/ws; %Periodo de amostragem

Gz = c2d(G, T0, 'zoh'); %Funcao de transferencia no dominio Z

dz = zero(Gz); %Zero da funcao de transferencia discreta
dp = pole(Gz); %Polo da funcao de transferencia discreta

%Plot dos graficos continuo e discreto
figure
step(R*G, 'b')
hold on
step(R*Gz, 'r')
legend(['continuo';'discreto']);
title('Sistema contínuo G(s) e discreto G(z) a uma entrada degrau unitário.')

%Recupera G para Simulink
[num, den] = tfdata(G, 'v');

%Plot do resultado do Simulink
figure
plot(out.y_c.Time, out.y_c.Data, 'b')
hold on
stairs(out.y_d.Time, out.y_d.Data, 'r')
legend(['continuo';'discreto']);
title('Sistemas contínuo e discreto para entrada degrau unitário, usando Simulink.')

