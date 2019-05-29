function Direction = Collision(Position,Origin)
%disp('collison')
            DTO =  Origin - Position(1,:);
            Direction(1,:) = DTO;
            [Azimuth, Elevation ] =cart2sph(Direction(1,1),Direction(1,2),Direction(1,3));
            Azimuth = Azimuth +  normrnd(0,pi/4);
            Elevation = Elevation +  normrnd(0,pi/4);
            [Direction(1,1),Direction(1,2),Direction(1,3)] = sph2cart( Azimuth,Elevation,1);          
   
end