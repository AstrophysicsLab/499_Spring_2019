
R = 1;  %1 meter
R = 0.3048;  % 12 inches
X_0 = R/sqrt(2);
Y_0 = X_0;
XY = [X_0, Y_0];
XY = XY;
V = 1550;
dt = .1E-4;
Position_pnt = [X_0, Y_0];
Colision_pnt = [-1, 0];
Center_pnt = [0,0];
path_vector = Colision_pnt - Position_pnt;
path_vector =path_vector/norm(path_vector);
[angle , r ] =cart2pol(path_vector(1),path_vector(2));
Center_vector = Colision_pnt - Center_pnt;
colision_angle = acos(dot(path_vector,Center_vector));
[NewX, NewY] = pol2cart(((angle+2*pi) +pi -2*(colision_angle))-2*pi, 1);
Position_pnt = Colision_pnt;
XY = [NewX,NewY];
current_pos =Colision_pnt;
pf = [0,0];
t = 0:dt:1;
for idx = 1:length(t)
   if norm(pf(end,:)) > 1- 5E-4
       % disp('colision');
        New_Colision_pnt = pf(end,:);
        [angle , r ] =cart2pol(XY(1),XY(2));
        Center_vector = New_Colision_pnt - Center_pnt;
        colision_angle = acos(dot(XY,Center_vector));
        colision_angle = real((colision_angle + ( -0.0873 +(0.0873+0.0873) * rand(1) ) ));
   %     disp(colision_angle*180/pi)
        [NewX, NewY] = pol2cart(((angle+2*pi) +pi -2*(colision_angle))-2*pi, 1);
        
        XY = [NewX,NewY];
        
   end 
pf(idx,:) = current_pos + V*XY*dt  ;  
   current_pos = pf(end,:);
   
end
plot(pf(:,1),pf(:,2))
grid on
hold on
phi = linspace(0,2*pi,200);
r = linspace(1,1,200);
[cirX, cirY] = pol2cart(phi,r);
plot(cirX, cirY)