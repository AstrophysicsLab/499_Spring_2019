% Spherical_Partcles
R = 1;  % Radius of chamber meters 
Intial_Point_XYZ = [R/sqrt(3),R/sqrt(3),R/sqrt(3)];    
V = 1450; 
% Velocity of particle in m/s
dt = .1E-5; % sum over time factor
Collision_Point_NegX = [-R, 0, 0];  % Testing first collison
Collision_Point_NegZ = [0, .1, 0.3];
%Collision_Point_NegZ = [0, -R/sqrt(2), -R/sqrt(2)];
Origin_XYZ = [0,0,0];   % Origin of sphere
Path_Vector_NegX = Collision_Point_NegX - Intial_Point_XYZ;   % Vector pointing from start to first collision
Path_Vector_NegX =Path_Vector_NegX/norm(Path_Vector_NegX);    % normalize the path vector
% Get the incident angles
[Phi_NegX, Theta_NegX, r_NegX ]  =cart2sph(Path_Vector_NegX(1),Path_Vector_NegX(2), Path_Vector_NegX(3));
% Calculate the deflection angle
Origin_VectorX = Collision_Point_NegX - Origin_XYZ; % Vector from orgin to collision
Collision_Angle_NegX =asin(norm(cross(Path_Vector_NegX,Origin_VectorX))/(norm(Origin_VectorX)*norm(Path_Vector_NegX)));
Cross_NegX =cross(Path_Vector_NegX,Origin_VectorX);
[cross_phi_X, cross_theta_X , rx] =cart2sph(Cross_NegX(1),Cross_NegX(2), Cross_NegX(3));


Path_Vector_NegZ = Collision_Point_NegZ - Intial_Point_XYZ;   % Vector pointing from start to first collision
Path_Vector_NegZ =Path_Vector_NegZ/norm(Path_Vector_NegZ);    % normalize the path vector
% Get the incident angles
[Phi_NegZ, Theta_NegZ, r_NegZ ]  =cart2sph(Path_Vector_NegZ(1),Path_Vector_NegZ(2), Path_Vector_NegZ(3));
% Calculate the deflection angle
Origin_VectorZ = Collision_Point_NegZ - Origin_XYZ; % Vector from orgin to collision
Collision_Angle_NegZ =asin(norm(cross(Path_Vector_NegZ,Origin_VectorZ))/(norm(Origin_VectorZ)*norm(Path_Vector_NegZ)));
Cross_NegZ = cross(Path_Vector_NegZ,Origin_VectorZ);
[cross_phi_Z, cross_theta_Z , rz] =cart2sph(Cross_NegZ(1),Cross_NegZ(2), Cross_NegZ(3));

% 
% 
% New_Phi =  Phi + pi - 2*(Collision_Angle);
% New_Theta =
% [NewX, NewY] = sph2cart(((angle+2*pi) +pi -2*(collision_angle))-2*pi, 1);
% Position_pnt = Collision_pnt;
% XY = [NewX,NewY];
% current_pos =Colision_pnt;
% pf = [0,0];
% t = 0:dt:4;
% for idx = 1:length(t)
%    if norm(pf(end,:)) > 1- 5E-4
%        disp('colision');
%         New_Colision_pnt = pf(end,:);
%         [angle , r ] =cart2pol(XY(1),XY(2));
%         Center_vector = New_Colision_pnt - Center_pnt;
%         colision_angle = acos(dot(XY,Center_vector));
%         colision_angle = real((colision_angle + ( -0.0873 +(0.0873+0.0873) * rand(1) ) ));
%        disp(colision_angle*180/pi)
%         [NewX, NewY] = pol2cart(((angle+2*pi) +pi -2*(colision_angle))-2*pi, 1);
%         
%         XY = [NewX,NewY];
%         
%    end 
% pf(idx,:) = current_pos + V*XY*dt  ;  
%    current_pos = pf(end,:);
% end
% plot(pf(:,1),pf(:,2))
% grid on
% hold on
% phi = linspace(0,2*pi,200);
% r = linspace(1,1,200);
% [cirX, cirY] = pol2cart(phi,r);
% plot(cirX, cirY)