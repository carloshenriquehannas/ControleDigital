close all;
%clear all;

%Constantes dadas
zeta = 1.011;
wn = 1.093;
R = 1.15;
G = tf(wn^2, [1 2*zeta*wn wn^2]); %Funcao de transferencia da planta

wb = bandwidth(G); %Largura de banda em rad/s
f = wb/(2*pi); %Largura de banda em Hz
ws = 20*wb; 
T01 = (2*pi)/ws; %Periodo de amostragem 1
T02 = 1.33*T01; %Periodo de amostragem 2

Gz1 = c2d(G, T01, 'zoh'); %Funcao de transferencia discreta da planta com zero holder
Gz2 = c2d(G, T02, 'zoh'); %Funcao de transferencia discreta da planta com zero holder

[num1, den1] = tfdata(Gz1, 'v');
[num2, den2] = tfdata(Gz2, 'v');

%Coeficientes Q controlador DB
q0 = 1/sum(num1);
q1 = den1(2)*q0;
q2 = den1(3)*q0;

%Coeficientes P do controlador DB
p1 = num1(2)*q0;
p2 = num1(3)*q0; 

%Coeficientes Q controlador DB
q0_2 = 1/sum(num2);
q1_2 = den2(2)*q0_2;
q2_2 = den2(3)*q0_2;

%Coeficientes P do controlador DB
p1_2 = num2(2)*q0_2;
p2_2 = num2(3)*q0_2; 

Gdb1 = tf([q0 q1 q2], [1 -p1 -p2], T01); %Funcao de transferencia do controlador DB
Gdb2 = tf([q0_2 q1_2 q2_2], [1 -p1_2 -p2_2], T02);

%Plot do resultado do Simulink da saida y
figure
stairs(out.y_c1.Time, out.y_c1.Data, 'b')
hold on
stairs(out.y_c2.Time, out.y_c2.Data, 'r')
legend('Periodo original','Periodo alterado');
title('Sinal de saída y dos sistemas, com Simulink.')
xlabel('Time (seconds)')
ylabel('Amplitude da saída y(t)')

%Plot do resultado do Simulink da entrada da planta
figure
stairs(out.u_c1.Time, out.u_c1.Data, 'b')
hold on
stairs(out.u_c2.Time, out.u_c2.Data, 'r')
legend('Periodo original','Periodo alterado');
title('Sinal de entrada das plantas dos sistemas, com Simulink.')
xlabel('Time (seconds)')
ylabel('Amplitude da entrada u(t)')

%Plot do resultado do Simulink do erro
figure
stairs(out.e_c1.Time, out.e_c1.Data, 'b')
hold on
stairs(out.e_c1.Time, out.e_c2.Data, 'r')
legend('Periodo original','Periodo alterado');
title('Sinal do erro dos sistemas, com Simulink.')
xlabel('Time (seconds)')
ylabel('Amplitude do erro e(t)')

%Funcao de transferencia para malha fechada de DB
Gmf1 = feedback(Gdb1*Gz1, 1);
Gmf2 = feedback(Gdb2*Gz2, 1);

%Polos para funcao de transferencia em malha fechada
pole1 = pole(Gmf1);
pole2 = pole(Gmf2);

i1 = find(out.y_c1.Time <= 12);
stepinfo(out.y_c1.Data(i1), out.y_c1.Time(i1))

i2 = find(out.y_c2.Time <= 12);
stepinfo(out.y_c2.Data(i2), out.y_c2.Time(i2))