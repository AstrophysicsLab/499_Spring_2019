function  Calculate_Distance(MC_Molecules,dt)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
R =MC_Molecules(1).Radius_Chamber;
Volume = 1/8*(4/3 *pi *R^3);
Octant = 8;
d = MC_Molecules(1).Diameter;

for idx = 1:Octant
    N_c = MC_Molecules(idx).Number_Particles;
    V_r_Max = abs(max(MC_Molecules(idx).Velocity)-min(MC_Molecules(idx).Velocity) );
    %M_c = (N_c^2*pi*d^2)/(2*Volume)
    
 for jdx = 1:N_c-1   
   V_R= (MC_Molecules(Octant).Velocity(jdx) -  MC_Molecules(Octant).Velocity(jdx+1)); 
    
end





end

