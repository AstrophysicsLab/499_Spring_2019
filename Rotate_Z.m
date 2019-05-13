function Rotated_Vector = Rotate_Z(Vector, Theta)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
R_Z_Theta = [ cos(Theta), -sin(Theta), 0; sin(Theta), cos(Theta), 0; 0, 0, 1 ];
Rotated_Vector = R_Z_Theta * Vector';
Rotated_Vector = Rotated_Vector';

end

