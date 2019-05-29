clearvars
Sample_Size = 1;
T = 300;
Surface_Collisons = zeros(1,Sample_Size);
Final_Temperature = zeros(1,Sample_Size);
N = 1;
Particle_String = 'H2';
Par = Particle_Sim();
%Par.Set_Intial_Position();
Position = Generate_Random_Positions(N, Par.R);
Direction = Generate_Random_Directions(N);
Par.Set_Position(Position);
Par.Set_Direction(Direction);
Par.Set_Molecule(Particle_String)
Velocities = Generate_Random_Velocities(N, T, Par.Mass);
Par.Set_Velocity(Velocities)
Par.Set_Temperature_Particle( T)
%Par.Set_Random_Factor(1);
%Par.Set_Temperture_Loss_Constant( .005);
% Par.Run_Particle(.5);
% 
% Par.Run_Particle(.002);
Par.Quick_Run(1);
% for idx = 1:Sample_Size
% %    Par.Run_Particle(1)
%     Par.Quick_Run(1);
%     Surface_Collisons(idx) = Par.Surface_Collisons;
%     Final_Temperature(idx) = Par.Temperature;
%     clear Par
%     Par = Particle_Sim();
%   Position = Generate_Random_Positions(N, Par.R);
% Direction = Generate_Random_Directions(N);
% Par.Set_Position(Position);
% Par.Set_Direction(Direction);
% Par.Set_Molecule(Particle_String)
% Par.Set_Temperature_Particle( 300)
% Velocities = Generate_Random_Velocities(N, T, Par.Mass);
% Par.Set_Velocity(Velocities)
%  end
% % 
% % Mean_Final_Temperature = mean(Final_Temperature);
%  Mean_Surface_Collisons = mean(Surface_Collisons);