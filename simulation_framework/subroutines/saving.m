% Run subroutines/get_save_folder_and_time.m first for this script to work!

disp('Save simulation results.')

t_filename = join([t_save_folder, 'res_', t_datetime, '.mat'],'');

if SimPara.SaveResults == true
    if SimPara.LoggingOutput == false && SimPara.LoadSpectra == false
        warning('There are no results so save! Enable Logging in main_sim_battery_system.m')
    else
        save(t_filename, '-regexp', '^(?!.*Para.*|load_cycle|t_.*$).','-v7.3');
    end
end

if SimPara.SaveSettings == true
    if exist(t_filename,'file')
        save(t_filename, '*Para','-append');
    else
        save(t_filename, '*Para','-v7.3');
    end
end