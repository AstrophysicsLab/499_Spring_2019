clearvars
T = 300;
R = 0.16;
N = 500;
Particle_String = 'H2';
Par = Particle_Sim();
Par.Set_Molecule(Particle_String);
Position = Generate_Random_Positions(N, Par.R);
Direction = Generate_Random_Directions(N);
Velocities = Generate_Random_Velocities(N, T, Par.Mass);
for idx = 1:N
    Particle_Array(idx) = Particle_Sim;
    Particle_Array(idx).Set_Molecule(Particle_String)
    Particle_Array(idx).Set_Position(Position(idx,:));
    Particle_Array(idx).Set_Direction(Direction(idx,:));
    Particle_Array(idx).Set_Velocity(Velocities(idx))
    Particle_Array(idx).Set_Temperature_Particle( T)
end

% Par.Run_Particle(.002);
coll_array =zeros(N,1);
stuck_array = zeros(N,1);
parfor idx = 1:N
    
    coll_array(idx,1) =Particle_Array(idx).Quick_Run_Stick(1);
    stuck_array(idx,1) =Particle_Array(idx).Stuck;
   
end
 
final= zeros(N,2);
final(:,1) = coll_array(:);
final(:,2) = stuck_array(:);
