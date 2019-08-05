function [bins_mean, bins_borders] = calc_LSA_bins(no_bins, min_val, max_val)

%% Check input plausibility

if min_val >= max_val
    error('Implausible upper and lower borders for LSA!\n"%s" must be smaller than "%s!"', inputname(2), inputname(3))
end


%% Calculate the vectors containing the bins for load spectrum analysis

binwidth = (max_val - min_val) / no_bins;               % Width of bins
bins_borders = min_val + binwidth*(0:no_bins);       % Inverval borders of bins
bins_borders(end) = max_val;                         % Make sure last value == max_val

bins_mean = bins_borders(1:length(bins_borders)-1) + binwidth/2;  % Mean value of bins

end

