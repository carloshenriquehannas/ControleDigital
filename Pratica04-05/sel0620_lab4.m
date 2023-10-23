close all;
%clear all;

%Constantes dadas
zeta = 1.011;
wn = 1.093;
R = 1.15;
Kp = 1;
G = tf(wn^2, [1 2*zeta*wn wn^2]); %Funcao de Transferencia em malha aberta

%Funcao de transferencia de malha fechada do sistema continuo
Gmf = feedback (Kp*G, 1);

wb = bandwidth(G); %Largura de banda em rad/s
f = wb/(2*pi); %Largura de banda em Hz

ws = 35*wb; 
T0 = (2*pi)/ws; %Periodo de amostragem




Gz = c2d(G, T0, 'zoh'); %Funcao de transferencia no dominio Z

%Funcao de transferencia de malha fechada do sistema discreto
Gmfz = feedback (Kp*Gz , 1);

%Recupera G para Simulink
[num, den] = tfdata(G, 'v');

%Plot do resultado do Simulink da saida y
figure
plot(out.y_c.Time, out.y_c.Data, 'b')
hold on
stairs(out.y_d.Time, out.y_d.Data, 'r')
legend(['continuo';'discreto']);
title('Sinal de saída y do sistema contínuo e discreto, com Simulink.')
xlabel('Time (seconds)')
ylabel('Amplitude da saída y(t)')

%Plot do resultado do Simulink da entrada da planta
figure
plot(out.u_c.Time, out.u_c.Data, 'b')
hold on
stairs(out.u_d.Time, out.u_d.Data, 'r')
legend(['continuo';'discreto']);
title('Sinal de entrada da planta do sistema contínuo e discreto, com Simulink.')
xlabel('Time (seconds)')
ylabel('Amplitude da entrada u(t)')

%Plot do resultado do Simulink do erro
figure
plot(out.e_c.Time, out.e_c.Data, 'b')
hold on
stairs(out.e_d.Time, out.e_d.Data, 'r')
legend(['continuo';'discreto']);
title('Sinal do erro e do sistema contínuo e discreto, com Simulink.')
xlabel('Time (seconds)')
ylabel('Amplitude do erro e(t)')

%Root Locus
figure
rlocus(G)

%Diagrama de Bode e margens de ganho/fase
figure
bode(G)
margin(G)

%Polo e zero das funcoes de transferencia continua em malha fechada
p = pole(Gmf);
z = zero(Gmf);

%Polo e zero das funcoes de transferencia discreta em malha fechada
dp = pole(Gmfz);
dz = zero(Gmfz);

%Plot da saída do sistema de malha fechada contínuo sobreposto ao discreto
figure
step(Gmf*R)
hold on
step(Gmfz*R)
title('Saídas do sistema de malha fechada contínuo e discreto')
ylabel('Amplitude R')
legend(['continuo';'discreto']);
