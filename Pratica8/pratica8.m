close all;
%clear all;

%Constantes dadas
zeta = 1.011;
wn = 1.093;
R = 1.15;

G = tf(wn^2, [1 2*zeta*wn wn^2]); %Funcao de transferencia continua 

wb = bandwidth(G); %Largura de banda em rad/s
f = wb/(2*pi); %Largura de banda em Hz

ws = 35*wb; 
T0 = (2*pi)/ws; %Periodo de amostragem

Gz = c2d(G, T0, 'zoh'); %Funcao de transferencia discreta

%Matrizes do Espaco de estado continuo do sistema G
[num, den] = tfdata(G, 'v');
[Ac, Bc, Cc, Dc] = tf2ss(num, den);

%Representacao do espaco de estado continuo e discreto
ss_c = ss(Ac, Bc, Cc, Dc);
ss_d = c2d(ss_c, T0);
F = ss_d.A;
H = ss_d.B;
Cd = ss_d.C;
Dd = ss_d.D;

%Plot do resultado do Simulink do espaco de estado
figure
plot(out.x.Time, out.x.Data, 'b')
hold on
stairs(out.x_d.Time, out.x_d.Data, 'r')
legend(['continuo x1'; 'continuo x2';'discreto x1'; 'discreto x2']);
title('Sinal de estados do sistema contínuo e discreto, com Simulink.')
xlabel('Time (seconds)')
ylabel('Amplitude do estado')

%Plot do resultado do Simulink da saida y
figure
plot(out.y.Time, out.y.Data, 'b')
hold on
stairs(out.y_d.Time, out.y_d.Data, 'r')
legend(['continuo';'discreto']);
title('Sinal da saída y do sistema contínuo e discreto, com Simulink.')
xlabel('Time (seconds)')
ylabel('Amplitude da saída')