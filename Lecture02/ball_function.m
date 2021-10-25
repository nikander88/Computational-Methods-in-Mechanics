% Prints ball height at two time poins. Example used during the lectures.

function ball_function()
    g = 9.81; % Acceleration of gravity
    v0 = 5; % Initial velocity
    
    % This is the main program
    time = 0.6; % Just pick some time
    y = vertical_position(time); 
    disp(y);
    y = vertical_position(0.9);
    disp(y);
    
    % The function 'y' is a _local_ function in this file
    function result = vertical_position(t)
        result = v0*t - 0.5*g*t^2;
    end
end

