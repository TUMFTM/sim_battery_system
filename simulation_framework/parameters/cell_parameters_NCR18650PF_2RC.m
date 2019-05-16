%% Info

% Cell: Panasonic NCR-18650 PF

% ECM with 2 RC elements. Dynamic parameters mesured at 0-100% SOC at 10%
% steps, -1 and +1 C-Rate and a static temperature of 25 °C


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
BatPara.electrical.dyn.T            = [25, 25.01];                                          % T breakpoints
BatPara.electrical.dyn.C_rate       = [-1, 1];                                              % C-Rate breakpoints

% Table Data as 3D table. Format: data(SOC, T, C-Rate)
% For ECMs with less than 4 RC-elements: Set RCx_enable to false. 
% Note: For modelling reasons you must still provide table data for the 
% disabled RC-elements, but it won't be considered for the simulation results.


% Internal Resistance

BatPara.electrical.dyn.R_0(:,:,1)   = [0.0367, 0.0367; 0.0367, 0.0367; 0.0354, 0.0354; 0.0341, 0.0341; 0.0333, 0.0333; 0.0331, 0.0331; 0.0335, 0.0335; 0.0338, 0.0338; 0.0342, 0.0342; 0.0357, 0.0357; 0.0378, 0.0378];
BatPara.electrical.dyn.R_0(:,:,2)   = [0.0394, 0.0394; 0.0378, 0.0378; 0.0366, 0.0366; 0.0354, 0.0354; 0.0347, 0.0347; 0.0345, 0.0345; 0.0336, 0.0336; 0.0335, 0.0335; 0.0338, 0.0338; 0.0344, 0.0344; 0.0344, 0.0344];


% First RC-element

BatPara.electrical.dyn.RC1_enable   = true;

BatPara.electrical.dyn.R1(:,:,1)    = [0.0687, 0.0687; 0.0687, 0.0687; 0.0082, 0.0082; 0.0064, 0.0064; 0.0060, 0.0060; 0.0058, 0.0058; 0.0081, 0.0081; 0.0070, 0.0070; 0.0067, 0.0067; 0.0074, 0.0074; 0.0104, 0.0104];
BatPara.electrical.dyn.R1(:,:,2)    = [0.0247, 0.0247; 0.0185, 0.0185; 0.0055, 0.0055; 0.0057, 0.0057; 0.0068, 0.0068; 0.0064, 0.0064; 0.0054, 0.0054; 0.0061, 0.0061; 0.0069, 0.0069; 0.0073, 0.0073; 0.0073, 0.0073];

BatPara.electrical.dyn.C1(:,:,1)    = [25.0281, 25.0281; 25.0281, 25.0281; 133.5712, 133.5712; 866.5248, 866.5248; 974.5801, 974.5801; 844.8680, 844.8680; 464.4790, 464.4790; 326.3482, 326.3482; 316.9075, 316.9075; 264.6779, 264.6779; 31.0652, 31.0652];
BatPara.electrical.dyn.C1(:,:,2)    = [8.6434, 8.6434; 14.2581, 14.2581; 151.3793, 151.3793; 699.0738, 699.0738; 627.9772, 627.9772; 447.8736, 447.8736; 564.4758, 564.4758; 696.1366, 696.1366; 725.6156, 725.6156; 566.7524, 566.7524; 566.7524, 566.7524];


% Second RC-element

BatPara.electrical.dyn.RC2_enable   = true;

BatPara.electrical.dyn.R2(:,:,1)    = [0.0378, 0.0378; 0.0378, 0.0378; 0.0264, 0.0264; 0.0324, 0.0324; 0.0258, 0.0258; 0.0217, 0.0217; 0.0702, 0.0702; 0.0465, 0.0465; 0.0340, 0.0340; 0.0272, 0.0272; 0.0314, 0.0314];
BatPara.electrical.dyn.R2(:,:,2)    = [0.0463, 0.0463; 0.0387, 0.0387; 0.0234, 0.0234; 0.0214, 0.0214; 0.0300, 0.0300; 0.0444, 0.0444; 0.0224, 0.0224; 0.0235, 0.0235; 0.0266, 0.0266; 0.0284, 0.0284; 0.0284, 0.0284];

BatPara.electrical.dyn.C2(:,:,1)    = 1.0e+03 * [1.1468, 1.1468; 1.1468, 1.1468; 2.1554, 2.1554; 2.8817, 2.8817; 3.0931, 3.0931; 3.0275, 3.0275; 1.7824, 1.7824; 1.4993, 1.4993; 1.5003, 1.5003; 1.6233, 1.6233; 1.5135, 1.5135]; 
BatPara.electrical.dyn.C2(:,:,2)    = 1.0e+03 * [0.9235, 0.9235; 1.5083, 1.5083; 2.1673, 2.1673; 2.5922, 2.5922; 2.1471, 2.1471; 1.6285, 1.6285; 2.4171, 2.4171; 2.5815, 2.5815; 2.6393, 2.6393; 2.5251, 2.5251; 2.5251, 2.5251];


% Third RC-element

% DUMMY DATA! COPIED FROM SECOND RC-ELEMENT!!!!!

BatPara.electrical.dyn.RC3_enable   = false;

BatPara.electrical.dyn.R3(:,:,1)    = [0.0378, 0.0378; 0.0378, 0.0378; 0.0264, 0.0264; 0.0324, 0.0324; 0.0258, 0.0258; 0.0217, 0.0217; 0.0702, 0.0702; 0.0465, 0.0465; 0.0340, 0.0340; 0.0272, 0.0272; 0.0314, 0.0314];
BatPara.electrical.dyn.R3(:,:,2)    = [0.0463, 0.0463; 0.0387, 0.0387; 0.0234, 0.0234; 0.0214, 0.0214; 0.0300, 0.0300; 0.0444, 0.0444; 0.0224, 0.0224; 0.0235, 0.0235; 0.0266, 0.0266; 0.0284, 0.0284; 0.0284, 0.0284];

BatPara.electrical.dyn.C3(:,:,1)    = 1.0e+03 * [1.1468, 1.1468; 1.1468, 1.1468; 2.1554, 2.1554; 2.8817, 2.8817; 3.0931, 3.0931; 3.0275, 3.0275; 1.7824, 1.7824; 1.4993, 1.4993; 1.5003, 1.5003; 1.6233, 1.6233; 1.5135, 1.5135]; 
BatPara.electrical.dyn.C3(:,:,2)    = 1.0e+03 * [0.9235, 0.9235; 1.5083, 1.5083; 2.1673, 2.1673; 2.5922, 2.5922; 2.1471, 2.1471; 1.6285, 1.6285; 2.4171, 2.4171; 2.5815, 2.5815; 2.6393, 2.6393; 2.5251, 2.5251; 2.5251, 2.5251];


% Forth RC-element

% DUMMY DATA! COPIED FROM SECOND RC-ELEMENT!!!!!

BatPara.electrical.dyn.RC4_enable   = false;

BatPara.electrical.dyn.R4(:,:,1)    = [0.0378, 0.0378; 0.0378, 0.0378; 0.0264, 0.0264; 0.0324, 0.0324; 0.0258, 0.0258; 0.0217, 0.0217; 0.0702, 0.0702; 0.0465, 0.0465; 0.0340, 0.0340; 0.0272, 0.0272; 0.0314, 0.0314];
BatPara.electrical.dyn.R4(:,:,2)    = [0.0463, 0.0463; 0.0387, 0.0387; 0.0234, 0.0234; 0.0214, 0.0214; 0.0300, 0.0300; 0.0444, 0.0444; 0.0224, 0.0224; 0.0235, 0.0235; 0.0266, 0.0266; 0.0284, 0.0284; 0.0284, 0.0284];

BatPara.electrical.dyn.C4(:,:,1)    = 1.0e+03 * [1.1468, 1.1468; 1.1468, 1.1468; 2.1554, 2.1554; 2.8817, 2.8817; 3.0931, 3.0931; 3.0275, 3.0275; 1.7824, 1.7824; 1.4993, 1.4993; 1.5003, 1.5003; 1.6233, 1.6233; 1.5135, 1.5135];
BatPara.electrical.dyn.C4(:,:,2)    = 1.0e+03 * [0.9235, 0.9235; 1.5083, 1.5083; 2.1673, 2.1673; 2.5922, 2.5922; 2.1471, 2.1471; 1.6285, 1.6285; 2.4171, 2.4171; 2.5815, 2.5815; 2.6393, 2.6393; 2.5251, 2.5251; 2.5251, 2.5251];


%% Thermal cell parameters

BatPara.thermal.m    = 0.048;                               % cell mass in kg
BatPara.thermal.c    = 700;                                 % specific heat capacity of cell in J/(kg*K)
BatPara.thermal.A    = (2*((18^2)/4)*pi+18*pi*65)*10^(-6);  % heat conducting surface area of cell in m^2 (assuming a cylinder of 18650 cell dimensions)
BatPara.thermal.EnCo = 0.0001;                              % Entropy Coefficient


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

BatPara.variances.thermal.m    = 0;
BatPara.variances.thermal.c    = 0.01;
BatPara.variances.thermal.EnCo = 0;
BatPara.variances.thermal.A    = 0;