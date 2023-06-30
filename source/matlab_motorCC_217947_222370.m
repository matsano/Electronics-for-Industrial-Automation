%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                         %
%   Eletrônica para Automação Industrial - ES663          %
%                                                         % 
%   Projeto de Controle de Motor CC                       %
%                                                         % 
%   Igor Barros Teixeira - RA 217947                      %
%   Matheus Santos Sano  - RA 222370                      %
%                                                         % 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% O motor utilizado aqui possui imas permanentes no estator (campo)
% As bobinas sao alimentadas pelo comutador (armadura)

% Parametros de placa do motor
Potencia = 3336; % Potencia [W]
Va_placa = 140;  % Tensao de armadura [V]
Ia_placa = 25;   % Corrente de armadura [A]
Wm_placa = 3000*2*pi/60; % Velocidade angular [rad/s]
Te_placa = Potencia/Wm_placa; % Torque [Nm]

% Parametros eletricos
Va = Va_placa; % Tensao de entrada na armadura
La = 1.7e-3; % Impedancia da armadura [H]
Ra = 0.26; % Resistencia da armadura [Ohm]

% Parametros mecanicos
J = 0.00252;  % Momento de inercia do motor [kg*m^2]
B = 0;  % Atrito do motor [kg*m^2/sec]

% Considerando Kt=Ke de acordo com o livro e K=Kt*phi=Ke*phi
K = Te_placa/Ia_placa; % Te = Kt*phi*Ia  Kt*phi=K=Te/Ia


%% Ganhos do controlador de corrente

wcc = 1000;   % Largura de banda [Hz]

Kpc = La*wcc; % Ganho proporcional
Kic = Ra*wcc; % Ganho integral
Kac = 1/Kpc;  % Ganho anti-wind up (evitar saturacao)



%% Ganhos do controlador de velocidade


wcs = wcc/10;        % Largura de banda [Hz]

Kps = J*wcs/K;       % Ganho proporcional
Kis = J*wcs^2/(5*K); % Ganho integral
Kas = 1/Kps;         % Ganho anti-wind up (evitar saturacao)






