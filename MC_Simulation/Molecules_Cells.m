classdef  Molecules_Cells<handle
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
      
        Velocity = [];
        Position = [0,0,0];
     
    end
    
    methods
        
        function show_data(obj)
            disp(obj.Velocity)
            disp(obj.Position)
        end
        
    end
    
end

