function Probable_Velocity = Probable_Thermal_Velocity(Mass, Temperature)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
Kb = 1.38064852E-23;
Probable_Velocity = sqrt((2*Kb*Temperature)/(Mass));
end

