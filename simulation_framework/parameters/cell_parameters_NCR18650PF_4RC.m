%% Info

% Cell: Panasonic NCR-18650 PF

% ECM with 4 RC elements. Dynamic parameters mesured at 0-100% SOC at 10%
% steps, -1 and +1 C-Rate and temperatures of 8 and 25 °C.


%% Electrical cell parameters (dynamic)

% Capacity and open circuit voltage
BatPara.electrical.C_A              = 2.7762;
BatPara.electrical.OCV.U            = [3.071, 3.168, 3.237, 3.287, 3.317, 3.326, 3.333, 3.339, 3.346, 3.352, 3.360, 3.407, 3.460, 3.504, 3.537, 3.560, 3.581, 3.601, 3.621, 3.645, 3.672, 3.707, 3.767, 3.806, 3.840, 3.872, 3.904, 3.938, 3.978, 4.024, 4.068, 4.086, 4.103, 4.122, 4.148, 4.184];
BatPara.electrical.OCV.SOC          = [-1.355e-05, 0.0099, 0.0199, 0.0299, 0.0399, 0.0499, 0.0599, 0.0699, 0.0799, 0.0899, 0.0999, 0.1399, 0.1799, 0.2199, 0.2599, 0.2999, 0.3399, 0.3799, 0.4199, 0.4599, 0.4999, 0.5399, 0.5799, 0.6199, 0.6599, 0.6999, 0.7399, 0.7799, 0.8199, 0.8599, 0.8999, 0.9199, 0.9399, 0.9599, 0.9799, 0.9999];

% Hysteresis voltage
% set beta_hyst to 0 if no hysteresis should be modeled

BatPara.electrical.OCV.U_hyst       = [0, 0.0139, 0.0165, 0.0207, 0.0196, 0.0154, 0.01449, 0.0144, 0.0144, 0.0156, 0.0186, 0.0265, 0.0270, 0.0307, 0.0202, 0.0156, 0.0144, 0.0144, 0.0148, 0.0162, 0.0173, 0.0171, 0.0167, 0.0148, 0.0135, 0.0120, 0.0112, 0.0116, 0.0122, 0.0116, 0.0095, 0.0080, 0.0066, 0.0062, 0.0040, -0.0013];
BatPara.electrical.OCV.beta_hyst    = 0.0040;   


%% Electrical cell parameters (dynamic)

% Breakpoints

% Note: Due to limitations in the Simulink Lookup-Table Block at least two
% breakpoints have to be given for each value. If one value is only
% parameterized for one breakpoint provide two breakpoint values close
% together and provide the same data for each breakpoint. The model doesn't
% extrapolate so no error is made.

BatPara.electrical.dyn.SOC          = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];  % SOC breakpoint
BatPara.electrical.dyn.T            = [8, 25];                                              % T breakpoints
BatPara.electrical.dyn.C_rate       = [-1, 1];                                              % C-Rate breakpoints

% Table Data as 3D table. Format: data(SOC, T, C-Rate)
% For ECMs with less than 4 RC-elements: Set RCx_enable to false. 
% Note: For modelling reasons you must still provide table data for the 
% disabled RC-elements, but it won't be considered for the simulation results.


% Internal Resistance

BatPara.electrical.dyn.R_0(:,:,1)   = [0.0336, 0.0276; 0.0327, 0.0270; 0.0329, 0.0269; 0.0325, 0.0264; 0.0316, 0.0267; 0.0321, 0.0267; 0.0322, 0.0266; 0.0313, 0.0264; 0.0310, 0.0265; 0.0314, 0.0265; 0.0323, 0.0269];
BatPara.electrical.dyn.R_0(:,:,2)   = [0.0336, 0.0270; 0.0327, 0.0266; 0.0328, 0.0262; 0.0331, 0.0260; 0.0322, 0.0265; 0.0323, 0.0267; 0.0319, 0.0263; 0.0306, 0.0262; 0.0296, 0.0263; 0.0308, 0.0263; 0.0331, 0.0274];


% First RC-element

BatPara.electrical.dyn.RC1_enable   = true;

BatPara.electrical.dyn.R1(:,:,1)    = [0.0809, 0.0384; 0.0488, 0.0070; 0.0144, 0.0086; 0.0138, 0.0117; 0.0142, 0.0116; 0.0139, 0.0124; 0.0158, 0.0144; 0.0179, 0.0153; 0.0174, 0.0165; 0.0178, 0.0190; 0.0824, 0.0104];
BatPara.electrical.dyn.R1(:,:,2)    = [0.0606, 0.0114; 0.0141, 0.0132; 0.0148, 0.0149; 0.0138, 0.0125; 0.0142, 0.0114; 0.0140, 0.0124; 0.0159, 0.0141; 0.0156, 0.0146; 0.0152, 0.0171; 0.0208, 0.0092; 0.1398, 0.0531];

BatPara.electrical.dyn.C1(:,:,1)    = [18.0926, 9.8847; 8.2046, 3.0882; 1.7540, 4.0155; 1.6156, 3.7877; 1.5662, 3.7977; 1.7534, 3.8970; 1.9544, 3.8427; 2.0137, 3.7957; 1.8522, 3.6634; 2.1181, 3.8848; 4.1953, 4.3649];
BatPara.electrical.dyn.C1(:,:,2)    = [5.1490, 3.5865; 2.0588, 4.7394; 1.9654, 4.0151; 1.9254, 3.3260; 1.8172, 3.3068; 1.8527, 3.7181; 1.9125, 3.4053; 1.5730, 3.3045; 1.2931, 3.5994; 3.2454, 3.3277; 5.9292, 6.5527];


% Second RC-element

BatPara.electrical.dyn.RC2_enable   = true;

BatPara.electrical.dyn.R2(:,:,1)    = [0.9839, 0.0527; 0.2019, 0.0417; 0.0499, 0.0209; 0.0396, 0.0074; 0.0329, 0.0039; 0.0302, 0.0027; 0.0323, 0.0039; 0.0347, 0.0041; 0.0381, 0.0056; 0.0475, 0.0123; 0.0231, 0.0406];
BatPara.electrical.dyn.R2(:,:,2)    = [0.0421, 0.0292; 0.0399, 0.0204; 0.0367, 0.0086; 0.0312, 0.0054; 0.0272, 0.0035; 0.0263, 0.0022; 0.0289, 0.0037; 0.0327, 0.0038; 0.0381, 0.0046; 0.0631, 0.0250; 0.0800, 0.0390];

BatPara.electrical.dyn.C2(:,:,1)    = [74.4372, 238.6698; 33.9596, 17.6206; 12.8724, 16.3202; 11.2940, 36.5875; 11.0092, 79.3451; 11.1295, 179.4617; 10.8831, 186.3843; 10.3008, 176.6293; 9.2723, 91.8098; 8.3443, 31.0587; 279.8934, 7.8265]; 
BatPara.electrical.dyn.C2(:,:,2)    = [317.7359,13.7487; 9.9269, 17.6321; 9.7265, 40.1035; 9.7899, 49.0592; 10.1713, 82.6627; 10.1896, 252.4711; 10.0647, 176.2893; 8.2615, 130.4090; 7.3982, 112.3067; 7.7775, 9.4266; 28.4385, 22.5914];


% Third RC-element

BatPara.electrical.dyn.RC3_enable   = true;

BatPara.electrical.dyn.R3(:,:,1)    = [1.5544, 0.3454; 0.0800, 0.0531; 0.0361, 0.0081; 0.0100, 0.0055; 0.0065, 0.0053; 0.0063, 0.0058; 0.0094, 0.0078; 0.0111, 0.0075; 0.0110, 0.0078; 0.0144, 0.0105; 0.0713, 0.0190];
BatPara.electrical.dyn.R3(:,:,2)    = [0.0295, 0.0258; 0.0262, 0.0146; 0.0124, 0.0079; 0.0082, 0.0060; 0.0071, 0.0054; 0.0068, 0.0058; 0.0118, 0.0084; 0.0094, 0.0076; 0.0088, 0.0078; 0.0177, 0.0085; 0.0486, 0.0242];

BatPara.electrical.dyn.C3(:,:,1)    = 1.0e+03 * [0.0471, 0.0365; 0.4208, 0.0636; 0.1014, 0.4299; 0.3908, 1.0627; 0.7833, 1.2359; 0.9757, 1.2755; 0.9745, 1.1617; 0.6956, 0.9913; 0.6612, 0.8830; 0.5541, 0.7619; 0.8153, 0.6656]; 
BatPara.electrical.dyn.C3(:,:,2)    = 1.0e+03 * [4.1711, 0.4331; 0.4539, 0.7149; 0.8239, 1.2403; 1.2179, 1.3494; 1.3301, 1.3647; 1.2696, 1.3875; 0.9367, 1.2553; 1.1380, 1.3081; 0.8902, 1.1417; 0.3329, 0.5585; 0.1804, 0.3973];

 
% Forth RC-element

BatPara.electrical.dyn.RC4_enable   = true;

BatPara.electrical.dyn.R4(:,:,1)    = [0.0793, 0.0596; 0.0452, 0.0493; 0.0550, 0.0378; 0.0561, 0.0347; 0.0500, 0.0302; 0.0465, 0.0275; 0.0811, 0.0625; 0.0821, 0.0466; 0.0697, 0.0400; 0.0777, 0.0431; 0.6244, 0.0956];
BatPara.electrical.dyn.R4(:,:,2)    = [0.1688, 0.0779; 0.0873, 0.0520; 0.0655, 0.0360; 0.0582, 0.0273; 0.0491, 0.0230; 0.0433, 0.0235; 0.0755, 0.0519; 0.0713, 0.0399; 0.0670, 0.0378; 0.0825, 0.0449; 0.1956, 0.1145];

BatPara.electrical.dyn.C4(:,:,1)    = 1.0e+03 * [0.9235, 0.5601; 1.4821, 1.0207; 1.1290, 1.4927; 1.2074, 1.7759; 1.2969, 1.9672; 1.3280, 2.0790; 1.1297, 1.5058; 0.9259, 1.3508; 0.9579, 1.3450; 0.9143, 1.3474; 3.2427, 1.2382];
BatPara.electrical.dyn.C4(:,:,2)    = 1.0e+03 * [0.7301, 1.1698; 1.2515, 1.8374; 1.3427, 2.0009; 1.4624, 2.0342; 1.5380, 2.0759; 1.4949, 2.2259; 1.2055, 1.8080; 1.2928, 1.9991; 1.1178, 1.7938; 0.9821, 1.2558; 0.6691, 0.9424];


%% Parameters needed for all thermal models

BatPara.physical.m    = 0.048;     % cell mass in kg
BatPara.thermal.EnCo  = 0.0001;     % Entropy Coefficient (reversible heat generation)

BatPara.thermal.c     = 700;        % specific heat capacity of cell in J/(kg*K)


%% Parameters needed for simple thermal model (no thermal interaction between cells)

% The simple thermal simulation assumes the cell as a lumped mass
% exchanging heat with its environmental temperature T_cell_ambient and 
% a heat transfer coefficient alpha_cell_ambient. Both depend on the system
% architecture and therefore are specified in system_parameters.m

% Therefore, regarding the cells only the heat transferring surface is needed.

BatPara.physical.A = (2*((18^2)/4)*pi+18*pi*65)*10^(-6);  % heat transferring surface area of cell in m^2 (assuming a cylinder of 18650 cell dimensions)


%% Statistical deviations between cells

% Manipulate cell parameters with their variance to induce cell spread
% Note: This data-set is an example only with no underlying measurements.
% If you want to use this feature you must take your own measurments.
% Assumption: All OCV related cell parameters are constant.

% Note that the randn-function will give different results each run. To
% reproduce the simulation results you must save and reuse the "DeviationMap" 
% in BatSys created in main_sim_battery_system.

% Disable the cell spread by setting all values to zero.

% Deviation of electric parameters

BatPara.variances.electrical.C_A = 0.01;
BatPara.variances.electrical.R_0 = 0.01;
BatPara.variances.electrical.R1  = 0;
BatPara.variances.electrical.C1  = 0;
BatPara.variances.electrical.R2  = 0;
BatPara.variances.electrical.C2  = 0;
BatPara.variances.electrical.R3  = 0;
BatPara.variances.electrical.C3  = 0;
BatPara.variances.electrical.R4  = 0;
BatPara.variances.electrical.C4  = 0;
BatPara.variances.electrical.R1  = 0;
BatPara.variances.electrical.C1  = 0;

BatPara.variances.physical.m       = 0;
BatPara.variances.thermal.c        = 0.01;
BatPara.variances.thermal.EnCo     = 0;