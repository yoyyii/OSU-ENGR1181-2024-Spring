% print the indicator to indicate which player's turn it is now
% 
% @turn
%           the current turn
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
%           print the corresponding indicator of {@code turn}
function [my_scene, board_display] = printIndicator(turn, my_scene, board_display)

% declaring variables
red_indicator_TL = 12;
red_indicator_TR = 13;
red_indicator_BL = 17;
red_indicator_BR = 18;
blue_indicator_TL = 19;
blue_indicator_TR = 20;
blue_indicator_BL = 24;
blue_indicator_BR = 25;
pla = 6;
yer = 7;
num1 = 9;
num2 = 10;

% if it's palyer 1's turn
if mod(turn, 2) ~= 0

    % change the indicator to blue
     board_display(2,9) = blue_indicator_TL;
     board_display(2,10) = blue_indicator_TR;
     board_display(3,9) = blue_indicator_BL;
     board_display(3,10) = blue_indicator_BR;

     % change the display message to player 
     board_display(1,11) = num1;

else % if it's palyer 2's turn

    % change the indicator to red
     board_display(2,9) = red_indicator_TL;
     board_display(2,10) = red_indicator_TR;
     board_display(3,9) = red_indicator_BL;
     board_display(3,10) = red_indicator_BR;

     % change the display message to player 2    
     board_display(1,11) = num2;
end

board_display(1,9) = pla;
board_display(1,10) = yer;

% update the board_display
drawScene(my_scene, board_display) 

end
