clearvars
T = 300;
R = 0.16;
Surface_Collisons = zeros(1,Sample_Size);
Final_Temperature = zeros(1,Sample_Size);
N = 10;
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

parfor idx = 1:N

    Particle_Array(idx).Quick_Run(1);
   
   
 end
