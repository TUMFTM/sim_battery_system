function K_transfer = calc_heat_transfer_matrix(pe, e, s, A_x, A_y, A_z, alpha_x, alpha_y, alpha_z, layer, alpha, dir)

%CALC_HEAT_TRANSFER_MATRIX Calculate the heat transfer matrix

% Calculate heat transfer matrix K for heat transfer between cells (PQ_lambda = K_transfer * T_cell)

% Inputs:

% pe        Number of parallel cells per layer
% e         Number of layers
% s         Number of serial cells
 
% A_x       heat conducting surface area of cell in x-direction in m^2
% A_y       heat conducting surface area of cell in y-direction in m^2
% A_z       heat conducting surface area of cell in z-direction in m^2

% alpha_x   heat transfer coefficient between the cells in x-direction in W/(m^2*K)
% alpha_y   heat transfer coefficient between the cells in ý-direction in W/(m^2*K)
% alpha_z   heat transfer coefficient between the cells in z-direction in W/(m^2*K)


% Optional inputs

% layer     vector of layers that should recieve special alphas
% alpha     alpha values for the specific layers specified in 'layers'
% dir       direction of layers specified in 'layers'. Valid inputs: 'x', 'y' and 'z'. Everything else gets ignored.


%% System information

p = pe * e;     % Number of parallel cells
n = p * s;      % Total number of cells

k = [A_x*alpha_x, A_y*alpha_y, A_z*alpha_z];  % Heat transfer in W/K



%% Create the heat transfer matrix entries

% Preallocate vectors

x_dir = ones(n-p, 1);       % Heat transfer in x-direction
y_dir = ones(n-1, 1);       % Heat transfer in y-direction
z_dir = zeros(n-pe, 1);     % Heat transfer in z-direction


% Adapt entries (heat transfer only between adjacent cells)

for i=pe:pe:n-1
    y_dir(i) = 0;
end

for j=1:p:n-pe
    z_dir(j:pe*(e-1)+j-1)=ones(pe*(e-1),1);
end


% Product with spacial heat transfer

x_dir = x_dir .* k(1);
y_dir = y_dir .* k(2);
z_dir = z_dir .* k(3);


%% Create the heat transfer matrices is the spacial directions

K_x = diag(x_dir,p);
K_y = diag(y_dir,1);
K_z = diag(z_dir,pe);


%% Allow different heat transfer coefficients

if nargin == 12
    
    for ii = 1:length(layer)
        switch dir(ii)
            case 'x'
                check_input_validity(layer(ii), s)
                K_x = manip_alpha(K_x, layer(ii), alpha(ii), A_x, dir(ii), p, pe, n);
            case 'y'
                check_input_validity(layer(ii), pe)
                K_y = manip_alpha(K_y, layer(ii), alpha(ii), A_y, dir(ii), p, pe, n);
            case 'z'
                check_input_validity(layer(ii), e)
                K_z = manip_alpha(K_z, layer(ii), alpha(ii), A_z, dir(ii), p, pe, n);
        end
    end
    
end



%% Create the matrix

K_transfer = zeros(n);

K_transfer = K_transfer + K_x + K_y + K_z;

K_transfer = K_transfer + K_transfer';       % Symmetry  

x = -sum(K_transfer);      % energy recieving cells heat up, energy giving cells cool down

K_transfer = K_transfer + diag(x);  % Own behavior of cell is defined by the matrix diagnonale

end

function K = manip_alpha(K, layer, alpha, A, dir, p, pe, n)
    switch dir
        case 'x'
            K((layer-1)*p+1:(layer)*p, layer*p+1:(layer+1)*p) = diag(ones(p,1)*alpha*A);
        case 'y'
            for ii = layer:pe:n
                K(ii, ii+1) = alpha*A;
            end
        case 'z'
            for ii = 1+(pe*(layer-1)):1:(pe*(layer-1))+pe
                for jj = ii:p:n
                    K(jj, jj+pe) = alpha*A;
                end
            end
    end
end

function check_input_validity(layer, size_dim)
    if layer >= size_dim
        error('Layer number exceeds system dimension! Check "SysPara.thermal.transfer.additional.layer".')
    end
end
