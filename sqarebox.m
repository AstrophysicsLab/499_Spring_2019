R = 1;
Initial_Position = [1/sqrt(3), 1/sqrt(3), 1/sqrt(3) ];
Collision = [-1, 0, 0];
direction = (Collision- Initial_Position) /norm(Collision- Initial_Position);
vec =direction;
X = vec(1);
Y = vec(2);
Z = vec(3);
v = 1;
dt = .01;
origin = [0,0,0];
angled = asin(norm(cross(Collision,vec))/(norm(Collision)*norm(vec)))*180/pi;

P = Initial_Position;
P(end+1,:) = P(end,:) + v*dt*vec;
 for idx = 1:250    
      if norm(P(end,:)) > 1- 5E-4
      disp('Collision')
      [a,b] = cart2sph(vec(1),vec(2),vec(3));
      a = -a ;
      b = b ;
      [vec(1),vec(2),vec(3)] = sph2cart(a,b,1);
      end
    P(end+1,:) = P(end,:) + v*dt*vec;

     
 end
 
%  aa = cross(P(end,:),vec);
%  Pa = P(end,:);
%  for idx = 1:70
%     Pa(end+1,:) = Pa(end,:) + v*dt*aa; 
%  end
%  Pax = Pa(:,1);Pay = Pa(:,2);Paz = Pa(:,3);
 Px = P(:,1);
 Py = P(:,2);
 Pz = P(:,3);
 plot3(Px,Py,Pz)
 grid on
hold on
%  plot3(Pax,Pay,Paz)
phi = linspace(0,2*pi,200);
r = linspace(1,1,200);
cirZ = linspace(0,0,200);
[cirX, cirY] = pol2cart(phi,r);
plot3(cirX, cirY,cirZ)
plot3(cirX, cirZ, cirY)
plot3(cirZ, cirY,cirX)