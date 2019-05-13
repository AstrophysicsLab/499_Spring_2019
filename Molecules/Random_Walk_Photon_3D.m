%Random walk photon 3D
N = 100000;
Origin = [0,0,0];
mean_free_path_length = 0.05; % m
Velocity_Photon = 3E8; %m/s
dt = mean_free_path_length/Velocity_Photon; 
Initial_Position = [0,0,0];
Final_Position = [0,0,0];
XYZ = mean_free_path_length*Random_Direction();


for idx = 1:N
    %XYZ = mean_free_path_length*Random_Direction();
    Final_Position(idx,:) = Initial_Position + mean_free_path_length*Random_Direction();
    Initial_Position = Final_Position(idx,:); 
end
X = Final_Position(:,1);
Y = Final_Position(:,2);
Z = Final_Position(:,3);
Net_Displacement =norm(Final_Position(end,:) -  Origin);
disp('Net_Displacement')
disp(Net_Displacement)
   
    plot3(X(:),Y(:),Z(:)) 
    
