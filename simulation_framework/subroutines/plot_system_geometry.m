function plot_system_geometry(num_serial, num_parallel_layer, num_layers, SimPara, t_figfolder)

%PLOT_SYSTEM_GEOMETRY Show the system geometry and cell IDs

t_fighandle = figure('Name','System geometry and cell IDs');
hold on
rotate3d on                             % can be rotated
view(-30,20)
daspect([1 4 4])                        % stretch x-axis for better overview
ax = gca;
set(ax,'Ydir','reverse')                % invert y-axis to comply to MATLAB matrix structure

% Axis ticks and limits
ax.XTick = 1:num_serial;
ax.YTick = 1:num_parallel_layer;
ax.ZTick = 1:num_layers;

% Grid
ax.XGrid = 'on';
ax.YGrid = 'on';
ax.ZGrid = 'on';

% Number of cells
cell_p = num_parallel_layer * num_layers;   % Number of parallel cells
cell_n = cell_p * num_serial;               % Total number of cells

% Axis labels
xlabel('Serial cells (SysPara.s)');
ylabel('Parallel cells (SysPara.pe)');
zlabel('Layers (SysPara.e)');
title(sprintf('Battery system %is%ip', num_serial, cell_p));

% Plot of structure
[Lay1,Row1,Col1] = get_cell_IDs(num_layers, num_parallel_layer, num_serial, 1:cell_n);
plot3(Col1,Row1,Lay1,'.b');

% Plot of IDs
for i = 1:cell_n
    text(Col1(i),Row1(i),Lay1(i),[' ' num2str(i)],'Color','Blue')
end

hold off

% Save plot (optional)
if nargin == 5
    if SimPara.SavePlots == true
        savefig(t_fighandle, join([t_figfolder, 'system_geometry.fig'],''), 'compact');
    end
end


end

function [Lay,Row,Col] = get_cell_IDs(nLays, nRows, nCols, Id_vec)

% Get the cell IDs for a battery system with several layers
% 
%  nLays: Number of layers
%  nRows: Number of parallel cells
%  nCols: Number of serial cells
%  Id: Vektor mit linearen Indizes der gewünschten Zellen

if any(Id_vec) > nLays*nRows*nCols || any(Id_vec) < 1
    error('Index exceeds matrix dimensions.')
else
    Col = ceil(Id_vec/(nLays*nRows));
    Lay = ceil((Id_vec-(Col-1)*(nLays*nRows))/nRows);
    Row = Id_vec-(Col-1)*(nLays*nRows)-(Lay-1)*nRows;
end

end