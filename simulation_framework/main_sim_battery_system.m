%% Info

% Open sim_batter_system.prj before executing this script!

clearvars;
clc;

disp('Starting simulation run.')


%% Define parameter sets

disp('Load system parameters.')

run parameters/cell_parameters_NCR18650PF_4RC.m             % Load cell parameters
run parameters/system_parameters.m                          % Load system parameters
load load_cycle.mat                                         % Load cycle for battery system (Example data for one individual 18650 cell) --> Gets scaled to system level further down!
t_init = 'parameters/system_initialization.m';              % Data with initial state for electrical and thermal simulation
t_ambient = 'parameters/ambient_temperature_parameters.m';  % Data specifying the ambient temperature around the cells and the heat transfer coefficients. Needed for all thermal simulations.


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

SimPara.SaveSettings     = true;       % Save generated parameter structs in the save file
SimPara.SaveResults      = true;        % Save simulation results in the save file

SimPara.ClearWorkspace   = false;       % Clear workspace after simulation (and saving)


%% Thermal system simulation (constant ambient temperatures)

% Enable or disable thermal simulation by setting "true" or "false". 
% If disabled: T_cell remains constant with the values specified in 'Initial State'.

% Those values are defined in 'system_parameters.m'
% Hint: Enable all thermal system variables with dummy values to avoid errors.

SimPara.thermal_sim_enable = true;  


%% Geometric system information

% Only needed and called if advanced thermal sim or temp sensor submodule is used.

t_geometric_info = 'parameters/geometric_system_parameters.m';


%% Advanced thermal simulation

% Use advanced simulation model to consider thermal interaction between
% cells. If this is set to "false" only the simple thermal model is used.

% If you set this to 'true' you must provide additional thermal
% parameters in thermal_system_parameters.m! Because additional geometric
% information about the system is needed SysPara.p and SysPara.s from
% 'system_parameters.m' get overwritten if this system is activated!

% Note: If activated this has a significant impact on execution time!

SimPara.heat_exchange_enable = true;        % Turn heat exchange between cells on/off

run parameters/heat_transfer_parameters.m   % Parameters for heat transfer submodel


%% Use temperature sensors submodule

% Simulate temperature sensors in the battery system. The temperature values
% of the sensors are written to 'T_sensors'. Refer to the script called 
% below for further information.

% Because additional geometric information about the system is needed 
% SysPara.p and SysPara.s from 'system_parameters.m' get overwritten if 
% this system is activated!

SimPara.TempSensors_enable = false;     % Turn temp. sensors on/off

run parameters/TempSens_parameters.m    % Parameters for temperature sensors


%% Load Spectrum Analysis of simulation data

% Perform Load Spectrum Analysis (LSA) on the simulation results.

% This is done during runtime and will massively decrease the amount of
% logging data, if you turn the timeseries logging of. You find the LSA
% subsystem here: sim_battery_system.slx/Monitoring and Logging/Load Spectrum Analysis
% Comment out all values including the subsystems you don't need.

% Note: Especially the three parametric LSA significantly add to the
% computational load for large battery systems! Test this impact before you
% turn on everything!

SimPara.LoadSpectra_enable = false;     % Turn LSA on/off

run parameters/LSA_parameters.m         % Parameters for Load Spectrum Analysis




% ############################################################################################
% ############## END OF USER INPUTS ########################################################## 
% ############################################################################################


%% Calculate additional thermal matrices for heat transfer and temperature sensor simulation

if SimPara.heat_exchange_enable == true || SimPara.TempSensors_enable == true
    
    disp('Calculate thermal properties.')
    
    run(t_geometric_info);
    
    if isfield(SysPara, 'pe') && isfield(SysPara, 'e')      % Check if geometric information was provided
    
        if SimPara.heat_exchange_enable == true             % Run initialization of heat transfer matrix
            SysPara.thermal.transfer.K_transfer = calc_heat_transfer_matrix(SysPara.pe, SysPara.e, SysPara.s,...
                SysPara.thermal.transfer.A_x, SysPara.thermal.transfer.A_y, SysPara.thermal.transfer.A_z,...
                SysPara.thermal.transfer.alpha_x, SysPara.thermal.transfer.alpha_y, SysPara.thermal.transfer.alpha_z,...
                SysPara.thermal.transfer.additional.layer, SysPara.thermal.transfer.additional.alpha, SysPara.thermal.transfer.additional.dir);
        end

        if SimPara.TempSensors_enable == true               % Run initialization of temperature sensor submodule
            SysPara.thermal.sensors.sensor_mat = create_sensor_def_matrix(SysPara.thermal.sensors.ranges, SysPara.p, SysPara.s);
        end
        
    else
        error('You must provide additional geometric parameters for the simulation of heat transfer and temperature sensors!')
    end

end


%% System initialization

disp('Load initial system values.')
run(t_init);
run(t_ambient);

% Scale cell level load cycle to size of parallel connection (needed for this specific example)

% REMOVE THIS IF YOU USE OTHER LOAD CYCLES!

load_cycle = load_cycle .* [1,1,SysPara.p];
load_cycle = load_cycle .* [1,SysPara.s,1];


%% Calculate the statistical parameter deviation for each cell in the system

disp('Calculate statistical parameter deviations.')
run subroutines/deviations_stat.m


%% Run simulation

disp('Battery system simulation.')

sim('sim_battery_system');

run stop_function


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