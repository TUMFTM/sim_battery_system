%% Info

% If the heat transfer and temperature sensor submodules are activated
% information about the geometric orientatin of the cells is required. In
% this case this script will get called and will overwrite SysPara.p and 
% SysPara.s from 'system_parameters'.


%% Definitions

SysPara.s  = 3;     % Number of serial cells

SysPara.pe = 3;     % Number of parallel cells per layer     
SysPara.e  = 2;     % Number of layers


%% Calculate number of parallel cells

SysPara.p = SysPara.pe * SysPara.e;     % p = number of parallel cells per layer * number of layers


%% Test geometric setup

% Comment in run the following function:

% plot_system_geometry(SysPara.s, SysPara.pe, SysPara.e)