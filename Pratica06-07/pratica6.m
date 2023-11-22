close all;
%clear all;

%Constantes dadas
zeta = 1.011;
wn = 1.093;
R = 1.15;
Kp = 1;
%G = tf(wn^2, [1 2*zeta*wn wn^2]); %Funcao de Transferencia em malha aberta

wb = bandwidth(G); %Largura de banda em rad/s
f = wb/(2*pi); %Largura de banda em Hz

ws = 35*wb; 
T0 = (2*pi)/ws; %Periodo de amostragem

Gmf = feedback (G*C, 1);

p = pole(Gmf);
z = zero(Gmf);

%Plot do resultado do Simulink do erro
figure
stairs(out.e_c.Time, out.e_c.Data, 'b')
hold on
stairs(out.e_c1.Time, out.e_c1.Data, 'r')
%legend(['PID';'Controlador Proporcional'])
title('Sinal do erro dos sistemas PID e controlador proporcial, com Simulink.')
xlabel('Time (seconds)')
ylabel('Amplitude do erro e(t)')

%Plot do resultado do Simulink da entrada da planta
figure
stairs(out.u_c.Time, out.u_c.Data, 'b')
hold on
stairs(out.u_c1.Time, out.u_c1.Data, 'r')
%legend(['PID';'Controlador Proporcional'])
title('Sinal de entrada dos sistemas PID e controlador proporcial, com Simulink.')
xlabel('Time (seconds)')
ylabel('Amplitude da entrada u(t)')

%Plot do resultado do Simulink da saida y
figure
stairs(out.y_c.Time, out.y_c.Data, 'b')
hold on
stairs(out.y_c1.Time, out.y_c1.Data, 'r')
%legend(['PID';'Controlador Proporcional'])
title('Sinal de saída y dos sistemas PID e controlador proporcial, com Simulink.')
xlabel('Time (seconds)')
ylabel('Amplitude da saída y(t)')

i1 = find(out.y_c.Time <= 12);
stepinfo(out.y_c.Data(i1), out.y_c.Time(i1))

i2 = find(out.y_c1.Time <= 12);
stepinfo(out.y_c1.Data(i2), out.y_c1.Time(i2))