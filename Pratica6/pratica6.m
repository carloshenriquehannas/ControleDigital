close all;
%clear all;

%Constantes dadas
zeta = 1.011;
wn = 1.093;
R = 1.15;
Kp = 1;
G = tf(wn^2, [1 2*zeta*wn wn^2]); %Funcao de Transferencia em malha aberta

wb = bandwidth(G); %Largura de banda em rad/s
f = wb/(2*pi); %Largura de banda em Hz

ws = 35*wb; 
T0 = (2*pi)/ws; %Periodo de amostragem

tp1 = 2.86; %Tempo de pico da pratica anterior com K = 1
tr1 = 1.33; %Tempo de subida da pratica anterior com K = 1
ts1 = 3.92; %Tempo de acomodacao da pratica anterior com K = 1