% check whether there is a connected left diagonal line
%
% @currentBoard
%           the matrix modle of current game board
% @y
%           the y coordinate of the sprite 
%
% @x
%           the x coordinate of the sprite
% @updates
%           {@code y}
% @updates
%           {@code x}
% @returns
%           whether there is a connected left diagonal line
% @returns
%           x coordinate of the leftmost sprite
% @returns
%           y coordinate of the leftmost sprite
% @requires
%           0 <= y <= 6 and 0 <= x <= 7
% @requires
%           {@code currentBoard} is not null
% @ensure
%           return whether there is a connected left diagonal line, and the x and y
%           coordinate of the first sprite of the line 
function [connect, firstY, firstX] = checkLD(currentBoard, y, x)

% declare variables
global winLine;
connected = 0;
curr = currentBoard(y,x);
firstX = x;
firstY = y;
connect = (x == 1 && y < 4) || (x == 2 && y < 5) || (x == 3 && y < 6) || (x == 4 && y > 1) || (x == 5 && y > 1) || (x == 6 && y > 2) || (x == 7 && y > 3);

if connect == true
    while connected < 4 && x > 0 && y > 0 && connect == true
        % check whether there's a connected line to the left of x
        if currentBoard(y, x) == curr
            firstX = x;
            firstY = y;
            connected = connected + 1;
            x = x - 1;
            y = y - 1;
        else
            connect = false;
        end
    end
end

if connected ~= 4
    % back to 1 to the right of original coordinate
    x = x + connected + 1;
    y = y + connected + 1;

    if connected == 0
        connected = connected + 1;
    end

    % check whether there's a connected line to the right of x
    while connected < 4 && x < 8 && y < 8
        if currentBoard(y, x) == curr
            connected = connected + 1;
            x = x + 1;
            y = y + 1;
        else 
            connect = false;
            break;
        end
    end
end

% update winLine and connect status
if connected == 4
    winLine = 'LD';
    connect = true;
end

end