dt =0.01;
t =0:dt:10;
Vel_Mag = 10;
rand_direction = randi([1 3], 1);
R = 6;
Z_Bounds = [-5,5]; 
Y_Bounds = [-5,5];
X_Bounds = [-5, 5];
hi = 75;
low = 1;
Start_Position = [1,1,1]; % X,y,Z
Start_Velocity = [6 , 3 , 4];


Start_Acceleration = [0,0, 0];
R_0 = Start_Position;
V_0 = Start_Velocity;
R_f = [];
Pos_Log = zeros(length(t),3);
Vel_Log  = zeros(length(t),3);
for idx = 1:length(t)
% if R_0(3) >= Z_Bounds(2) ||  R_0(3) <= Z_Bounds(1)
% %      disp('X wall')
%       V_0(3) =  -1*V_0(3);
% %     V_0(3) =  -1*(2/3) * Vel_Mag;
% %     temp = randi([0 1],1);
% %     switch temp
% %         case 0 
% %             V_0(1) =2/9 * Vel_Mag;
% %             V_0(2) = 1/9 * Vel_Mag;
% %         case 1 
% %             V_0(2) = 2/9 * Vel_Mag;
% %             V_0(1) = 1/9 * Vel_Mag;
% %     end
% end   
% if R_0(1) <= X_Bounds(1) ||  R_0(1) >= X_Bounds(2)
%      disp('X wall')
%      V_0(1) =  -1*V_0(1);
% %     V_0(1) =  -1*(2/3) * Vel_Mag;
% %     temp = randi([0 1],1);
% %     switch temp
% %         case 0 
% %             V_0(2) =2/9 * Vel_Mag;
% %             V_0(3) = 1/9 * Vel_Mag;
% %         case 1 
% %             V_0(3) = 2/9 * Vel_Mag;
% %             V_0(2) =1/9 * Vel_Mag;
% %     end
% end   
% if R_0(2) <= Y_Bounds(1) ||  R_0(2) >= Y_Bounds(2)
%    disp('Y wall')
%       V_0(2) =  -1*V_0(2);
% %     V_0(2) =  -1*(2/3) * Vel_Mag;
% %     temp = randi([0 1],1);
% %     switch temp
% %         case 0 
% %             V_0(1) = 2/9 * Vel_Mag;
% %             V_0(3) = 1/9 * Vel_Mag;
% %         case 1 
% %             V_0(3) = 2/9 * Vel_Mag;
% %             V_0(1) = 1/9 * Vel_Mag;
% %     end
% end   
if norm(R_0) >= R
    [temp_max, max_idx] = max(R_0);
    V_0(max_idx) = V_0(max_idx)*-1;
    
end
R_f = R_0+V_0*dt;
R_0 = R_f;
Pos_Log(idx,:) =R_f;
Vel_Log(idx,:) = V_0;
% plot3(Pos_Log(1:idx,1),Pos_Log(1:idx,2), Pos_Log(1:idx,3) )
% xlim([-6 6])
% ylim([-5 5])
% zlim([-1 7])
% pause(.001)
end
plot3(Pos_Log(:,1),Pos_Log(:,2), Pos_Log(:,3) )
 xlim([-6 6])
 ylim([-6 6])
 zlim([-6 6])
