function Extracted_Array = Extract_Cells(MC_Molecules)
%Extract_Cells 
%   Extract molecules after they moved
N = 0;
Mass = MC_Molecules(1).Mass(1);
Temperature = MC_Molecules(1).Temperature;
Diameter = MC_Molecules(1).Diameter;
R = MC_Molecules(1).Radius_Chamber;
dt = MC_Molecules(1).dt;
for idx = 1:8
N = N + MC_Molecules(idx).Number_Particles;
end
Velocities_new =zeros(N,1);
Positions_new = zeros(N,3);
Directions_new = zeros(N,3);
    
start = 1;
n = 0;
for jdx = 1:8
    n = n + MC_Molecules(jdx).Number_Particles ;  
    Velocities_new(start:n,1) = MC_Molecules(jdx).Velocity(:);    
    Positions_new(start:n,:) = MC_Molecules(jdx).Position(:,:);  
    Directions_new(start:n,:) = MC_Molecules(jdx).Direction(:,:);
    start = n+1;
end

 Extracted_Array= Organize_Cells(R, Mass,Diameter,Velocities_new,Directions_new,Positions_new,Temperature,dt);
end

