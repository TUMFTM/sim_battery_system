% Calculate the normal distributed parameter deviations using the values
% defined in parameters\cell_parameters_XXXX.m. Optinally also specific
% deviation can be assigned to each cell.

disp('Calculate statistic deviations.')

SysPara.DeviationMap.C_A  = 1 + randn(SysPara.p,SysPara.s)*BatPara.variances.electrical.C_A;
SysPara.DeviationMap.R_0  = 1 + randn(SysPara.p,SysPara.s)*BatPara.variances.electrical.R_0;
SysPara.DeviationMap.C1   = 1 + randn(SysPara.p,SysPara.s)*BatPara.variances.electrical.C1;
SysPara.DeviationMap.C2   = 1 + randn(SysPara.p,SysPara.s)*BatPara.variances.electrical.C2;
SysPara.DeviationMap.C3   = 1 + randn(SysPara.p,SysPara.s)*BatPara.variances.electrical.C3;
SysPara.DeviationMap.C4   = 1 + randn(SysPara.p,SysPara.s)*BatPara.variances.electrical.C4;
SysPara.DeviationMap.R1   = 1 + randn(SysPara.p,SysPara.s)*BatPara.variances.electrical.R1;
SysPara.DeviationMap.R2   = 1 + randn(SysPara.p,SysPara.s)*BatPara.variances.electrical.R2;
SysPara.DeviationMap.R3   = 1 + randn(SysPara.p,SysPara.s)*BatPara.variances.electrical.R3;
SysPara.DeviationMap.R4   = 1 + randn(SysPara.p,SysPara.s)*BatPara.variances.electrical.R4;
SysPara.DeviationMap.m    = 1 + randn(SysPara.p,SysPara.s)*BatPara.variances.thermal.m;
SysPara.DeviationMap.c    = 1 + randn(SysPara.p,SysPara.s)*BatPara.variances.thermal.c;
SysPara.DeviationMap.EnCo = 1 + randn(SysPara.p,SysPara.s)*BatPara.variances.thermal.EnCo;
SysPara.DeviationMap.A    = 1 + randn(SysPara.p,SysPara.s)*BatPara.variances.thermal.A;