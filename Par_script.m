clear Par
Sample_Size = 50;
Surface_Collisons = zeros(1,Sample_Size);
Final_Temperature = zeros(1,Sample_Size);
Par = Particle_3D();
Par.Set_Intial_Position();
Par.Set_Temperature_Particle( 300)
Par.Set_Random_Factor(1);
Par.Set_Temperture_Loss_Constant( .005);
% Par.Run_Particle(.5);
% 
for idx = 1:Sample_Size
%    Par.Run_Particle(1)
    Par.Quick_Run(1);
    Surface_Collisons(idx) = Par.Surface_Collisons;
    Final_Temperature(idx) = Par.Temperature;
    clear Par
    Par = Particle_3D();
    Par.Set_Intial_Position();
    Par.Set_Temperature_Particle( 300)
end

Mean_Final_Temperature = mean(Final_Temperature);
Mean_Surface_Collisons = mean(Surface_Collisons);