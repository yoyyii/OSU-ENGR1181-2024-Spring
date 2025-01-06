% check whether there is a connected vertical line
%
% @currentBoard
%           the matrix modle of current game board
% @y
%           the y coordinate of the sprite 
%
% @x
%           the x coordinate of the sprite
% @returns
%           whether there is a connected line
% @requires
%           0 <= y <= 6 and 0 <= x <= 7
% @requires
%           {@code currentBoard} is not null
% @ensure
%           return whether there is a connected vertical line, and the x and y
%           coordinate of the first sprite of the line 
function [connect, currY, x] = checkV(currentBoard, y, x)

% declared variables
global winLine
connect = (y < 5);
connected = 0;
curr = currentBoard(y,x);
currY = y;

% check whether there is a connected vertical line 
if connect == true
    while connected < 4 && connect == true
        if currentBoard(y, x) == curr
            connected = connected + 1;
            y = y + 1;
        else
            connect = false;
        end
    end
end

% update winLine
if connect == true
    winLine = 'V';
end

end