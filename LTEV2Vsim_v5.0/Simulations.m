close all    % Close all open figures
clear        % Reset variables
clc          % Clear the command window

% 기본 파라미터값 확인
% LTEV2Vsim('help');

% Configuration file
configFile = 'BenchmarkPoisson.cfg';

%% LTE Autonomous (3GPP Mode 4) - on a subframe basis
% Autonomous allocation algorithm defined in 3GPP standard
% 환경변수 설정
LTEV2Vsim(configFile,'simulationTime',10,'roadLength',3000,'rho',360,'RSUratio', 0.5,'vMean',110,...
    'cbrSensingInterval',0.1,'MCS_LTE',7,'BRAlgorithm',18,'probResKeep',0.8,'Raw',150,'printCBR',true,'printUpdateDelay',false);
% LTEV2Vsim(configFile,'simulationTime',10,'roadLength',3000,'rho',360,'RSUratio', 0,'vMean',110,...
%     'cbrSensingInterval',0.1,'MCS_LTE',7,'BRAlgorithm',18,'probResKeep',0.8,'Raw',150,'printCBR',true,'printUpdateDelay',false);


% rho는 차량 밀도(개/km)
% Raw는 다른 차량 인식 가능 범위(m)
% vMean은 차량들의 평균 속도(km/h)
