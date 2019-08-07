%% Info

% Initial values for electrical and thermal system


%% Initial State

% Initial state of every individual cell insode the system (hence the
% 'ones(BatSys.p,BatSys.s)'). This allows the adaption to measurement data or to induce
% initial load imbalances or thermal gradients.

% In our example, there is a inbalance of SOC, represented as a normal
% distribution randn(BatSys.p,BatSys.s).

SysPara.BatStateInit.electrical.SOC    = ones(SysPara.p,SysPara.s) * 0.81 + randn(SysPara.p,SysPara.s)*0.01;  
SysPara.BatStateInit.electrical.U_hyst = ones(SysPara.p,SysPara.s) * 0;
SysPara.BatStateInit.electrical.U_RC1  = ones(SysPara.p,SysPara.s) * 0;
SysPara.BatStateInit.electrical.U_RC2  = ones(SysPara.p,SysPara.s) * 0;
SysPara.BatStateInit.electrical.U_RC3  = ones(SysPara.p,SysPara.s) * 0;
SysPara.BatStateInit.electrical.U_RC4  = ones(SysPara.p,SysPara.s) * 0;
SysPara.BatStateInit.electrical.I_cell = ones(SysPara.p,SysPara.s) * 0;

% Thermal initialization. Even if you don't use the thermal submodel you
% must specify something!

SysPara.BatStateInit.thermal.T_cell    = ones(SysPara.p,SysPara.s) * 20;