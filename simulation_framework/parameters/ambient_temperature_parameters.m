%% Parameters needed for heat exchange with environment (no thermal interaction between cells)

% Simple thermal model. Assume constant ambient temperature around each
% cell and constant heat transfer coefficient. Again, one value must be
% specified for each cell. Dynamic inputs can be specified in the
% simulation model.

SysPara.thermal.T_cell_ambient = ones(SysPara.p,SysPara.s) * 25;   %Ambient temperature around each cell in °C

% As an example, we set the ambient temp. of some outer cells of the system
% to 23 °C to show the ability of the model to react to different cooling
% properties. This could be achieved by an active thermal management system
% surrounding the module.

SysPara.thermal.T_cell_ambient(1,:)         = 23;
SysPara.thermal.T_cell_ambient(SysPara.p,:) = 23;

SysPara.thermal.alpha_cell_ambient = ones(SysPara.p,SysPara.s) * 15;   % Heat transfer coefficient between cells and environment in W/(m^2*K)