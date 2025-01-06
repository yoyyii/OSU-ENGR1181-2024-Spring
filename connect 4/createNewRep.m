% print the setup of the game
%
% @param my_scene
%           the scene setting for all of the elements
% @param board_display
%           the displayment of the board
% @updates 
%           board_display
% @requires
%           {@code my_scene} = 'ConnectFour.png'
% @requires 
%           {@code board_display} is 7x11
% @ensures
%           print the gameBoard on {@code board_display}

function [my_scene, board_display] = createNewRep(my_scene, turn)

% declare variable
white_space = 11;

% print white spaces onto board
board_display = white_space * ones(7,11);
drawScene(my_scene, board_display)

% print game board
[my_scene, board_display] = printBoard(my_scene, board_display);

% print indicator
[my_scene, board_display] = printIndicator(turn, my_scene, board_display);

end