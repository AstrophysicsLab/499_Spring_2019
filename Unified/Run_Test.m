function Stuck =Run_Test(N,Time, Sample_Size)

%Time = 0.001;
dt = 1E-7;
T = 300;
%N = 1;
%Sample_Size = 10;
Temperature = T*ones(N,1);
Particle_String = 'H2';

H2 = MC_Par();
H2.Set_Molecule(Particle_String);

parfor jdex = 1:Sample_Size
    
   Particle_Array(jdex) = MC_Par();
   Particle_Array(jdex).dt =dt;
   Particle_Array(jdex).Set_Molecule(Particle_String);
   Positions = Generate_Random_Positions(N,Particle_Array(jdex).R);
Directions = Generate_Random_Directions(N);
Velocities = Generate_Random_Velocities(N, T, Particle_Array(jdex).Mass);
Additional_Positions = Generate_Random_Positions(N, Particle_Array(jdex).R);
Additional_Directions = Generate_Random_Directions(N);
Additional_Velocities = Generate_Random_Velocities(N, T, Particle_Array(jdex).Mass);
   Particle_Array(jdex).Additional_Particles(Additional_Velocities,Additional_Directions,Additional_Positions)
   Particle_Array(jdex).Initialize_Positions(N,Velocities,Directions,Positions,Temperature);
end


 %Par.Plot_Positions()
 itterations =Time/dt;
 Stuck =  zeros(Sample_Size,1);
 parfor kdx = 1: Sample_Size
    disp(datestr(now))
    disp(kdx)
     for idx = 1:itterations
        Particle_Array(kdx).Advection_Array()
            %Par.Plot_Positions()
            
     end
     Stuck(kdx) = Particle_Array(kdx).Stuck
        %scatter(Velocities,Probabilities,'.');
        
        
 end
 
 
 disp(mean(Stuck))
 disp(std(Stuck))
end