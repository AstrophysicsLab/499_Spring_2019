clearvars
Time = 0.001;
dt = 1E-7;
T = 300;
N = 1E5;
Sample_Size = 10;
Temperature = T*ones(N,1);
Particle_String = 'H2';
load('10milVelocities.mat');
load('10milDirections.mat');
load('10milPositions.mat');


parfor jdex = 1:Sample_Size
    q = randperm(1E7,N)
    j = randperm(1E7,N)
    
   Particle_Array(jdex) = MC_Par();
   Particle_Array(jdex).dt =dt;
   Particle_Array(jdex).Set_Molecule(Particle_String);
  
   Particle_Array(jdex).Additional_Particles(Velocities(j),Direction(j),Position(j))
   Particle_Array(jdex).Initialize_Positions(N,Velocities(q),Direction(q),Position(q),Temperature);
end


 %Par.Plot_Positions()
 itterations =Time/dt;
 Stuck =  zeros(Sample_Size,1);
 parfor kdx = 1: Sample_Size
    
     for idx = 1:itterations
        Particle_Array(kdx).Advection_Array()
            %Par.Plot_Positions()
            
     end
     Stuck(kdx) = Particle_Array(kdx).Stuck
        %scatter(Velocities,Probabilities,'.');
        
        
 end
 
 disp(Stuck(:))