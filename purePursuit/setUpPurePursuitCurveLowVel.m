% Pure Pursuit Model Initialization
%
% Copyright 2020 The MathWorks, Inc.

%% add Image to the path
addpath(genpath('Images'));

%% load the scene data file generated from Driving Scenario Designer
% load('curveLowVel.mat');

%% define reference points
% refPose = data.ActorSpecifications.Waypoints;
% xRef = refPose(:,1);
% yRef = -refPose(:,2);

% % 후진용: 마지막 → 첫 번째 순서로 뒤집기
% refPose = flipud(refPose);
% 
% xRef = refPose(:,1);
% yRef = -refPose(:,2);

%% define reference time for plotting 
% Ts = 16; % simulation time (16)
% s = size(xRef);
% tRef = (linspace(0,Ts,s(1)))'; % this time variable is used in the "2D Visualization" block for plotting the reference points. 

%% define parameters used in the models
data = readmatrix('sim_output_pp.xlsx');   % 파일 이름 맞게
waypoints = data(:, 1:2);           % X,Y만 사용 (N×2 행렬)

L = 3; % bicycle length
ld = 5; % lookahead distance

% X_o = refPose(1,1); % initial vehicle position
% Y_o = -refPose(1,2); % initial vehicle position 
% psi_o = 0; % initial yaw angle

%% 정량평가용 파일 만들기 (simulink 끝나고 따로 명령창에 치면 됨)
T = table(out.X_target.Data, out.Y_target.Data, out.Xo.Data, out.Yo.Data, ...
    'VariableNames', {'X_target', 'Y_target', 'Xo', 'Yo'});
writetable(T, 'sim_output_pp.xlsx', 'WriteVariableNames', true);