function sensor_mat = create_sensor_def_matrix(ranges, p, s)

% Create the matrix with the temperature sensor ranges for Simulink.

% This function takes the sensor definitions in the cell array 'ranges' and
% puts them in a matrix. To account for different numbers of cells
% affecting the different sensors the matrix gets filled with zeros.

% Example:
% ranges = {[1 2 3 4], [5 6], [7]}
% sensor_mat = [1 2 3 4; 5 6 0 0; 7 0 0 0]


% Get max numbers of cells in a sensor
[~, sizes] = cellfun(@size, ranges);
max_range = max(sizes);

% Get number of sensors
num_sensors = size(ranges, 2);


% Preallocate sensor matrix
sensor_mat = zeros(num_sensors, max_range);

% Write values in matrix
for ii = 1:num_sensors
   sensor_mat(ii,1:size(ranges{ii},2)) = ranges{ii};
end

% Check validity of input
if max(max(sensor_mat)) > p*s
    error('Wrong temp sensor definiton. max(ID)>number of cells! Check "TempSens_parameters.m".')
end


end

