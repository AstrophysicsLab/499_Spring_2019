function Rotated_Vector = Rotate_X(Vector, Theta)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
R_X_Theta = [ 1, 0, 0; 0,  cos(Theta), -sin(Theta); 0,  sin(Theta), cos(Theta) ];
Rotated_Vector = R_X_Theta * Vector';
Rotated_Vector = Rotated_Vector';

end

