function plot_thermal_sys_archit(K_transfer,SimPara, t_figfolder)

%PLOT_THERMAL_SYSTEM_MODEL Visualize the thermal system architecture

t_fighandle = figure('Name','Thermal system architecture');
G=graph(K_transfer,'OmitSelfLoops');
plot(G,'EdgeLabel',G.Edges.Weight);
title('Thermal system architecture');
xlabel({'Note: Orientation shown here may not correspond with other visualizations.', 'Numbering priority: pe \rightarrow e \rightarrow s'}, 'FontSize', 8);

% Save plot (optional)
if nargin == 3
    if SimPara.SavePlots == true
        savefig(t_fighandle, join([t_figfolder, 'thermal_sys_architecture.fig'],''), 'compact');
    end
end

end

