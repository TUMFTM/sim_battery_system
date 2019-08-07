% Run subroutines/get_save_folder_and_time.m first for this script to work!

if SimPara.PlotResults == true || SimPara.SavePlots == true
    
    close all hidden    % Close any open figures
    
    if SimPara.SavePlots == true
        disp('Starting plotting and saving figures.')
        t_figfolder = join([t_save_folder, 'Plots_', t_datetime, '\'], '');
        mkdir(t_figfolder);
    else
        disp('Starting plotting.')
    end   


    % Create list for cell legend
    t_Index=1;
    t_ListLegend=cell(SysPara.p*SysPara.s,1);
    for t_i=1:SysPara.s
        for t_j=1:SysPara.p
    t_ListLegend{t_Index,1}=['Cell ',num2str(t_j),'p',num2str(t_i),'s'];           
    t_Index=t_Index+1;
        end
    end
    t_ListLegend=cellstr(t_ListLegend);

    % Battery system current load
    if exist('I_load', 'var')
        t_fighandle = figure('Name','Battery system current load');
        plot(I_load);
        grid on;
        axis tight;
        title('Battery system current load');
        xlabel('Time in seconds');
        ylabel('Electric current in Amperes');
        legend('Battery system');
        if SimPara.SavePlots == true
            savefig(t_fighandle, join([t_figfolder, 'I_load.fig'],''), 'compact');
        end
    end

    % Cattery system voltage
    if exist('U_Pack', 'var')
        t_fighandle = figure('Name','Battery system voltage');
        plot(U_Pack);
        grid on;
        axis tight;
        title('Battery system voltage');
        xlabel('Time in seconds');
        ylabel('Voltage in Volts');
        legend('Battery system');
        if SimPara.SavePlots == true
            savefig(t_fighandle, join([t_figfolder, 'U_Pack.fig'],''), 'compact');
        end
    end

    % Cell current loads
    if exist('I_cell', 'var')
        t_fighandle = figure('Name','Cell current loads');
        plot(I_cell);
        grid on;
        axis tight;
        title('Cell current loads');
        xlabel('Time in seconds');
        ylabel('Electric current in Amperes');
        legend(t_ListLegend);
        if SimPara.SavePlots == true
            savefig(t_fighandle, join([t_figfolder, 'I_cell.fig'],''), 'compact');
        end
    end

    % Cell voltages
    if exist('U_cell', 'var')
        t_fighandle = figure('Name','Cell voltages');
        plot(U_cell);
        grid on;
        axis tight;
        title('Cell voltages');
        xlabel('Time in seconds');
        ylabel('Voltage in Volts');
        legend(t_ListLegend);
        if SimPara.SavePlots == true
            savefig(t_fighandle, join([t_figfolder, 'U_cellfig'],''), 'compact');
        end
    end

    % Cell state-of-charges
    if exist('SOC', 'var')
        t_fighandle = figure('Name','Cell state-of-charges');
        plot(SOC);
        grid on;
        axis tight;
        title('Cell state-of-charges');
        xlabel('Time in seconds');
        ylabel('SOC');
        legend(t_ListLegend);
        if SimPara.SavePlots == true
            savefig(t_fighandle, join([t_figfolder, 'SOC.fig'],''), 'compact');
        end
    end

    % Cell open circuit voltages
    if exist('U_OCV', 'var')
        t_fighandle = figure('Name','Cell open circuit voltages');
        plot(U_OCV);
        grid on;
        axis tight;
        title('Cell open circuit voltages');
        xlabel('Time in seconds');
        ylabel('Voltage in Volts');
        legend(t_ListLegend);
        if SimPara.SavePlots == true
            savefig(t_fighandle, join([t_figfolder, 'U_OCV.fig'],''), 'compact');
        end
    end

    % Cell hysteresis voltages
    if exist('U_Hysteresis', 'var')
        t_fighandle = figure('Name','Cell hysteresis voltages');
        plot(U_Hysteresis);
        grid on;
        axis tight;
        title('Cell hysteresis voltages');
        xlabel('Time in seconds');
        ylabel('Voltage in Volts');
        legend(t_ListLegend);
        if SimPara.SavePlots == true
            savefig(t_fighandle, join([t_figfolder, 'U_Hysteresis.fig'],''), 'compact');
        end
    end

    % Cell ECM first RC-element voltages
    if exist('U_RC1', 'var')
        t_fighandle = figure('Name','Cell ECM first RC-element voltages');
        plot(U_RC1);
        grid on;
        axis tight;
        title('Cell ECM first RC-element voltages');
        xlabel('Time in seconds');
        ylabel('Voltage in Volts');
        legend(t_ListLegend);
        if SimPara.SavePlots == true
            savefig(t_fighandle, join([t_figfolder, 'U_RC1.fig'],''), 'compact');
        end
    end

    % Cell ECM second RC-element voltages
    if exist('U_RC2', 'var')
        t_fighandle = figure('Name','Cell ECM second RC-element voltages');
        plot(U_RC2);
        grid on;
        axis tight;
        title('Cell ECM second RC-element voltages');
        xlabel('Time in seconds');
        ylabel('Voltage in Volts');
        legend(t_ListLegend);
        if SimPara.SavePlots == true
            savefig(t_fighandle, join([t_figfolder, 'U_RC2.fig'],''), 'compact');
        end
    end
    
    % Cell ECM second RC-element voltages
    if exist('U_RC3', 'var')
        t_fighandle = figure('Name','Cell ECM third RC-element voltages');
        plot(U_RC3);
        grid on;
        axis tight;
        title('Cell ECM third RC-element voltages');
        xlabel('Time in seconds');
        ylabel('Voltage in Volts');
        legend(t_ListLegend);
        if SimPara.SavePlots == true
            savefig(t_fighandle, join([t_figfolder, 'U_RC3.fig'],''), 'compact');
        end
    end
    
    % Cell ECM second RC-element voltages
    if exist('U_RC4', 'var')
        t_fighandle = figure('Name','Cell ECM forth RC-element voltages');
        plot(U_RC4);
        grid on;
        axis tight;
        title('Cell ECM forth RC-element voltages');
        xlabel('Time in seconds');
        ylabel('Voltage in Volts');
        legend(t_ListLegend);
        if SimPara.SavePlots == true
            savefig(t_fighandle, join([t_figfolder, 'U_RC4.fig'],''), 'compact');
        end
    end
    
    % Cell ECM sum of cell RC-element voltages
    if exist('sum_U_RC', 'var')
        t_fighandle = figure('Name','Cell ECM sum of cell RC-element voltages');
        plot(sum_U_RC);
        grid on;
        axis tight;
        title('Cell ECM sum of cell RC-element voltages');
        xlabel('Time in seconds');
        ylabel('Voltage in Volts');
        legend(t_ListLegend);
        if SimPara.SavePlots == true
            savefig(t_fighandle, join([t_figfolder, 'U_RC4.fig'],''), 'compact');
        end
    end

    % Cell electric potential
    if exist('U_Potential', 'var')
        t_fighandle = figure('Name','Cell electric potential');
        plot(U_Potential);
        grid on;
        axis tight;
        title('Cell electric potential');
        xlabel('Time in seconds');
        ylabel('Voltage in Volts');
        legend(t_ListLegend);
        if SimPara.SavePlots == true
            savefig(t_fighandle, join([t_figfolder, 'U_Potential.fig'],''), 'compact');
        end
    end

    % Cell ohmic voltage drops
    if exist('U_R', 'var')
        t_fighandle = figure('Name','Cell ohmic voltage drops');
        plot(U_R);
        grid on;
        axis tight;
        title('Cell ohmic voltage drops');
        xlabel('Time in seconds');
        ylabel('Voltage in Volts');
        legend(t_ListLegend);
        if SimPara.SavePlots == true
            savefig(t_fighandle, join([t_figfolder, 'U_R.fig'],''), 'compact');
        end
    end

    % Cell internal resistances
    if exist('R_0', 'var')
        t_fighandle = figure('Name','Cell internal resistances');
        plot(R_0);
        grid on;
        axis tight;
        title('Cell internal resistances');
        xlabel('Time in seconds');
        ylabel('Resistance in Ohm');
        legend(t_ListLegend);
        if SimPara.SavePlots == true
            savefig(t_fighandle, join([t_figfolder, 'R_0.fig'],''), 'compact');
        end
    end

    % Cell ECM R1 resistance
    if exist('R1', 'var')
        t_fighandle = figure('Name','Cell ECM R1 resistance');
        plot(R1);
        grid on;
        axis tight;
        title('Cell ECM R1 resistance');
        xlabel('Time in seconds');
        ylabel('Resistance in Ohm');
        legend(t_ListLegend);
        if SimPara.SavePlots == true
            savefig(t_fighandle, join([t_figfolder, 'R1.fig'],''), 'compact');
        end
    end

    % Cell ECM C1 capacity
    if exist('C1', 'var')
        t_fighandle = figure('Name','Cell ECM C1 capacity');
        plot(C1);
        grid on;
        axis tight;
        title('Cell ECM C1 capacity');
        xlabel('Time in seconds');
        ylabel('Capacity in Farad');
        legend(t_ListLegend);
        if SimPara.SavePlots == true
            savefig(t_fighandle, join([t_figfolder, 'C1.fig'],''), 'compact');
        end
    end

    % Cell ECM R2 resistance
    if exist('R2', 'var')
        t_fighandle = figure('Name','Cell ECM R2 resistance');
        plot(R2);
        grid on;
        axis tight;
        title('Cell ECM R2 resistance');
        xlabel('Time in seconds');
        ylabel('Resistance in Ohm');
        legend(t_ListLegend);
        if SimPara.SavePlots == true
            savefig(t_fighandle, join([t_figfolder, 'R2.fig'],''), 'compact');
        end
    end

    % Cell ECM C2 capacity
    if exist('C2', 'var')
        t_fighandle = figure('Name','Cell ECM C2 capacity');
        plot(C2);
        grid on;
        axis tight;
        title('Cell ECM C2 capacity');
        xlabel('Time in seconds');
        ylabel('Capacity in Farad');
        legend(t_ListLegend);
        if SimPara.SavePlots == true
            savefig(t_fighandle, join([t_figfolder, 'C2.fig'],''), 'compact');
        end
    end

    % Cell ECM R3 resistance
    if exist('R3', 'var')
        t_fighandle = figure('Name','Cell ECM R3 resistance');
        plot(R2);
        grid on;
        axis tight;
        title('Cell ECM R3 resistance');
        xlabel('Time in seconds');
        ylabel('Resistance in Ohm');
        legend(t_ListLegend);
        if SimPara.SavePlots == true
            savefig(t_fighandle, join([t_figfolder, 'R3.fig'],''), 'compact');
        end
    end

    % Cell ECM C3 capacity
    if exist('C3', 'var')
        t_fighandle = figure('Name','Cell ECM C3 capacity');
        plot(C3);
        grid on;
        axis tight;
        title('Cell ECM C3 capacity');
        xlabel('Time in seconds');
        ylabel('Capacity in Farad');
        legend(t_ListLegend);
        if SimPara.SavePlots == true
            savefig(t_fighandle, join([t_figfolder, 'C3.fig'],''), 'compact');
        end
    end
    
    % Cell ECM R4 resistance
    if exist('R4', 'var')
        t_fighandle = figure('Name','Cell ECM R4 resistance');
        plot(R4);
        grid on;
        axis tight;
        title('Cell ECM R4 resistance');
        xlabel('Time in seconds');
        ylabel('Resistance in Ohm');
        legend(t_ListLegend);
        if SimPara.SavePlots == true
            savefig(t_fighandle, join([t_figfolder, 'R4.fig'],''), 'compact');
        end
    end

    % Cell ECM C4 capacity
    if exist('C4', 'var')
        t_fighandle = figure('Name','Cell ECM C4 capacity');
        plot(C4);
        grid on;
        axis tight;
        title('Cell ECM C4 capacity');
        xlabel('Time in seconds');
        ylabel('Capacity in Farad');
        legend(t_ListLegend);
        if SimPara.SavePlots == true
            savefig(t_fighandle, join([t_figfolder, 'C4.fig'],''), 'compact');
        end
    end
    
    % Cell heat losses
    if exist('PQ_cell', 'var')
        t_fighandle = figure('Name','Cell heat losses');
        plot(PQ_cell);
        grid on;
        axis tight;
        title('Cell heat losses');
        xlabel('Time in seconds');
        ylabel('Power in Watts');
        legend(t_ListLegend);
        if SimPara.SavePlots == true
            savefig(t_fighandle, join([t_figfolder, 'PQ_cell.fig'],''), 'compact');
        end
    end

    % Cell temperatures
    if exist('T_cell', 'var')
        t_fighandle = figure('Name','Cell temperatures');
        plot(T_cell);
        grid on;
        axis tight;
        title('Cell temperatures');
        xlabel('Time in seconds');
        ylabel('Temperature in °C');
        legend(t_ListLegend);
        if SimPara.SavePlots == true
            savefig(t_fighandle, join([t_figfolder, 'T_cell.fig'],''), 'compact');
        end
    end
    
    % Ambient heat transfer
    if exist('PQ_ambient', 'var')
        t_fighandle = figure('Name','Ambient heat transfer');
        plot(PQ_ambient);
        grid on;
        axis tight;
        title('Ambient heat transfer');
        xlabel('Time in seconds');
        ylabel('Heat flux in W');
        legend(t_ListLegend);
        if SimPara.SavePlots == true
            savefig(t_fighandle, join([t_figfolder, 'PQ_ambient.fig'],''), 'compact');
        end
    end
    
    % Heat transfer between cells
    if exist('PQ_transfer', 'var')
        t_fighandle = figure('Name','Heat transfer between cells');
        plot(PQ_transfer);
        grid on;
        axis tight;
        title('Heat transfer between cells');
        xlabel('Time in seconds');
        ylabel('Heat flux in W');
        legend(t_ListLegend);
        if SimPara.SavePlots == true
            savefig(t_fighandle, join([t_figfolder, 'PQ_transfer.fig'],''), 'compact');
        end
    end
    
    % Create Plots for load spectrum analysis
    run('plotting_LSA.m')
    
    % Create Plots for system geometry
    if isfield(SysPara, 'e')
        plot_system_geometry(SysPara.s, SysPara.pe, SysPara.e, SimPara, t_figfolder)
    end
    
    % Create plot for thermal system architecture
    if SimPara.heat_exchange_enable == true
        plot_thermal_sys_archit(SysPara.thermal.transfer.K_transfer, SimPara, t_figfolder)
    end
        
        
    if SimPara.PlotResults == false
        disp('Closing Plots.')
        close all       % No display of plots was wished, so they are closed after saving
    end

end