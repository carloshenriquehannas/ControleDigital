%clear all
close all

%Constantes dadas
zeta = 1.011;
wn = 1.093;
R = 1.15;
Kp = 8;

G = tf(wn^2, [1 2*zeta*wn wn^2]); %Funcao de transferencia da planta
