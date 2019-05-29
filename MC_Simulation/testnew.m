clearvars
Time = 1E-9;
dt = 1E-7;
T = 300;
N = 1E5;
Temperature = T*ones(N,1);
Particle_String = 'H2';
Par = MC_Par();
Par.dt = dt;
Par.Set_Molecule(Particle_String);
Positions = Generate_Random_Positions(N, Par.R);
Directions = Generate_Random_Directions(N);
[Velocities,Probabilities] = Generate_Random_Velocities(N, T, Par.Mass);

Additional_Positions = Generate_Random_Positions(N, Par.R);
Additional_Directions = Generate_Random_Directions(N);
Additional_Velocities = Generate_Random_Velocities(N, T, Par.Mass);
Par.Additional_Particles(Additional_Velocities,Additional_Directions,Additional_Positions)


Par.Initialize_Positions(N,Velocities,Directions,Positions,Temperature);
 %Par.Plot_Positions()
 itterations =Time/Par.dt;
 for idx = 1:itterations
 Par.Advection_Array()
  %Par.Plot_Positions()
 end
 %scatter(Velocities,Probabilities,'.');
 Par.Stuck