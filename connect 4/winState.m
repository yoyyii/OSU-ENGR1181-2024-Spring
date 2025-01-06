% display the win state of the game 
%
% @y
%           the y coordinate of the sprite 
% @x
%           the x coordinate of the sprite
% @turn
%           the current term of the game
% @my_scene 
%           the png that contains all the game elements
% @board_display
%           the graphic UI
% @currentBoard
%           the matrix modle of current game board
% @full
%           check whether the board is full or not
% @updates
%           {@code board_display}
% @returns
%           whether user want a new game or not
% @requires
%           {@code currentBoard} is not null
% @requires
%           {@code turn} > 0
% @ensure
%           return whether there is a connected line, and the x and y
%           coordinate of the first sprite of the line 
function [newGame] = winState(y,x, turn, my_scene, board_display, currentBoard, full)

% declare variables
red_win_sprite = 4;
blue_win_sprite = 5;
won = 8;
pla = 6;
yer = 7;
num1 = 9;
num2 = 10;
play = 21;
ag = 22;
ain = 23;
yes = 14;
n = 15;
no = 16;
global winLine;

% if the game board is full
if full == 7
    board_display(5,8) = no;
    board_display(5, 9) = pla;
    board_display(5, 10) = yer;
    board_display(5, 11) = won;
else
    % highlight the sprite that has a connected line and print the winning
    % statement
    if mod(turn, 2) == 0
        if winLine == 'V'
            for i=0:3
                board_display(y + i, x) = red_win_sprite;
            end
        elseif winLine == 'H'
            for i=0:3
                board_display(y,x+i) = red_win_sprite;
            end
        elseif winLine == 'LD'
            for i=0:3
                board_display(y + i, x + i) = red_win_sprite;
            end
        else 
            for i=0:3
                board_display(y - i , x + i) = red_win_sprite;
            end
        end
        board_display(5,10) = num2;
    else
        if winLine == 'V'
            for i=0:3
                board_display(y + i, x) = blue_win_sprite;
            end
        elseif winLine == 'H'
            for i=0:3
                board_display(y,x+i) = blue_win_sprite;
            end
        elseif winLine == 'LD'
            for i=0:3
                board_display(y + i, x + i) = blue_win_sprite;
            end
        else 
            for i=0:3
                board_display(y - i , x + i) = blue_win_sprite;
            end
        end
        board_display(5,10) = num1;
    end
    board_display(5, 8) = pla;
    board_display(5, 9) = yer;
    board_display(5, 11) = won;
end


board_display(6, 8) = play;
board_display(6,9) = ag;
board_display(6,10) = ain;
board_display(7, 9) = yes;
board_display(7,10) = n;
drawScene(my_scene, board_display) 

% ask the user whether they want a new game or not
newGame = newRound(my_scene, board_display);

end