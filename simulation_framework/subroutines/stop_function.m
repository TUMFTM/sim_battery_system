% Will get executed after the simulation stops

%% Clear LSA dummy values if disabled
if SimPara.LoadSpectra_enable == false
   clearvars LSA*
end


%% Clear data logging dummy data if disabled
if SimPara.LoggingOutput == false
   clearvars I_load U_Pack U_cell I_cell I_load U_R U_Potential SOC U_OCV U_Hysteresis...
        U_RC1 U_RC2 U_RC3 U_RC4 sum_U_RC PQ_cell T_cell R_0 R1 C1 R2 C2 R3 C3 R4 C4 T_Sensors
end


%% Clear all thermal outputs if thermal sim is disabled
if SimPara.thermal_sim_enable == false
   clearvars T_sensors T_cell PQ_transfer PQ_ambient PQ_cell
   clearvars SysPara.TempSens
end


%% Clear temperature sensore dummy data if disabled
if SimPara.TempSensors_enable == false
   clearvars T_sensors
   clearvars SysPara.TempSens
end


%% Clear heat transfer simulation dummy data is disabled
if SimPara.heat_exchange_enable == false
   clearvars PQ_transfer
   clearvars SysPara.thermal.transfer
end


%% Clear additional geometric information if heat transfer and temp sensors are disabled
if SimPara.heat_exchange_enable == false && SimPara.TempSensors_enable == false
    clearvars SysPara.pe SysPara.e
end