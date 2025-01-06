% check whether the user want a new game
%
% @my_scene 
%           the png that contains all the game elements
% @board_display
%           the graphic UI
% @returns
%           whether the user want a new game or not
% @ensure
%           return whether the user want a new game
function [newGame] = newRound(my_scene,board_display)

% keep getting the user input until the user click on "Y" or "N"
[r,c,b] = getMouseInput(my_scene);
while (r ~= 7 && (c ~= 9 || c ~= 10)) 
    [r,c,b] = getMouseInput(my_scene);
end

if c == 9
    newGame = true;
else
    newGame = false;
end

end