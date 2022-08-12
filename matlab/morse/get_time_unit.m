% Given filtered morse code audio signal, get the time unit.

% Notes:
%   Assume consecutive zeroed samples to be clear air
%
%

function [T1, T3, T] = get_time_unit(y,fs)
    % retval
    T = [];

    % Vector of nonzero samples of signal
    y_nonzero = find(y);
    
    % Get  sample of first valid pulse
    prev_samp = 1;
    curr_samp = 1;
    curr_samp = next_pulse(y_nonzero, curr_samp);

    
    % If first pulse in signal is some time after signal start
    %       get the first rise
    assumed_mintime = 50;
    if (y_nonzero(1) > assumed_mintime)
        next_rise = y_nonzero(1);
    end

    while (curr_samp ~= 0)
        T_init = y_nonzero(curr_samp)-next_rise;
        %fprintf("%6d ----- %6d\t|\t(T=%6d)\n", next_rise, y_nonzero(curr_samp), T_init)
        
        if (T_init > assumed_mintime)
            T(end+1,:) = [next_rise-y_nonzero(prev_samp) T_init];
        end
        
        next_rise = y_nonzero(curr_samp+1);
        prev_samp = curr_samp;
        curr_samp = next_pulse(y_nonzero, curr_samp);
    end

    % T is a vector of the off and on periods in the signal
    % 
    [T_hist_vals,T_hist_edges] = histcounts(T(:,2),10);
    
    max_bins_count = maxk(T_hist_vals, 2);
    max_bin_idx = [find(T_hist_vals == max_bins_count(1)) find(T_hist_vals == max_bins_count(2))];

    T1 = mean([T_hist_edges(max_bin_idx(1)+1) T_hist_edges(max_bin_idx(1))]) ;
    T3 = mean([T_hist_edges(max_bin_idx(2)+1) T_hist_edges(max_bin_idx(2))]);

end