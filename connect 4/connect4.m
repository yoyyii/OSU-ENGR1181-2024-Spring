clc
clear

% Initialize scene
my_scene = simpleGameEngine('ConnectFour.png',84,84,4);

% Set up variables to name the various sprites
newGame = true;
while newGame == true
    turn = 1;
    connect = false;
    currentBoard = zeros(6,7);
    global winLine;


    % differnt ways to connect a line: horizontal, vertical, right diagonal,
    % left diagonal

    % initial state - Display empty board   
    [my_scene, board_display] = createNewRep(my_scene, turn);

    full = 0;
    % game state
    while connect ~= true && full ~= 7
        [connect, currentBoard, my_scene, board_display, y, x] = playGame(my_scene, board_display, turn, currentBoard);
        turn = turn + 1;

        % check the game board is not full i.e. there are still empty grid
        % left to drop the sprite
        full = 0;
        for i=1:7
            if currentBoard(2,i) ~= 0
                full = full + 1;
            end
        end
    end

    % win state
    newGame = winState(y, x, turn - 1, my_scene, board_display, currentBoard, full);
end 











