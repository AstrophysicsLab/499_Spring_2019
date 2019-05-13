function Rotated_Vector = Rotate_Y(Vector, Theta)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
R_Y_Theta = [  cos(Theta),0, sin(Theta); 0, 1, 0;  -sin(Theta), 0,  cos(Theta) ];
Rotated_Vector = R_Y_Theta * Vector';
Rotated_Vector = Rotated_Vector';

end

