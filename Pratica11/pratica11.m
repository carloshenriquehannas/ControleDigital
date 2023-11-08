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

k1 = place(F, H, [0.7703+0.1452i, 0.7703-0.1452i]);

%Plot do resultado do Simulink do espaco de estado
figure
stairs(out.x_d.Time, out.x_d.Data, 'r')
legend(['discreto x1'; 'discreto x2']);
title('Sinal de estados do sistema contínuo e discreto, com Simulink.')
xlabel('Time (seconds)')
ylabel('Estados do Sistema')

%Plot do resultado do Simulink da saida y
figure
stairs(out.y_d.Time, out.y_d.Data, 'r')
legend(['discreto']);
title('Sinal da saída y do sistema , com Simulink.')
xlabel('Time (seconds)')
ylabel('Amplitude da saída')

%Plot do resultado do Simulink da entrada u
figure
stairs(out.u_d.Time, out.u_d.Data, 'r')
legend(['discreto']);
title('Sinal da entrada u, com Simulink.')
xlabel('Time (seconds)')
ylabel('Amplitude da entrada')
