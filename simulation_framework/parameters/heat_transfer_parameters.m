%% Info

% heat transfer in all three spacial direction

% The spacial dimensions are considered as follows:

% x: direction of seriel interconnection
% y: direction of parallel interconnection
% z: layers of parallel interconnection

% idea: heat transfer to environment own subsystem because of btms
% simulation --> Link to repo sim_BTMS



%% Geometric arrangement of cells

% Go to geometric_system_parameters.m to define those parameters. If the
% heat transfer or temp sense submodule are activated those values will
% overwrite SysPara.p and SysPara.s from 'system_parameters'!



%% Define the default heat transfer between the cells

% If the heat transfer between cells must be considered you have to specify
% the heat conducting surface area in all three spacial directions. It is
% highly recommended to use the real cell dimensions here and set the correct
% heat transfer rate via the heat transfer coefficients.

% To consider different orientation of cells in your system exchange the
% values for the x/y/z dimensions so that your cell is oriented right in
% respect to the interconnection logic mentioned above.

SysPara.thermal.transfer.A_x = 18e-3 * 65e-3;  % heat conducting surface area of cell in x-direction in m^2
SysPara.thermal.transfer.A_y = 18e-3 * 65e-3;  % heat conducting surface area of cell in y-direction in m^2
SysPara.thermal.transfer.A_z = 18e-3^2 * pi;   % heat conducting surface area of cell in z-direction in m^2


% All thermal resistances and heat transfer effects between the cells are
% combined in a heat transfer coefficient alpha for each spacial direction.
% Set so zero if there is no heat transfer in one or more spacial
% directions.

SysPara.thermal.transfer.alpha_x = 30;     % heat transfer coefficient between the cells in x-direction in W/(m^2*K)
SysPara.thermal.transfer.alpha_y = 30;     % heat transfer coefficient between the cells in y-direction in W/(m^2*K)
SysPara.thermal.transfer.alpha_z = 30;     % heat transfer coefficient between the cells in z-direction in W/(m^2*K)



%% Option: Define different thermal properties at specific layers

% Here you can define specific thermal properties in specific layers of the
% battery system. E.g. if your battery system is split into modules you can
% define there is no thermal interaction between the modules. 

% The definition follows this logic:

% Layer: e.g. layer=2 means after the second cell in a spacial direction
% Alpha: the heat transfer coefficient for this layer. alpha=0 means there is no thermal interaction
% Direction: Either 'x', 'y' or 'z' see above what that means

% You can use any number of special definitons by using vectors for
% definition. To switch of this feature use empty vectors [] for all three
% values below.

SysPara.thermal.transfer.additional.layer = [];
SysPara.thermal.transfer.additional.alpha = [];
SysPara.thermal.transfer.additional.dir   = [];


%% Test thermal setup

% Comment in and run the following functions:

% run('geometric_system_parameters')
% 
% [SysPara.thermal.transfer.K_transfer] = calc_heat_transfer_matrix(SysPara.pe, SysPara.e, SysPara.s,...
%     SysPara.thermal.transfer.A_x, SysPara.thermal.transfer.A_y, SysPara.thermal.transfer.A_z,...
%     SysPara.thermal.transfer.alpha_x, SysPara.thermal.transfer.alpha_y, SysPara.thermal.transfer.alpha_z,...
%     SysPara.thermal.transfer.additional.layer, SysPara.thermal.transfer.additional.alpha, SysPara.thermal.transfer.additional.dir);
% 
% plot_thermal_sys_archit(SysPara.thermal.transfer.K_transfer)