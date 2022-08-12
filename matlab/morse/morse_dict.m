function c = morse_dict(m)
    % input: binary vector representing dits and dahs
    % output: char
    c = '';

    if isequal(m,[0 1])
        c = 'A';
    elseif isequal(m,[1 0 0 0])
        c = 'B';
    elseif isequal(m,[1 0 1 0])
        c = 'C';
    elseif isequal(m,[1 0 0])
        c = 'D';
    elseif isequal(m,[0])
        c = 'E';
    elseif isequal(m,[0 0 1 0])
        c = 'F';
    elseif isequal(m,[1 1 0])
        c = 'G';
    elseif isequal(m,[0 0 0 0])
        c = 'H';
    elseif isequal(m,[0 0])
        c = 'I';
    elseif isequal(m,[0 1 1 1])
        c = 'J';
    elseif isequal(m,[1 0 1])
        c = 'K';
    elseif isequal(m,[0 1 0 0])
        c = 'L';
    elseif isequal(m,[1 1])
        c = 'M';
    elseif isequal(m,[1 0])
        c = 'N';
    elseif isequal(m,[1 1 1])
        c = 'O';
    elseif isequal(m,[0 1 1 0])
        c = 'P';
    elseif isequal(m,[1 1 0 1])
        c = 'Q';
    elseif isequal(m,[0 1 0])
        c = 'R';
    elseif isequal(m,[0 0 0])
        c = 'S';
    elseif isequal(m,[1])
        c = 'T';
    elseif isequal(m,[0 0 1])
        c = 'U';
    elseif isequal(m,[0 0 0 1])
        c = 'V';
    elseif isequal(m,[0 1 1])
        c = 'W';
    elseif isequal(m,[1 0 0 1])
        c = 'X';
    elseif isequal(m,[1 0 1 1])
        c = 'Y';
    elseif isequal(m,[1 1 0 0])
        c = 'Z';
    elseif isequal(m,[0 1 1 1 1])
        c = '1';
    elseif isequal(m,[0 0 1 1 1])
        c = '2';
    elseif isequal(m,[0 0 0 1 1])
        c = '3';
    elseif isequal(m,[0 0 0 0 1])
        c = '4';
    elseif isequal(m,[0 0 0 0 0])
        c = '5';
    elseif isequal(m,[1 0 0 0 0])
        c = '6';
    elseif isequal(m,[1 1 0 0 0])
        c = '7';
    elseif isequal(m,[1 1 1 0 0])
        c = '8';
    elseif isequal(m,[1 1 1 1 0])
        c = '9';
    elseif isequal(m,[1 1 1 1 1])
        c = '0';
    end

end