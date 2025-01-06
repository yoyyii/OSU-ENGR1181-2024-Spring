% check whether there is a connected horizontal line
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
%           whether there is a connected line
% @returns
%           x coordinate of the leftmost sprite
% @requires
%           0 <= y <= 6 and 0 <= x <= 7
% @requires
%           {@code currentBoard} is not null
% @ensure
%           return whether there is a connected horizontal line, and the x and y
%           coordinate of the rightmost sprite of the line 
function [connect, y, firstX] = checkH(currentBoard, y, x)

% declared variables
global winLine
connected = 0;
curr = currentBoard(y,x);
firstX = x;
connect = true;

while connected < 4 && x > 0 && connect ~= false
    % check whether there's a connected line to the left of x
    if currentBoard(y, x) == curr
        connected = connected + 1;
        firstX = x;
        x = x - 1;
    else
        connect = false;
    end
end


if connected ~= 4

    % back to 1 to the right of original coordinate
    x = x + connected + 1;

    % check whether there's a connected line to the right of x
    while connected < 4 && x < 8 
        if currentBoard(y, x) == curr
            connected = connected + 1;
            x = x + 1;
        else 
            connect = false;
            break;
        end
    end
end

% if there is a connected line, update winLine and connect status
if connected == 4
    winLine = 'H';
    connect = true;
end

end