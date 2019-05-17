%% Get save folder and current time

% Required for subroutines/saving.m and subroutines/plotting.m

cd ..\      % Move up one folder to get in the main folder
t_save_folder = [pwd, '\', 'simulation_results', '\'];
t_datetime = string(datetime('now','Format','yyyy-MM-dd_HH-mm-ss'));