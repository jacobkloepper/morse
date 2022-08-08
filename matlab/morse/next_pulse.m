% Given vector of nonzero samples in y, find the sample number of the
% next pulse from curr_samp

function samp = next_pulse(y_nonzero, curr_samp)
    N = size(y_nonzero);
    % Assume if 50 nonzero samples exist, we're in empty space
    % And no empty space will be less than 50 samples
    empty_T = 200;

    % Get next pulse
    for i = 1:N(1)
        % check bounds
        if (curr_samp+i+1 > N(1))
            samp = 0;
            return
        end
        
        if (y_nonzero(curr_samp + i+1) - y_nonzero(curr_samp + i) > empty_T)
            samp = curr_samp + i;
            return
        end
    end
end