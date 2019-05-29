 load('10milPositions.mat')
load('10milDirections.mat')
load('10milVelocities.mat')
 Origin = [0,0,0];
dt = 1E-7;
Total_Time = 5;

t = 0:dt:Total_Time;

N = 1E4;
Timecode_Array = zeros(N,1);
Random_Ind = randperm(1E7,N);
N_Positions = Position(Random_Ind,:);
N_Directions =  Direction(Random_Ind,:); 
N_Velocities = Velocities(Random_Ind);
parfor idx = 1:N
    Stuck = 0;
    Time = 0;
    Random_Indices = randperm(N,3);
    Pos = N_Positions(Random_Indices(1),:);
    Dir =  N_Directions(Random_Indices(2),:); 
    Velocity = N_Velocities(Random_Indices(3));
    while Stuck == 0
        Time = Time+1;    
        Pos =Advance(Pos,Dir,Velocity,dt );
        if norm(Pos)> 0.16
            Dir = Collision(Pos,Origin);

        elseif  Pos(1,3) < 0.0005 && Pos(1,3) > -0.0005
           
            if  norm(Pos(1,1:2)) < 0.005
            Timecode_Array(idx) = t(Time);
            Stuck = 1;
            end
        end 
    end
end