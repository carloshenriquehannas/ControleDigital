%clear all
close all

%Constantes dadas
zeta = 1.011;
wn = 1.093;
R = 1.15;
Kp = 8;

G = tf(wn^2, [1 2*zeta*wn wn^2]); %Funcao de transferencia da planta

wb = bandwidth(G); %Largura de banda em rad/s
f = wb/(2*pi); %Largura de banda em Hz
ws = 35*wb; 
T0 = (2*pi)/ws; %Periodo de amostragem 

Gmf = feedback(Kp*G, 1); %Funcao de transferencia em malha fechada

