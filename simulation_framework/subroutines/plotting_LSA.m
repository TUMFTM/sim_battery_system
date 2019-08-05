%% Info

% Create Plots for load spectrum analysis

% This function plots one and two parametric LSA results. For three
% parametric LSA no universal representation exists, so it's not included
% here.
% The standard things are implemented, use those as templates if you
% want more parameters visualized.


%% One parametric LSA 

% SOC
if exist('LSA_IVC_SOC_all', 'var')
    t_fighandle = figure('Name','LSA SOC');
    bar(LSAPara.bins_mean_SOC, LSA_IVC_SOC_all / sum(LSA_IVC_SOC_all));
    title('LSA of SOC');
    xlabel('SOC');
    ylabel('Residence time in %');
    if SimPara.SavePlots == true
        savefig(t_fighandle, join([t_figfolder, 'LSA_IVC_SOC.fig'],''), 'compact');
    end
end

% Temperatures
if exist('LSA_IVC_T_all', 'var')
    t_fighandle = figure('Name','LSA T_cell');
    bar(LSAPara.bins_mean_T, LSA_IVC_T_all / sum(LSA_IVC_T_all));
    title('LSA of cell temp');
    xlabel('Temperature in °C');
    ylabel('Residence time in %');
    if SimPara.SavePlots == true
        savefig(t_fighandle, join([t_figfolder, 'LSA_IVC_T_cell.fig'],''), 'compact');
    end
end

% C-Rate
if exist('LSA_IVC_Crt_all', 'var')
    t_fighandle = figure('Name','LSA C-Rate');
    bar(LSAPara.bins_mean_Crt, LSA_IVC_Crt_all / sum(LSA_IVC_Crt_all));
    title('LSA of C-Rate');
    xlabel('C-Rate in 1/h');
    ylabel('Residence time in %');
    if SimPara.SavePlots == true
        savefig(t_fighandle, join([t_figfolder, 'LSA_IVC_Crt.fig'],''), 'compact');
    end
end

% delta C-Rate
if exist('LSA_IVC_delta_Crt_all', 'var')
    t_fighandle = figure('Name','LSA delta C-Rate');
    bar(LSAPara.bins_mean_delta_Crt, LSA_IVC_delta_Crt_all / sum(LSA_IVC_delta_Crt_all));
    title('LSA of delta C-Rate');
    xlabel('delta C-Rate in 1/h');
    ylabel('Residence time in %');
    if SimPara.SavePlots == true
        savefig(t_fighandle, join([t_figfolder, 'LSA_IVC_delta_Crt.fig'],''), 'compact');
    end
end

% delta temperatures
if exist('LSA_IVC_delta_T_all', 'var')
    t_fighandle = figure('Name','LSA delta T_cell');
    bar(LSAPara.bins_mean_delta_T, LSA_IVC_delta_T_all / sum(LSA_IVC_delta_T_all));
    title('LSA of delta cell temp');
    xlabel('delta temperature in °C');
    ylabel('Residence time in %');
    if SimPara.SavePlots == true
        savefig(t_fighandle, join([t_figfolder, 'LSA_IVC_delta_T_cell.fig'],''), 'compact');
    end
end



%% Two parametric LSA 

% SOC vs. temperatures
if exist('LSA_IVC_SOC_T_all', 'var')
    t_fighandle = figure('Name','LSA SOC vs. T_cell');
    contourf(LSAPara.bins_mean_T, LSAPara.bins_mean_SOC, LSA_IVC_SOC_T_all / sum(sum(LSA_IVC_SOC_T_all)));
    title('LSA of SOC vs. T_cell');
    xlabel('Temperature in °C');
    ylabel('SOC');
    c = colorbar;
    c.Label.String = 'Residence time in %';
    if SimPara.SavePlots == true
        savefig(t_fighandle, join([t_figfolder, 'LSA_IVC_SOC-T_cell.fig'],''), 'compact');
    end
end

% SOC vs. C-Rate
if exist('LSA_IVC_SOC_Crt_all', 'var')
    t_fighandle = figure('Name','LSA SOC vs. C-Rate');
    contourf(LSAPara.bins_mean_Crt, LSAPara.bins_mean_SOC, LSA_IVC_SOC_Crt_all / sum(sum(LSA_IVC_SOC_Crt_all)));
    title('LSA of SOC vs. C-Rate');
    xlabel('C-Rate in 1/h');
    ylabel('SOC');
    c = colorbar;
    c.Label.String = 'Residence time in %';
    if SimPara.SavePlots == true
        savefig(t_fighandle, join([t_figfolder, 'LSA_IVC_SOC-Crt.fig'],''), 'compact');
    end
end

% C-Rate vs. temperatures
if exist('LSA_IVC_Crt_T_all', 'var')
    t_fighandle = figure('Name','LSA C-Rate vs. T_cell');
    contourf(LSAPara.bins_mean_T, LSAPara.bins_mean_Crt, LSA_IVC_Crt_T_all / sum(sum(LSA_IVC_Crt_T_all)));
    title('LSA of C-Rate vs. T_cell');
    xlabel('Temperature in °C');
    ylabel('C-Rate in 1/h');
    c = colorbar;
    c.Label.String = 'Residence time in %';
    if SimPara.SavePlots == true
        savefig(t_fighandle, join([t_figfolder, 'LSA_IVC_Crt-T_cell.fig'],''), 'compact');
    end
end