classdef  Particle< handle
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Acceleration;
        Velocity =1200; %m/s
        Mass;
        Energy;
        Temperature;
        Position = [0,0];
        Direction_Carte;
        Direction_Theta;
     
    end
    
    methods
        
        function Update_Particle(obj, dt)
            obj.Position(end+1, 1) = obj.Position(end,1) 
        end
      
        
    end
    
end

