T = 300;
R = 0.16;
N = 1E7;
Particle_String = 'H2';
Par = Particle_Sim();
Par.Set_Molecule(Particle_String);
Position = Generate_Random_Positions(N, R);
Direction = Generate_Random_Directions(N);
% Velocities = zeros(500,1);
Velocities = Generate_Random_Velocities(N, T, Par.Mass);



%hist(Velocities)