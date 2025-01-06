% check whether there is a connected line
%
% @currentBoard
%           the matrix modle of current game board
% @y
%           the y coordinate of the sprite 
% @x
%           the x coordinate of the sprite
% @updates
%           {@code y}
% @updates
%           {@code x}
% @returns
%           whether there is a connected line
% @requires
%           0 <= y <= 6 and 0 <= x <= 7
% @requires
%           {@code currentBoard} is not null
% @ensure
%           return whether there is a connected line, and the x and y
%           coordinate of the first sprite of the line 
function [connect, y, x] = checkLine(currentBoard, y, x)

currX = x;
currY = y;

% check whether there's a connected vertical line
[connect, y, x] = checkV(currentBoard, y, x);

% if not, check whether there's a connected horizontal line
if connect == false
    [connect, y, x] = checkH(currentBoard, currY, currX);
end

% if not, check whether there's a connected left diagonal line
if connect == false
    [connect, y, x] = checkLD(currentBoard, currY, currX);
end

% if not, check whether there's a connected right diagonal line
if connect == false
    [connect, y, x] = checkRD(currentBoard, currY, currX);
end

end