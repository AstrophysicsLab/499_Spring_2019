function Mean_Velocity = Mean_Thermal_Velocity(Mass, Temperature)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
Kb = 1.38064852E-23;
 Mean_Velocity = sqrt((8*Kb*Temperature)/(pi*Mass));
end

