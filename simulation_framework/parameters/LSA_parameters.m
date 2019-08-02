%% Specify bin sizes

no_bins_SOC = 12;         % Number of bins for cell SOCs
no_bins_T   = 10;         % Number of bins for cell temperatures
no_bins_Crt = 20;         % Number of bins for cell C-Rates
no_bins_U   = 10;         % Number of bins for cell voltages

no_bins_delta_T = 20;     % Number of bins for delta temperature between cells
no_bins_delta_Crt = 20;   % Number of bins for delta C-Rate between cells



%% Specify upper and lower borders of load spectra

% This, together with the bin sizes specified above will determine the bins
% for the load spectrum analysis

% Example:

% SOC

min_val_SOC = -0.1;     % Lower border
max_val_SOC =  1.1;     % Upper border


% Cell temperatures

min_val_T = 20;         % Lower border
max_val_T = 42;         % Upper border


% Cell C-Rates

min_val_Crt = -4;        % Lower border
max_val_Crt = 1;        % Upper border


% Cell voltages

min_val_U = 2.2;        % Lower border
max_val_U = 4.5;        % Upper border


% delta Temperature (relative to the lowest cell temperature per time-step)

min_val_delta_T = 0;    % Lower border
max_val_delta_T = 10;   % Upper border  


% delta C-Rate (relative to the lowest cell C-Rate per time-step)

min_val_delta_Crt = 0;  % Lower border
max_val_delta_Crt = 1;  % Upper border


%% Calculate the bins (do not edit!)

[LSAPara.bins_mean_SOC, LSAPara.bins_borders_SOC] = calc_LSA_bins(no_bins_SOC, min_val_SOC, max_val_SOC);
[LSAPara.bins_mean_T, LSAPara.bins_borders_T] = calc_LSA_bins(no_bins_T, min_val_T, max_val_T);
[LSAPara.bins_mean_Crt, LSAPara.bins_borders_Crt] = calc_LSA_bins(no_bins_Crt, min_val_Crt, max_val_Crt);
[LSAPara.bins_mean_U, LSAPara.bins_borders_U] = calc_LSA_bins(no_bins_U, min_val_U, max_val_U);
[LSAPara.bins_mean_delta_T, LSAPara.bins_borders_delta_T] = calc_LSA_bins(no_bins_delta_T, min_val_delta_T, max_val_delta_T);
[LSAPara.bins_mean_delta_Crt, LSAPara.bins_borders_delta_Crt] = calc_LSA_bins(no_bins_delta_Crt, min_val_delta_Crt, max_val_delta_Crt);


%% Clear unneeded vars

clearvars min_* max_* no_*

    