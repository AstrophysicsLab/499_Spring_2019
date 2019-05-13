classdef Particle_3D < handle
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        R = 0.2;
        Origin = [0,0,0];
        Energy;
        Temperature;
        Velocity;
        dt = 1E-5;
        Mass;
        Momentum;
        Initial_Position =[];
        Position;
        Position_Log;
        Direction_Vector = [-0.8881,   -0.3251,   -0.3251];
        Direction_to_Origin;
        Azimuth;
        Elevation;
        Pitch;
        Yaw;
        Roll;
        Random_Factor =0.5;
        Wall_Collisons = 0;
        Wall_Temperature = 310;
        Surface_Collisons = 0;
        Surface_Temperature = 10;
        
        Temperture_Loss_Constant =0.05;
    end
    
    methods
        
        function Set_Temperature_Particle(obj, Temp)
            H_2_g_mol = 2.01588;
            Avogadro = 6.022140857E23; % mol-1
            obj.Mass = H_2_g_mol*1/Avogadro *1/1000;
            obj.Temperature = Temp;
            obj.Velocity = Probable_Thermal_Velocity(obj.Mass, obj.Temperature);
           
        end
        
        function Set_Temperture_Loss_Constant(obj, val)
           obj.Temperture_Loss_Constant = val;            
        end
     
        function Set_Random_Factor(obj, val)
           obj.Random_Factor = val; 
           
        end
        function Set_Intial_Position(obj)
            obj.Initial_Position = [obj.R/sqrt(3), obj.R/sqrt(3), obj.R/sqrt(3) ];
            obj.Position_Log = [obj.R/sqrt(3), obj.R/sqrt(3), obj.R/sqrt(3) ];
            obj.Position = obj.Position_Log;
        end
        
        function Get_Spherical(obj)
            [obj.Azimuth, obj.Elevation ] = cart2sph(obj.Direction_Vector(1),obj.Direction_Vector(2),obj.Direction_Vector(3));
        end
        
        function  Get_YPR(obj)
            obj.Yaw = atan2(obj.Direction_Vector(2),obj.Direction_Vector(1));
        end
      
        function Collision_Check(obj)
             if norm(obj.Position(1,:)) > obj.R- (obj.Velocity*obj.dt)
                obj.Wall_Collisons = obj.Wall_Collisons + 1;     
                obj.Set_Temperature_Particle(obj.Wall_Temperature);
                obj.Random_Direction();
             end
            
        end
        
        function Surface_Check(obj)
            
             if obj.Direction_Vector(3)< 0 && obj.Position(1) > -0.01...
                      &&  obj.Position(1) < 0.01 && obj.Position(2) > -0.01 &&  obj.Position(2) < 0.01...
                      && obj.Position(3) > 0 &&  obj.Position(3) < obj.Velocity*obj.dt 
                obj.Surface_Collisons = obj.Surface_Collisons + 1;          
                obj.Get_Spherical();
                obj.Azimuth = obj.Azimuth + pi*obj.Random_Factor*randn;
                obj.Elevation =  obj.Elevation + pi*obj.Random_Factor*randn;
                [obj.Direction_Vector(1),obj.Direction_Vector(2),obj.Direction_Vector(3)] = sph2cart( obj.Azimuth,obj.Elevation,1);
                %obj.Set_Temperature_Particle( (obj.Temperature - obj.Temperature* obj.Temperture_Loss_Constant));
                obj.Set_Temperature_Particle(obj.Surface_Temperature);
             end
            
        end
        
            function Random_Direction(obj)
            obj.Direction_to_Origin =  obj.Origin - obj.Position(1,:);
            obj.Direction_Vector = obj.Direction_to_Origin;
            obj.Get_Spherical();
            obj.Azimuth = obj.Azimuth + 2*pi*0.05*randn;
            obj.Elevation =  obj.Elevation + 2*pi*0.05*randn;
            [obj.Direction_Vector(1),obj.Direction_Vector(2),obj.Direction_Vector(3)] = sph2cart( obj.Azimuth,obj.Elevation,1);
        end
        
        function Rotate_Direction(obj)
              obj.Direction_Vector = Rotate_Z(obj.Direction_Vector, pi/4  );
              % obj.Direction_Vector = Rotate_Y(obj.Direction_Vector, pi  );
              % obj.Direction_Vector = Rotate_X(obj.Direction_Vector, pi  );
            
        end
        function Run_Particle(obj,Time )
             Iterations = (Time/obj.dt);
             obj.Position_Log(end+1,:) = obj.Position_Log(end,:) + obj.Velocity*obj.dt*obj.Direction_Vector;
             obj.Position = obj.Position_Log(end,:);
              for idx = 1:Iterations   
%                if norm(obj.Position_Log(end,:)) > 1- 5E-4
%                disp('Collision')          
%                break
%                end
                obj.Collision_Check();
                obj.Surface_Check();
                obj.Position_Log(end+1,:) = obj.Position_Log(end,:) + obj.Velocity*obj.dt*obj.Direction_Vector;
                obj.Position = obj.Position_Log(end,:);
             end
             obj.Plot();
        end
        
        
        
        
        function Quick_Run(obj,Time )
              Iterations = (Time/obj.dt);
              obj.Position = obj.Position(1,:) + obj.Velocity*obj.dt*obj.Direction_Vector;
              for idx = 1:Iterations   
                obj.Collision_Check();
                obj.Surface_Check();
                obj.Position = obj.Position(1,:) + obj.Velocity*obj.dt*obj.Direction_Vector;
             end
            
        end
        
        
        function Plot(obj)
            plot3(obj.Position_Log(:,1),obj.Position_Log(:,2),obj.Position_Log(:,3))
            grid on
            hold on 
            phi = linspace(0,2*pi,200);
            r = linspace(obj.R,obj.R,200);
            Surface_r =linspace(0.02,0.02,200);
            cirZ = linspace(0,0,200);
            [cirX, cirY] = pol2cart(phi,r);
            plot3(cirX, cirY,cirZ)
            plot3(cirX, cirZ, cirY)
            plot3(cirZ, cirY,cirX)
            [Surface_cirX, Surface_cirY] = pol2cart(phi,Surface_r);
             plot3(Surface_cirX, Surface_cirY,cirZ)
        end
        
    end
end

