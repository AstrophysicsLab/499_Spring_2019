
% MC Simulation Initialization


N = 1E4; % Number of Molecules
Time = .05;
M = 100;
R = 1; % in Meters
dt = 1E-5;
Iterations = Time/dt;
Molecule_String = 'H2'; % Molecule used
Temperature = 300; % in Kelvin
[Mass, Diameter] = Molecule_Chooser(Molecule_String);
Velocities = Generate_Random_Velocities(N, Temperature, Mass);
Positions = Generate_Random_Positions(N, R);
Directions = Generate_Random_Directions(N);
MC_Molecules = Organize_Cells(R, Mass,Diameter,Velocities,Directions,Positions,Temperature,dt);
% before =MC_Molecules(1).Position(:,:);
% myfig =scatter3(MC_Molecules(1).Position(:,1),MC_Molecules(1).Position(:,2) ,MC_Molecules(1).Position(:,3), '.')  ;
% % myfig.XDataSource = 'MC_Molecules(1).Position(:,1)';
% % myfig.YDataSource = 'MC_Molecules(1).Position(:,2)';
% % myfig.ZDataSource = 'MC_Molecules(1).Position(:,3)';
for iter = 1:Iterations 
    for jdx = 1:8
        for idx = 1:MC_Molecules(jdx).Number_Particles
            MC_Molecules(jdx).Advection(idx);

        end
       % MC_Molecules(jdx).MC_Collision(M)
% % myfig.XData = MC_Molecules(1).Position(:,1);
% % myfig.YData = MC_Molecules(1).Position(:,2);
% % myfig.ZData = MC_Molecules(1).Position(:,3);
    end
   % MC_Molecules = Extract_Cells(MC_Molecules);
end    
    % after = MC_Molecules(1).Position(:,:);
%MC_Molecules = Extract_Cells(MC_Molecules);
View_Cells(MC_Molecules, 0)
