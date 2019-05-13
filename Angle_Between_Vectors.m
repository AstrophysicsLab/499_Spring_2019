function [Normal,Angle] = Angle_Between_Vectors(A,B)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

Cross_AB = cross(A,B);
Normal = Cross_AB/norm(Cross_AB);
Angle = asin(norm(Cross_AB)/ (norm(A)*norm(B)));


end

