% print the new game board
%
% @my_scene
%           the scene setting for all of the elements
% @board_display
%           the displayment of the board
% @updates 
%           board_display
% @requires
%           {@code my_scene} = 'ConnectFour.png'
% @requires 
%           {@code board_display} is 7x11
% @ensures
%           print the gameBoard on {@code board_display}
function [my_scene, board_display] = printBoard(my_scene, board_display)

% declare variables
empty_sprite = 1;

% print the rest of the board
for y = 2:7
    for x = 1:7
        board_display(y,x) = empty_sprite;
    end
end

drawScene(my_scene, board_display)   

end
