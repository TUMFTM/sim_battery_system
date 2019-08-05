%% Info

% Open sim_batter_system.prj before executing this script!

clearvars;
clc;

disp('Starting simulation run.')


%% Load system parameters

disp('Load system parameters.')

run parameters/cell_parameters_NCR18650PF_4RC.m;     % Load cell parameters
run parameters/system_parameters.m;                  % Load system parameters
load load_cycle.mat                                  % Load cycle for battery system (Example data for one individual 18650 cell)

% Scale cell level load cycle to size of parallel connection (needed for this specific example)
load_cycle = load_cycle .* [1,1,SysPara.p];
load_cycle = load_cycle .* [1,SysPara.s,1];


%% Specify simulation-specific parameters

SimPara.t_step  = 0.01;                         % Set simulation step-size in s. Obviously this has a huge impact on simulation time, but note the simulation may get unstable, if you use RC-elements with small time constants.
SimPara.t_sim   = load_cycle(end,1)+10000;      % Set end time of simulation in s

% Different options for post-processing of simulation results and settings.

% Saved simulation results are placed in the folder 'simulation results'.
% Saved data is placed in a mat-File with date and time-stamp.
% Saved plots (as .fig) are placed in a folder with date and timestamp.
% Data from simulation output can be specified in the simulation model.
% See: sim_battery_system.slx/Monitoring and Logging/Logging of Variables

SimPara.LoggingOutput    = true;        % Log all variables specified in 'sim_battery_system.slx/Monitoring and Logging/Logging of Variables' in timeseries format
SimPara.OutputDataType   = 'single';    % Data type of simulation output. Note: Simulation is always done in double precision
SimPara.OutputDecimation = 100;         % Log (and therefore plot and save) only every n-th value.

SimPara.PlotResults      = true;        % Plot all available data (everything that gets logged in the model). If set 'false' there are no plot, or, if plots are saved they are closed after saving.
SimPara.SavePlots        = true;       % Save all plots in a folder with current time in ..\simulation_results (.fig format)

SimPara.SaveSettings     = false;       % Save generated parameter structs in the save file
SimPara.SaveResults      = true;        % Save simulation results in the save file

SimPara.ClearWorkspace   = false;       % Clear workspace after simulation (and saving)


%% Thermal system parameters (constant ambient temperatures)

% Enable or disable thermal simulation by setting "true" or "false". 
% If disabled: T_cell remains constant with the values specified in 'Initial State'.
% Hint: Enable all thermal system variables with dummy values to avoid errors.

SimPara.thermal_sim_enable = false;  

% Use advanced simulation model to consider thermal interaction between
% cells. If this is set to "false" only the simple thermal model is used.

% Note: If you set this to 'true' you must provide additional thermal
% parameters in thermal_system_parameters.m!

SimPara.heat_exchange_enable = false; 


%% Load Spectrum Analysis of simulation data

% Perform Load Spectrum Analysis (LSA) on the simulation results.

% This is done during runtime and will massively decrease the amount of
% logging data, if you turn the timeseries logging of. You find the LSA
% subsystem here: sim_battery_system.slx/Monitoring and Logging/Load Spectrum Analysis
% Comment out all values including the subsystems you don't need.

% Note: Especially the three parametric LSA significantly add to the
% computational load for large battery systems! Test this impact before you
% turn on everything!

SimPara.LoadSpectra     = false;        % Turn LSA on/off

run parameters/LSA_parameters.m         % Parameters for Load Spectrum Analysis


%% Use temperature sensors submodule

% Simulate temperature sensors in the battery system. Refer to the script
% called below for further information.

% If you set this value to false nothing regarding the temperature sensors
% will get simulated so the simulation time is not impacted.

SimPara.TempSensors = false;

run parameters/TempSens_parameters.m


%% Calculate the statistical parameter deviation for each cell in the system

run subroutines/deviations_stat.m


%% Run simulation

disp('Battery system simulation.')

sim('sim_battery_system');


%% Get save folder and current time

% Required for subroutines/saving.m and subroutines/plotting.m

run subroutines\get_save_folder_and_time.m


%% Save simulation results

run subroutines/saving.m


%% Plot simulation results

run subroutines/plotting.m


%% Postprocessing

disp('Starting postprocessing')

clearvars t_*       % Delete temporary variables

if SimPara.ClearWorkspace == true
    clearvars
end

disp('Simulation run finished.')