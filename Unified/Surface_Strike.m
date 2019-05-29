function  Surface_Strike(Position)

            if Position(1,3) > 0.0005 || Position(1,3) < -0.0005
                return true;
          
            elseif norm(Position(1,1:2)) < 0.005
                     Result = 1;    
            end
         
        end