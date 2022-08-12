% binary morse vector to english string

function s = morse_to_english(binary_repr)
    s = '';
    running_letter = [];

    N = size(binary_repr);
    
    
    for i = 1:N(1)
        T = binary_repr(i,:);

        if (T(1:2) == [0 0])
            % T1 pause, do nothing
        elseif (T(1:2) == [0 1])
            % T3 pause, new letter
            s = strcat(s, morse_dict(running_letter));
            running_letter = [];
        elseif (T(1:2) == [1 1])
            % T7 pause, new word
            s = strcat(s, morse_dict(running_letter));
            s = strcat(s, " ");
            running_letter = [];
        end

        % every loop: collect new dit/dah
        running_letter(end+1) = T(3);

    end


end