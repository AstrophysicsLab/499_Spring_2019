v_0 = 1754;
dt =1E-6;
t = 0:dt:2;
R = 0.3;
[x,y,z] = Random_Direction();
XYZ = [x,y,z];
p_0 = [0,0,0];
pf = [0,0,0];
for idx = 1:length(t)
    if norm(p_0) > R
       disp('wall');
       disp(norm(p_0));
       [x,y,z] = Random_Direction();
       XYZ = [x,y,z];
    end
pf(idx,:) =p_0 +v_0*XYZ*dt;
p_0 = pf(idx,:);
end