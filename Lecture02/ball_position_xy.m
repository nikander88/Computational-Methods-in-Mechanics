% One of the examples analyzed during lectures. How to create and use
% functions. Computes vertical ball position.

function ball_position_xy()
    initial_velocity_x = 2.0;
    initial_velocity_y = 5.0;
    time = 0.6; % Just pick one point in time
    [x_pos, y_pos] = xy(initial_velocity_x, initial_velocity_y, time);
    fprintf('%f %f \n', x_pos, y_pos)
    time = 0.9; % Pick another point in time
    [x_pos, y_pos] = xy(initial_velocity_x, initial_velocity_y, time);
    fprintf('%f %f \n', x_pos, y_pos)
end
function [result1, result2] = xy(v0x, v0y, t)
    g = 9.81; % acceleration of gravity
    result1 = v0x*t;
    result2 = v0y*t - 0.5*g*t^2;
end