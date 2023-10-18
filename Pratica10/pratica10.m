close all;
%clear all;

%Constantes dadas
zeta = 1.011;
wn = 1.093;
R = 1.15;
G = tf(wn^2, [1 2*zeta*wn wn^2]); %Funcao de transferencia da planta

wb = bandwidth(G); %Largura de banda em rad/s
f = wb/(2*pi); %Largura de banda em Hz
ws = 35*wb; 
T01 = (2*pi)/ws; %Periodo de amostragem 1
T02 = 1.33*T01; %Periodo de amostragem 2

Gz = c2d(G, T01, 'zoh'); %Funcao de transferencia discreta da planta

[num, den] = tfdata(Gz, 'v');

%Coeficientes Q controlador DB
q0 = 1/sum(den);
q1 = den(2)*q0;
q2 = den(3)*q0;

%Coeficientes P do controlador DB
p1 = num(2)*q0;
p2 = num(3)*q0; 

Gdb = tf([q0 q1 q2], [1 -p1 -p2], T01); %Funcao de transferencia do controlador DB

Gmf = feedback(Gdb, -1);
