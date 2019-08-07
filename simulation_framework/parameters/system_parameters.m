%% Electrical Interconnection

SysPara.s = 3;  % Number of serial cells
SysPara.p = 6;  % Number of parallel cells


%% Cell balancing parameters

% Simple dissipate Balancing. Model assumption: Every individual cell has
% own balancing resistor. This allows individual balancing resistances per cell. 
% To represent one resistor per parallel connection use R_bal/BatSys.p

SysPara.Balancing.R       = 33 / SysPara.p;             % Balancing resistance per cell in Ohm
SysPara.Balancing.U_Delta = 0.01;                       % Minimum voltage difference between cells to start balancing in V                              
SysPara.Balancing.U_Limit = 3.8;                        % Lower voltage limit to allow balancing
SysPara.Balancing.I_Limit = SysPara.p * 0.5;            % Upper limit of battery system furrent load to allow balancing in A

SysPara.Balancing.t_Start = 0;                          % Specify simulation time after witch balancing is allowed. Set to 'inf' to disable balancing