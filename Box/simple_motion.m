dt = 0.1;
R = 10;
t= 0+dt:dt:10;
v = [3,1,4]; % 3m/s
a = [0,0,0];
pos_i = [0,0,0];
pos = zeros(length(t),3);
pos(1,:) = pos_i;
for idx = 1:length(t)
    pos_f =pos_i+v*dt + a/2*dt^2;
    if norm(pos_f) >= R 
        disp('wall')
        v =randi([0 3], 1,3);
    end
    pos(idx+1,:) = pos_f;
    pos_i = pos_f;
end

