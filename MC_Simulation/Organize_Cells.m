function Organized_Array = Organize_Cells(R, Mass,Diameter,Velocities,Directions,Position,Temperature,dt)
%Organize_Cells 
%   Organize molecules into multiple cells
A_Positions = Position(:,1) <0 &Position(:,2) <0 &Position(:,3) <0;
Positions_A = Position(A_Positions,:);
N_A = length(Positions_A);

Velocities_A =  Velocities(A_Positions,:);
Directions_A =  Directions(A_Positions,:);
A = Particles();
A.Initialize_Positions(N_A,R, Mass,Diameter,Velocities_A, Directions_A,Positions_A,Temperature,dt)

% scatter3(a(:,1),a(:,2),a(:,3),'.')
%hold on
B_Positions = Position(:,1) < 0 &Position(:,2) <0 &Position(:,3) >0;
Positions_B = Position(B_Positions,:);
N_B = length(Positions_B);
Velocities_B =  Velocities(B_Positions,:);
Directions_B =  Directions(B_Positions,:);
B = Particles();
B.Initialize_Positions(N_B,R, Mass,Diameter,Velocities_B,Directions_B,Positions_B,Temperature,dt)



C_Positions = Position(:,1) < 0 &Position(:,2) >0 &Position(:,3) >0;
Positions_C = Position(C_Positions,:);
N_C = length(Positions_C);
Velocities_C =  Velocities(C_Positions,:);
Directions_C =  Directions(C_Positions,:);
C = Particles();
C.Initialize_Positions(N_C,R, Mass,Diameter,Velocities_C,Directions_C,Positions_C,Temperature,dt)




D_Positions = Position(:,1) > 0 &Position(:,2) >0 &Position(:,3) >0;
Positions_D = Position(D_Positions,:);
N_D = length(Positions_D);
Velocities_D =  Velocities(D_Positions,:);
Directions_D =  Directions(D_Positions,:);
D = Particles();
D.Initialize_Positions(N_D,R, Mass,Diameter,Velocities_D,Directions_D,Positions_D,Temperature,dt)




E_Positions = Position(:,1) > 0 &Position(:,2) >0 &Position(:,3) <0;
Positions_E = Position(E_Positions,:);
N_E = length(Positions_E);
Velocities_E =  Velocities(E_Positions,:);
Directions_E =  Directions(E_Positions,:);
E = Particles();
E.Initialize_Positions(N_E,R, Mass,Diameter,Velocities_E,Directions_E,Positions_E,Temperature,dt)


F_Positions = Position(:,1) > 0 &Position(:,2) <0 &Position(:,3) >0;
Positions_F = Position(F_Positions,:);
N_F = length(Positions_F);
Velocities_F =  Velocities(F_Positions,:);
Directions_F =  Directions(F_Positions,:);
F = Particles();
F.Initialize_Positions(N_F,R, Mass,Diameter,Velocities_F,Directions_F,Positions_F,Temperature,dt)



G_Positions = Position(:,1) > 0 &Position(:,2) <0 &Position(:,3) <0;
Positions_G = Position(G_Positions,:);
N_G = length(Positions_G);
Velocities_G =  Velocities(G_Positions,:);
Directions_G =  Directions(G_Positions,:);
G = Particles();
G.Initialize_Positions(N_G,R, Mass,Diameter,Velocities_G,Directions_G,Positions_G,Temperature,dt)




H_Positions = Position(:,1) < 0 &Position(:,2) >0 &Position(:,3) <0;
Positions_H = Position(H_Positions,:);
N_H = length(Positions_H);
Velocities_H =  Velocities(H_Positions,:);
Directions_H =  Directions(H_Positions,:);
H = Particles();
H.Initialize_Positions(N_H,R, Mass,Diameter,Velocities_H,Directions_H,Positions_H,Temperature,dt)

Organized_Array = [A,B,C,D,E,F,G,H];


end

