%% Info

% This script defines the temperature sensor positions in the battery
% system. You must specify what cells are part of one temperature sensor.
% The definition is done via the cell ID. They can be visualized by running 
% the following function:

% plot_system_geometry(SysPara.s, SysPara.pe, SysPara.e)


%% Sensor definitons

% Define the sensor ranges in the folling form:

% SysPara.thermal.sensors.ranges = {[Sensor 1], [Sensor 2], [Sensor 3]};
% Provide [Sensor x] as row vectors

% An example is provided below:

SysPara.thermal.sensors.ranges = {...
    [1,2,3],...
    [4,5],...
    6};

% As you can see, the vectors do not need to have the same length.

