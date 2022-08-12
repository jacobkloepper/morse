% idealize morse code signal y into pulses
% TODO: not quite working. may be 20% tolerance issue, may be logical.

function y = get_binary_repr(T1, T3, T)
    y = [];
    N = size(T);
    T7 = 7*T1;

    for i = 1:N(1)
        y_curr = [];
        curr_pause = 0;

        if abs(T1-T(i,1)) < abs(T3-T(i,1))
            % current sample features T1 pause
            curr_pause = [0 0];
        elseif abs(T3-T(i,1)) < abs(T7-T(i,1))
            % current sample features T3 pause
            curr_pause = [0 1];
        else
            % current sample features T7 pause
            curr_pause = [1 1];
        end


        if abs(T1-T(i,2)) < abs(T3-T(i,2))
            % current sample is dit
            y_curr = [curr_pause 0];
        else
            % current sample is dah
            y_curr = [curr_pause 1];
        end
        
        if size(y_curr) == [1 3]
            y(end+1,:) = y_curr;
        end
    end

end