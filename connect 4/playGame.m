% drop the sprite in the column user chose 
%
% @my_scene 
%           the png that contains all the game elements
% @board_display
%           the graphic UI
% @turn
%           the current term of the game
% @currentBoard
%           the matrix modle of current game board
% @updates
%           {@code board_display}
% @returns
%           whether there is a connected line
% @returns 
%           the x coordinate of the first sprite in the line
% @returns 
%           the y coordinate of the first sprite in the line
% @requires
%           {@code currentBoard} is not null
% @requires
%           {@code turn} > 0
% @ensure
%           return whether there is a connected line, and the x and y
%           coordinate of the first sprite of the line 
function [connect, currentBoard, my_scene, board_display, y, x] = playGame(my_scene, board_display, turn, currentBoard)

% declare variables
empty_sprite = 1;
red_sprite = 2;
blue_sprite = 3;

% update indicator as game goer
[my_scene, board_display] = printIndicator(turn, my_scene, board_display);

    % while loop check c is on game board and there is still space left to
    % drop the sprite
    [r,c,b] = getMouseInput(my_scene);
    while (c > 7 || currentBoard(2,c) ~= 0) 
        [r,c,b] = getMouseInput(my_scene);
    end
    y = 1;

    % drop the sprite the the lowest level it could go 
    if mod(turn,2) == 0      
        if b == 1   
            while y < 7 && board_display(y + 1, c) == empty_sprite            
                y = y+1;
            end
            board_display(y,c) = red_sprite;
            currentBoard(y,c) = 2;
        end
    else
        if b == 1   
            while y < 7 && board_display(y + 1, c) == empty_sprite            
                y = y+1;
            end
            board_display(y,c) = blue_sprite;
             currentBoard(y,c) = 3;
        end
    end   
    drawScene(my_scene, board_display)

    % check whether there is a connected line
   [connect, y, x] = checkLine(currentBoard, y, c);
end