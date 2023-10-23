clear all %limpa o workspace
close all% fecha os arquivos abertos

% TODO: Alterar os valores para o seu caso
zeta = 1.011;
wn = 1.093; 
R = 1.15;
g = tf(wn^2, [1 2*zeta*wn wn^2]); % tf (transfer function): cria uma Funcao de Transferencia - coloca-se apenas os coeficientes do polinomio

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Grafico de Bode
figure
bode(g)  
grid
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Largura de Banda
% TODO: Colocar abaixo o valor de largura de banda para o seu caso. Usar o
% comando bandwidth ou encontrar pelo grafico de bode
wb =  bandwidth(g); % Valor da largura de banda em rad/s
fb =  0.692/(2*pi);  % Valor da largura de banda em em Hz
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Resposta degrau continua
Fc = 10000;    % Ferquencia de amostragem em Hz  
T = 15; % Tempo final da simulacao
t = 0:1/Fc:T; 
y = R*step(g,t);  % Resposta degrau unitario
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Para 1*fb %%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plotar a resposta degrau unitario contínua
figure
plot(t,y)
title('Resposta degrau do sistema')
xlabel('Tempo (t)')
ylabel('y(t)')
grid
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Resposta degrau discreta
hold on
F0 = 1*fb;    % Frequencia de amostragem in Hz    
T0 = 1/F0;    % Periodo de amostragem em segundos
t2 = 0:T0:T; % Time vector 
y2 = R*step(g,t2);  % Step response
stairs(t2,y2,'r')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Analise de Fourier
w0=F0*2*pi; % frequencia de amostragem do sinal discreto em rad/s
plot_fft_discreto(t,y,2*w0)  % t,y sao o vetor de tempo e sa?da da resposta degrau continua

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Para 2*fb %%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plotar a resposta degrau unitario contínua
figure
plot(t,y)
title('Resposta degrau do sistema')
xlabel('Tempo (t)')
ylabel('y(t)')
grid
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Resposta degrau discreta
hold on
F0 = 2*fb;    % Frequencia de amostragem in Hz    
T0 = 1/F0;    % Periodo de amostragem em segundos
t2 = 0:T0:T; % Time vector 
y2 = R*step(g,t2);  % Step response
stairs(t2,y2,'r')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Analise de Fourier
w0=F0*2*pi; % frequencia de amostragem do sinal discreto em rad/s
plot_fft_discreto(t,y,2*w0)  % t,y sao o vetor de tempo e sa?da da resposta degrau continua

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%% Para 5*fb %%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plotar a resposta degrau unitario contínua
figure
plot(t,y)
title('Resposta degrau do sistema')
xlabel('Tempo (t)')
ylabel('y(t)')
grid
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Resposta degrau discreta
hold on
F0 = 5*fb;    % Frequencia de amostragem in Hz    
T0 = 1/F0;    % Periodo de amostragem em segundos
t2 = 0:T0:T; % Time vector 
y2 = R*step(g,t2);  % Step response
stairs(t2,y2,'r')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Analise de Fourier
w0=F0*2*pi; % frequencia de amostragem do sinal discreto em rad/s
plot_fft_discreto(t,y,2*w0)  % t,y sao o vetor de tempo e sa?da da resposta degrau continua

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Para 10*fb %%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plotar a resposta degrau unitario contínua
figure
plot(t,y)
title('Resposta degrau do sistema')
xlabel('Tempo (t)')
ylabel('y(t)')
grid
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Resposta degrau discreta
hold on
F0 = 10*fb;    % Frequencia de amostragem in Hz    
T0 = 1/F0;    % Periodo de amostragem em segundos
t2 = 0:T0:T; % Time vector 
y2 = R*step(g,t2);  % Step response
stairs(t2,y2,'r')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Analise de Fourier
w0=F0*2*pi; % frequencia de amostragem do sinal discreto em rad/s
plot_fft_discreto(t,y,2*w0)  % t,y sao o vetor de tempo e sa?da da resposta degrau continua

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Para 35*fb %%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plotar a resposta degrau unitario contínua
figure
plot(t,y)
title('Resposta degrau do sistema')
xlabel('Tempo (t)')
ylabel('y(t)')
grid
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Resposta degrau discreta
hold on
F0 = 35*fb;    % Frequencia de amostragem in Hz    
T0 = 1/F0;    % Periodo de amostragem em segundos
t2 = 0:T0:T; % Time vector 
y2 = R*step(g,t2);  % Step response
stairs(t2,y2,'r')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Analise de Fourier
w0=F0*2*pi; % frequencia de amostragem do sinal discreto em rad/s
plot_fft_discreto(t,y,2*w0)  % t,y sao o vetor de tempo e sa?da da resposta degrau continua

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%